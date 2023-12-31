----------------------------------------------------------------------------------------
local RitnEvent = require(ritnlib.defines.log.class.event)
local RitnLog = require(ritnlib.defines.log.class.log)
----------------------------------------------------------------------------------------
local event_type = "on_player"
----------------------------------------------------------------------------------------
--   FUNCTIONS GLOBAL
----------------------------------------------------------------------------------------

local function globalIgnore(setting)
    local playerIgnore = not global.log.settings.all_option
    if playerIgnore == false then playerIgnore = not setting end
    return playerIgnore
end

local function on_player(e)
    local playerIgnore = globalIgnore(global.log.settings.all_option_player)
    RitnEvent(e):setIgnore(playerIgnore):log()
end

----------------------------------------------------------------------------------------

-----------------------
--   Main functions
-----------------------


-- on_player_created
-- return log : 
local function on_player_created(e)
    local playerIgnore = globalIgnore(global.log.settings.option_player_admin)
    RitnEvent(e):setIgnore(playerIgnore):createGlobalPlayer():log()
end

-- on_player_changed_force
-- return log : 
local function on_player_changed_force(e)
    local playerIgnore = globalIgnore(global.log.settings.option_player_admin)
    RitnEvent(e):playerChangedForce():setIgnore(playerIgnore):log()
end

-- on_player_changed_surface
-- return log : 
local function on_player_changed_surface(e)
    local playerIgnore = globalIgnore(global.log.settings.option_player_admin)
    RitnEvent(e):playerChangedSurface():setIgnore(playerIgnore):log()
end

-- on_player_left_game
-- return log :
local function on_player_left_game(e)
    local playerIgnore = globalIgnore(global.log.settings.option_player_admin)
    RitnEvent(e):playerLeftGame():setIgnore(playerIgnore):log()
end

-- on_player_muted
-- return log :
local function on_player_muted(e)
    local playerIgnore = globalIgnore(global.log.settings.option_player_admin)
    RitnEvent(e):setIgnore(playerIgnore):log()
end

-- on_player_unmuted
-- return log :
local function on_player_unmuted(e)
    local playerIgnore = globalIgnore(global.log.settings.option_player_admin)
    RitnEvent(e):setIgnore(playerIgnore):log()
end

-- on_player_banned
-- return log :
local function on_player_banned(e)
    local playerIgnore = globalIgnore(global.log.settings.option_player_admin)
    RitnEvent(e):playerBanned():setIgnore(playerIgnore):log()
end

-- on_player_unbanned
-- return log :
local function on_player_unbanned(e)
    local playerIgnore = globalIgnore(global.log.settings.option_player_admin)
    RitnEvent(e):playerUnbanned():setIgnore(playerIgnore):log()
end

-- on_player_kicked
-- return log :
local function on_player_kicked(e)
    local playerIgnore = globalIgnore(global.log.settings.option_player_admin)
    RitnEvent(e):playerKicked():setIgnore(playerIgnore):log()
end

-- on_player_cheat_mode_disabled
-- return log :
local function on_player_cheat_mode_disabled(e)
    local playerIgnore = globalIgnore(global.log.settings.option_player_admin)
    RitnEvent(e):setIgnore(playerIgnore):log()
end

-- on_player_cheat_mode_enabled
-- return log :
local function on_player_cheat_mode_enabled(e)
    local playerIgnore = globalIgnore(global.log.settings.option_player_admin)
    RitnEvent(e):setIgnore(playerIgnore):log()
end

-- on_player_promoted
-- return log :
local function on_player_promoted(e)
    local playerIgnore = globalIgnore(global.log.settings.option_player_admin)
    RitnEvent(e):setIgnore(playerIgnore):log()
end

-- on_player_demoted
-- return log :
local function on_player_demoted(e)
    local playerIgnore = globalIgnore(global.log.settings.option_player_admin)
    RitnEvent(e):setIgnore(playerIgnore):log()
end

-- on_player_joined_game
-- return log :
local function on_player_joined_game(e)
    local playerIgnore = globalIgnore(global.log.settings.option_player_admin)
    RitnEvent(e):setIgnore(playerIgnore):log()
end

-- on_player_died
-- return log :
local function on_player_died(e)
    local playerIgnore = globalIgnore(global.log.settings.option_player_admin)
    RitnEvent(e):playerDied():setIgnore(playerIgnore):log()
end

-- on_player_respawned
-- return log :
local function on_player_respawned(e)
    local playerIgnore = globalIgnore(global.log.settings.option_player_admin)
    RitnEvent(e):setIgnore(playerIgnore):log()
end


-----------------------
-- Function Cursor Stack
-----------------------

local function on_player_cursor_stack_changed(e)
    local ignoreCursor = globalIgnore(global.log.settings.cursor_stack_option)
    RitnEvent(e):setIgnore(ignoreCursor):playerCursorChanged():log()
end


-----------------------
-- Function changed position
-----------------------

local function on_player_changed_position(e)
    -- ajouter un setting pour l'activation des events pendant le scenario
    local ignorePosition = globalIgnore(global.log.settings.position_option)
    RitnEvent(e):setIgnore(ignorePosition):playerChangedPosition():log()
end



----------------------------------------------------------------------------------------
-- EVENTS
----------------------------------------------------------------------------------------

local function on_player_display_scale_changed(e)
    local playerIgnore = globalIgnore(global.log.settings.all_option_player)
    RitnEvent(e):playerDisplayScaleChanged():setIgnore(playerIgnore):log()
end


local function on_player_built_tile(e)
    -- WIP
    local playerIgnore = globalIgnore(global.log.settings.all_option_player)
    RitnEvent(e):setIgnore(playerIgnore):log()
end


local function on_player_cancelled_crafting(e)
    -- WIP
    local playerIgnore = globalIgnore(global.log.settings.all_option_player)
    RitnEvent(e):setIgnore(playerIgnore):log()
end

local function on_player_clicked_gps_tag(e)
    -- WIP
    local playerIgnore = globalIgnore(global.log.settings.all_option_player)
    RitnEvent(e):setIgnore(playerIgnore):log()
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
end

-- specifiques events
module.events[defines.events.on_player_built_tile] = on_player_built_tile
module.events[defines.events.on_player_display_scale_changed] = on_player_display_scale_changed
module.events[defines.events.on_player_cancelled_crafting] = on_player_cancelled_crafting
module.events[defines.events.on_player_clicked_gps_tag] = on_player_clicked_gps_tag

---------------------------------------------------------------------------------
-- admin event on_player
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

---------------------------------------------------------------------------------
-- on_player_changed_position
module.events[defines.events.on_player_changed_position] = on_player_changed_position

---------------------------------------------------------------------------------
-- on_player_cursor_stack_changed
module.events[defines.events.on_player_cursor_stack_changed] = on_player_cursor_stack_changed

----------------------------------------------------------------------------------------
return module