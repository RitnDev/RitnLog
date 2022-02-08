local modName = "RitnLog"
local option_print = settings.startup[ritnlog.defines.settings.name.enable_log_print].value
local option_logfile = settings.startup[ritnlog.defines.settings.name.enable_log_log].value

-- function ignore event
local function ignore(e) return end

-- ritnlog
local function ritnlog(data, mod_name) 
    if mod_name == nil then mod_name = modName end

    if option_print or (option_print == false and option_logfile == false) then 
        print('[' .. string.upper(mod_name) .. '] > ' .. game.table_to_json(data)) 
    end

    if option_logfile then 
        log('[' .. string.upper(mod_name) .. '] > ' .. game.table_to_json(data)) 
    end
end

-- getEvents
local function getEvents(e)
    for name,event in pairs(defines.events) do
        if e.name == 0 then return end
        if defines.events[name] ==  e.name then 
            local event = {
                type = "event",
                event = event,
                event_name = name,
            }
            return event
        end
    end
end


-- function event basic
local function basic(e) 
    if e.name == 0 then return end
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
    local event = getEvents(e)
    addPlayerIndex(e, event)
    addController(e, event)
    return event
end

-- fonction standard for events : on_player
local function on_player_standard(e)
    pcall(function()
        local LuaPlayer = game.players[e.player_index]
        if not global.log.players[LuaPlayer.name] then return end
        local event = event_on_player(e)

        global.log.events[e.name].active = true

        ritnlog(event)
    end)
end



------------------------------------------
local flib = {}
flib.log = ritnlog
flib.events = {
    ignore = ignore,
    basic = basic,
    get = getEvents,
    on_player = {
        standard = on_player_standard
    },
}
flib.player = {
    get = event_on_player,
    add_index = addPlayerIndex,
    add_controller = addController,
}
------------------------------------------
return flib