local modName = "RitnLog"
-------------------------------------------------------------------------------
--local RitnLog = require("lualib.classes.RitnLog")
--local RitnEvent = require("lualib.classes.RitnEvent")
--local RitnPlayer = require("lualib.classes.RitnPlayer")
-------------------------------------------------------------------------------

-- function ignore event
local function ignore(e) return end

-- ritnlog
local function ritnlog(data, mod_name, force_print) 
    pcall(function()
        if mod_name == nil then mod_name = modName end
        local print_ok = false
        if global.log.use_print then 
            print('[' .. string.upper(mod_name) .. '] > ' .. game.table_to_json(data)) 
            print_ok = true
        end
        if global.log.use_log then 
            log('[' .. string.upper(mod_name) .. '] > ' .. game.table_to_json(data)) 
        end
        if force_print == nil then return end
        if force_print == true and print_ok == false then 
            print('[' .. string.upper(mod_name) .. '] > ' .. game.table_to_json(data)) 
        end
    end)
end

-- getEvents
local function getEvents(e, details)
    local RitnEvent = {
        type = "none",
    }
    local RitnDetails

    if details ~= nil then  
        RitnEvent.type = "details"
        RitnEvent.details = details
        RitnDetails = details
    end

    if e ~= nil then 
        for name,ev in pairs(defines.events) do
            if e.name == 0 then return end
            if defines.events[name] ==  e.name then 
                RitnEvent.type = "event"
                RitnEvent.event = {
                    id = ev,
                    event_name = name,
                    details = RitnDetails,
                }
            end
        end
    end

    return RitnEvent
end


-- function event basic
local function basic(e) 
    if e.name == 0 then return end
    --local RitnLog = RitnLog()
    ritnlog(getEvents(e))
end


-- ajoute le player index à l'event (pour les events : on_player)
local function addPlayerIndex(e, event)
    local LuaPlayer = game.players[e.player_index]
    event.player_index = LuaPlayer.index
    event.player_name = LuaPlayer.name
end

-- ajoute le player type de controller à l'event (pour les events : on_player)
local function addController(e, event)
    local LuaPlayer = game.players[e.player_index]
    event.controller_type = LuaPlayer.controller_type
end



-- ritnlog for events : on_player
local function event_on_player(e)
    local RitnEvent = getEvents(e)
    local LuaPlayer = game.players[e.player_index]

    RitnEvent.event.player = {
        index = LuaPlayer.index,
        name = LuaPlayer.name,
    }

    if global.settings.option_player_advanced == true then 
        RitnEvent.event.player.force_name = LuaPlayer.force.name
        RitnEvent.event.player.surface_name = LuaPlayer.surface.name
        RitnEvent.event.player.controller_type = LuaPlayer.controller_type
    end
    return RitnEvent
end

-- fonction standard for events : on_player
local function on_player_standard(e)
    local LuaPlayer = game.players[e.player_index]
    local RitnEvent = {}
    if not global.log.players[LuaPlayer.name] then return RitnEvent, LuaPlayer end
    RitnEvent = event_on_player(e)
    return RitnEvent, LuaPlayer
end

-- fonction standard on_player -> ritnlog()
local function on_player_log(e, active) 
    if active == nil or active == true then 
        local RitnEvent = on_player_standard(e)
        ritnlog(RitnEvent) 
    end
end


------------------------------------------
local flib = {}
flib.log = ritnlog
flib.events = {
    ignore = ignore,
    basic = basic,
    get = getEvents,
    player = {
        standard = on_player_standard,
        log = on_player_log,
    }
}
flib.player = {
    get = event_on_player,
    add_index = addPlayerIndex,
    add_controller = addController,
}
------------------------------------------
return flib