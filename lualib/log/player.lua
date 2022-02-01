----------------------------------------------------------------------------------------
local flib = require(ritnlog.defines.functions.events)
local event_type = "on_player"
----------------------------------------------------------------------------------------
-- settings
local all_option = settings.startup[ritnlog.defines.settings.name.player_all_option].value
local position_option = settings.startup[ritnlog.defines.settings.name.player_position_option].value
local position_advanced = true
local cursor_stack_option = settings.startup[ritnlog.defines.settings.name.player_cursor_option].value
----------------------------------------------------------------------------------------
-- declenche des events pour création des infos par defaut du jeu
local function active_default()
    if global.log.default_active == false then 
        -- create force by default (neutral, enemy, player)
        local ev = {name = defines.events.on_force_created,}
        local event = flib.events.get(ev)
        -- neutral
        event.index = game.forces['neutral'].index
        event.force_name = game.forces['neutral'].name
        flib.log(event)
        -- enemy
        event.index = game.forces['enemy'].index
        event.force_name = game.forces['enemy'].name
        flib.log(event)
        -- player
        event.index = game.forces['player'].index
        event.force_name = game.forces['player'].name
        flib.log(event)

        global.log.default_active = true
    end
end


-----------------------
--   Main functions
-----------------------


--[[
local function on_player_banned(e)
    local byPlayer = game.players[e.by_player]
    
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
        ban = {
            name = e.player_name,
            byPlayer = byPlayer.name,
            reason = e.reason,
        }
    } 

    flib.trace_event(data)
end

local function on_player_unbanned(e)
    local byPlayer = game.players[e.by_player]
    
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
        unban = {
            name = e.player_name,
            byPlayer = byPlayer.name,
            reason = e.reason,
        }
    } 

    flib.trace_event(data)
end

   


-----------------------
-- Function Cursor Stack
-----------------------

local function on_player_cursor_stack_changed(e) 
    local LuaPlayer = game.players[e.player_index]
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
        cursor = flib.get_ItemStack(LuaPlayer.cursor_stack)
    }
    
    flib.trace_event(data)
end 


local function on_player_display_scale_changed(e)
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
        old_scale = e.old_scale,
    }
    
    flib.trace_event(data)
end

]]


----------------------------------------------------------------------------------------
-- EVENTS
----------------------------------------------------------------------------------------
local function on_player_created(e)
    active_default()
    local LuaPlayer = game.players[e.player_index]
    if not global.log.players[LuaPlayer.name] then 
        global.log.players[LuaPlayer.name] = {
            name = LuaPlayer.name,
            index = LuaPlayer.index
        }
    end

    local event = flib.events.get(e)
    flib.player.add_index(e, event)
    flib.player.add_controller(e, event)
    event.player_name = LuaPlayer.name
    
    flib.log(event)
end

local function on_player_changed_force(e)
    local LuaPlayer = game.players[e.player_index]
    local LuaForce = e.force
    if not global.log.players[LuaPlayer.name] then return end

    local event = flib.events.get(e)
    flib.player.add_index(e, event)
    flib.force_name = LuaPlayer.force.name
    flib.old_force = LuaForce.name

    flib.log(event)
end

local function on_player_changed_surface(e)
    local LuaPlayer = game.players[e.player_index]
    local LuaSurface = game.players[e.surface_index]
    if not global.log.players[LuaPlayer.name] then return end

    local event = flib.events.get(e)
    flib.player.add_index(e, event)
    flib.surface_name = LuaPlayer.surface.name
    flib.old_surface = LuaSurface.name

    flib.log(event)
end

local function on_player_promoted(e)
    local LuaPlayer = game.players[e.player_index]
    if not global.log.players[LuaPlayer.name] then return end

    local event = flib.events.get(e)
    flib.player.add_index(e, event)

    flib.log(event)
end

local function on_player_demoted(e)
    local LuaPlayer = game.players[e.player_index]
    if not global.log.players[LuaPlayer.name] then return end

    local event = flib.events.get(e)
    flib.player.add_index(e, event)

    flib.log(event)
end

local function on_player_removed(e)
    local LuaPlayer = game.players[e.player_index]
    if not global.log.players[LuaPlayer.name] then return end

    local event = flib.events.get(e)
    flib.player.add_index(e, event)

    flib.log(event)
end

local function on_player_changed_position(e)
    -- ajouter un setting pour l'activation des events pendant le scenario
    if global.log.scenario_active == true then return end
    
    local LuaPlayer = game.players[e.player_index]
    if not global.log.players[LuaPlayer.name] then return end

    local position = LuaPlayer.position

    local event = flib.events.get(e)
    flib.player.add_index(e, event)
    flib.player.add_controller(e, event)
    if position_advanced == true then 
        event.force_name = LuaPlayer.force.name
        event.surface_name = LuaPlayer.surface.name
    end
    event.position = {
        x=math.floor(position.x),
        y=math.floor(position.y),
    }

    flib.log(event)
end



---------------------------------------------------------------------------------
local module = {}
module.events = {}
---------------------------------------------------------------------------------
-- events on_player standard
for name,event in pairs(defines.events) do
    if string.sub(name,1,9) ==  "on_player" then 
        module.events[event] = flib.events.on_player.standard
    end
    if string.sub(name,1,13) ==  "on_pre_player" then 
        module.events[event] = flib.events.on_player.standard
    end
end
---------------------------------------------------------------------------------
-- specifiques events
module.events[defines.events.on_player_promoted] = on_player_promoted
module.events[defines.events.on_player_demoted] = on_player_demoted
module.events[defines.events.on_player_created] = on_player_created
module.events[defines.events.on_player_changed_force] = on_player_changed_force
module.events[defines.events.on_player_changed_position] = on_player_changed_position
module.events[defines.events.on_player_removed] = on_player_removed
---------------------------------------------------------------------------------
-- on player_changed_position
if position_option then 
    module.events[defines.events.on_player_changed_position] = on_player_changed_position
end
----------------------------------------------------------------------------------------
return module