----------------------------------------------------------------------------------------
local flib = require(ritnlog.defines.functions.events)
local event_type = "on_player"
----------------------------------------------------------------------------------------
-- declenche des events pour création des infos par defaut du jeu
local function active_default()
    if global.log.default_active == false then 
        -- create force by default (neutral, enemy, player)
        local ev = {name = defines.events.on_force_created,}
        local RitnEvent = flib.events.get(ev)
        -- neutral
        RitnEvent.event.force = {}
        RitnEvent.event.force.index = game.forces['neutral'].index
        RitnEvent.event.force.name = game.forces['neutral'].name
        flib.log(RitnEvent)
        -- enemy
        RitnEvent.event.force.index = game.forces['enemy'].index
        RitnEvent.event.force.name = game.forces['enemy'].name
        flib.log(RitnEvent)
        -- player
        RitnEvent.event.force.index = game.forces['player'].index
        RitnEvent.event.force.name = game.forces['player'].name
        flib.log(RitnEvent)

        global.log.default_active = true
    end
end


-----------------------
--   Main functions
-----------------------


-- on_player_created
-- return log : 
-- @LuaPlayer
-- create structure Players (global)
local function on_player_created(e)
    active_default()
    local LuaPlayer = game.players[e.player_index]
    if not global.log.players[LuaPlayer.name] then 
        global.log.players[LuaPlayer.name] = {
            name = LuaPlayer.name,
            index = LuaPlayer.index
        }
    end

    local RitnEvent = flib.events.player.standard(e)  
    flib.log(RitnEvent)
end

-- on_player_changed_force
-- return log : 
-- @LuaPlayer
-- @old_force : LuaForce.name (string)
local function on_player_changed_force(e)
    local LuaForce = e.force
    local RitnEvent = flib.events.player.standard(e)  
    RitnEvent.event.old_force = LuaForce.name

    flib.log(RitnEvent)
end

-- on_player_changed_force
-- return log : 
-- @LuaPlayer
-- @old_surface : LuaSurface.name (string)
local function on_player_changed_surface(e)
    local LuaSurface = game.surfaces[e.surface_index]
    local RitnEvent = flib.events.player.standard(e) 
    RitnEvent.event.old_surface = LuaSurface.name

    flib.log(RitnEvent)
end

-- on_player_changed_force
-- return log :
-- @LuaPlayer
-- @reason (string)
local function on_player_left_game(e)
    local RitnEvent = flib.events.player.standard(e) 
    RitnEvent.event.reason = e.reason

    flib.log(RitnEvent)
end



local function on_player_banned(e)
    local byPlayer = game.players[e.by_player]
    local RitnEvent = flib.events.player.standard(e) 

    RitnEvent.event.banned = {
            name = e.player_name,
            byPlayer = byPlayer.name,
            reason = e.reason,
    }

    flib.log(RitnEvent)
end


local function on_player_unbanned(e)
    local byPlayer = game.players[e.by_player]
    local RitnEvent = flib.events.player.standard(e) 

    RitnEvent.event.unbanned = {
            name = e.player_name,
            byPlayer = byPlayer.name,
            reason = e.reason,
    }

    flib.log(RitnEvent)
end

   

-----------------------
-- Function Cursor Stack
-----------------------

local function on_player_cursor_stack_changed(e)
    local RitnEvent, LuaPlayer  = flib.events.player.standard(e) 
    RitnEvent.event.cursor = {
        name = "",
        count = 0,
    }

    if LuaPlayer.cursor_stack ~= nil and LuaPlayer.cursor_stack.valid_for_read then 
        RitnEvent.event.cursor.name = LuaPlayer.cursor_stack.name
        RitnEvent.event.cursor.count = LuaPlayer.cursor_stack.count
    end
    
    flib.log(RitnEvent)
end


-----------------------
-- Function changed position
-----------------------

local function on_player_changed_position(e)
    -- ajouter un setting pour l'activation des events pendant le scenario
    if global.log.scenario_active == true then return end
    
    local RitnEvent, LuaPlayer = flib.events.player.standard(e) 
    local position = LuaPlayer.position
    RitnEvent.event.position = {
        x=math.floor(position.x),
        y=math.floor(position.y),
    }

    flib.log(RitnEvent)
end



----------------------------------------------------------------------------------------
-- EVENTS
----------------------------------------------------------------------------------------


local function on_player_display_scale_changed(e)
    local RitnEvent, LuaPlayer  = flib.events.player.standard(e) 
    RitnEvent.event.scale = {
        current = LuaPlayer.display_scale,
        old = e.old_scale,
    }
    flib.log(RitnEvent)
end



local function on_player_built_tile(e)
    local RitnEvent, LuaPlayer  = flib.events.player.standard(e) 
    --
    flib.log(RitnEvent)
end


local function on_player_cancelled_crafting(e)
    local RitnEvent, LuaPlayer  = flib.events.player.standard(e) 
    --
    flib.log(RitnEvent)
end

local function on_player_clicked_gps_tag(e)

end

---------------------------------------------------------------------------------
local module = {}
module.events = {}
---------------------------------------------------------------------------------


-- events on_player standard
for name,event in pairs(defines.events) do
    if string.sub(name,1,9) ==  event_type then 
        module.events[event] = flib.events.player.log(event, global.settings.all_option_player)
    end
    if string.sub(name,1,13) ==  "on_pre_player" then 
        module.events[event] = flib.events.ignore(event)
    end
end


if global.settings.all_option_player then
    -- specifiques events
    module.events[defines.events.on_player_built_tile] = on_player_built_tile
    module.events[defines.events.on_player_display_scale_changed] = on_player_display_scale_changed
    module.events[defines.events.on_player_cancelled_crafting] = on_player_cancelled_crafting
end


---------------------------------------------------------------------------------
-- admin event on_player
if global.settings.option_player_admin then 
    module.events[defines.events.on_player_created] = on_player_created
    module.events[defines.events.on_player_unbanned] = on_player_banned
    module.events[defines.events.on_player_unbanned] = on_player_unbanned
    module.events[defines.events.on_player_left_game] = on_player_left_game
    module.events[defines.events.on_player_changed_force] = on_player_changed_force
    module.events[defines.events.on_player_changed_surface] = on_player_changed_surface
end

---------------------------------------------------------------------------------
-- on_player_changed_position
if global.settings.position_option then 
    module.events[defines.events.on_player_changed_position] = on_player_changed_position
end
---------------------------------------------------------------------------------
-- on_player_cursor_stack_changed
if global.settings.cursor_stack_option then 
    module.events[defines.events.on_player_cursor_stack_changed] = on_player_cursor_stack_changed
end
----------------------------------------------------------------------------------------
return module