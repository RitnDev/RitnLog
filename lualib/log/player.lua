----------------------------------------------------------------------------------------
local flib = require(ritnlog.defines.functions.events)
local event_type = "on_player"
----------------------------------------------------------------------------------------
local function on_player(e)
    flib.events.player.log(e, global.settings.all_option_player)
end

local function on_pre_player(e)
    flib.events.ignore(e)
end
----------------------------------------------------------------------------------------

-----------------------
--   Main functions
-----------------------


-- on_player_created
-- return log : 
-- @LuaPlayer
-- create structure Players (global)
local function on_player_created(e)
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
    pcall(function()
        RitnEvent.event.old_force = LuaForce.name
    end)
    flib.log(RitnEvent)
end

-- on_player_changed_force
-- return log : 
-- @LuaPlayer
-- @old_surface : LuaSurface.name (string)
local function on_player_changed_surface(e)
    local LuaSurface = game.surfaces[e.surface_index]
    local RitnEvent = flib.events.player.standard(e) 
    pcall(function()
        RitnEvent.event.old_surface = LuaSurface.name
    end)
    flib.log(RitnEvent)
end

-- on_player_changed_force
-- return log :
-- @LuaPlayer
-- @reason (string)
local function on_player_left_game(e)
    local RitnEvent = flib.events.player.standard(e) 
    pcall(function()
        RitnEvent.event.reason = e.reason
    end)
    flib.log(RitnEvent)
end

local function on_player_muted(e)
    local RitnEvent = flib.events.player.standard(e) 
    flib.log(RitnEvent)
end

local function on_player_unmuted(e)
    local RitnEvent = flib.events.player.standard(e) 
    flib.log(RitnEvent)
end

local function on_player_banned(e)
    local byPlayer = game.players[e.by_player]
    local RitnEvent = flib.events.player.standard(e) 
    pcall(function()
        RitnEvent.event.banned = {
            name = "",
            byPlayer = "server",
            reason = e.reason,
        }
    end)
    pcall(function() 
        RitnEvent.event.banned.name = e.player_name
        RitnEvent.event.banned.byPlayer = byPlayer.name
    end)

    flib.log(RitnEvent)
end


local function on_player_unbanned(e)
    local byPlayer = game.players[e.by_player]
    local RitnEvent = flib.events.player.standard(e) 
    pcall(function()
        RitnEvent.event.unbanned = {
                name = "",
                byPlayer = "server",
                reason = e.reason,
        }
    end)
    pcall(function() 
        RitnEvent.event.unbanned.name = e.player_name
        RitnEvent.event.unbanned.byPlayer = byPlayer.name
    end)

    flib.log(RitnEvent)
end

local function on_player_kicked(e)
    local byPlayer = game.players[e.by_player]
    local RitnEvent = flib.events.player.standard(e) 
    pcall(function()
        RitnEvent.event.kicked = {
                byPlayer = "server",
                reason = e.reason,
        }
    end)
    pcall(function() 
        RitnEvent.event.kicked.byPlayer = byPlayer.name
    end)

    flib.log(RitnEvent)
end

local function on_player_cheat_mode_disabled(e)
    local RitnEvent = flib.events.player.standard(e) 
    flib.log(RitnEvent)
end

local function on_player_cheat_mode_enabled(e)
    local RitnEvent = flib.events.player.standard(e) 
    flib.log(RitnEvent)
end

local function on_player_promoted(e)
    local RitnEvent = flib.events.player.standard(e) 
    flib.log(RitnEvent)
end

local function on_player_demoted(e)
    local RitnEvent = flib.events.player.standard(e) 
    flib.log(RitnEvent)
end

local function on_player_joined_game(e)
    local RitnEvent = flib.events.player.standard(e) 
    flib.log(RitnEvent)
end

local function on_player_died(e)
    local LuaEntity = e.cause
    local RitnEvent = flib.events.player.standard(e) 
    pcall(function()
        RitnEvent.event.cause = {
            name = LuaEntity.name,
            force_name = LuaEntity.force.name
        }
    end)
    flib.log(RitnEvent)
end

local function on_player_respawned(e)
    local RitnEvent = flib.events.player.standard(e) 
    flib.log(RitnEvent)
end


-----------------------
-- Function Cursor Stack
-----------------------

local function on_player_cursor_stack_changed(e)
    local RitnEvent, LuaPlayer  = flib.events.player.standard(e) 
    pcall(function()
        RitnEvent.event.cursor = {
            name = "",
            count = 0,
        }
    end)
    pcall(function() 
        if LuaPlayer.cursor_stack ~= nil and LuaPlayer.cursor_stack.valid_for_read then 
            RitnEvent.event.cursor.name = LuaPlayer.cursor_stack.name
            RitnEvent.event.cursor.count = LuaPlayer.cursor_stack.count
        end
    end)
    
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
    pcall(function()
        RitnEvent.event.position = {
            x=math.floor(position.x),
            y=math.floor(position.y),
        }
    end)

    flib.log(RitnEvent)
end



----------------------------------------------------------------------------------------
-- EVENTS
----------------------------------------------------------------------------------------


local function on_player_display_scale_changed(e)
    local RitnEvent, LuaPlayer  = flib.events.player.standard(e) 
    pcall(function()
        RitnEvent.event.scale = {
            current = LuaPlayer.display_scale,
            old = e.old_scale,
        }
    end)
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
    local RitnEvent, LuaPlayer  = flib.events.player.standard(e) 
    --
    flib.log(RitnEvent)
end



---------------------------------------------------------------------------------
local module = {}
module.events = {}
---------------------------------------------------------------------------------


-- events on_player standard
for name,event in pairs(defines.events) do
    if string.sub(name,1,9) ==  event_type then 
        module.events[event] = on_player
    end
    if string.sub(name,1,13) ==  "on_pre_player" then 
        module.events[event] = on_pre_player
    end
end


if global.settings.all_option_player then
    -- specifiques events
    module.events[defines.events.on_player_built_tile] = on_player_built_tile
    module.events[defines.events.on_player_display_scale_changed] = on_player_display_scale_changed
    module.events[defines.events.on_player_cancelled_crafting] = on_player_cancelled_crafting
    module.events[defines.events.on_player_clicked_gps_tag] = on_player_clicked_gps_tag
end


---------------------------------------------------------------------------------
-- admin event on_player
if global.settings.option_player_admin then 
    module.events[defines.events.on_player_created] = on_player_created
    module.events[defines.events.on_player_unbanned] = on_player_banned
    module.events[defines.events.on_player_unbanned] = on_player_unbanned
    module.events[defines.events.on_player_joined_game] = on_player_joined_game
    module.events[defines.events.on_player_left_game] = on_player_left_game
    module.events[defines.events.on_player_changed_force] = on_player_changed_force
    module.events[defines.events.on_player_changed_surface] = on_player_changed_surface
    module.events[defines.events.on_player_kicked] = on_player_kicked
    module.events[defines.events.on_player_cheat_mode_disabled] = on_player_cheat_mode_disabled
    module.events[defines.events.on_player_cheat_mode_enabled] = on_player_cheat_mode_enabled
    module.events[defines.events.on_player_promoted] = on_player_promoted
    module.events[defines.events.on_player_demoted] = on_player_demoted
    module.events[defines.events.on_player_died] = on_player_died
    module.events[defines.events.on_player_respawned] = on_player_respawned
    module.events[defines.events.on_player_muted] = on_player_muted
    module.events[defines.events.on_player_unmuted] = on_player_unmuted
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