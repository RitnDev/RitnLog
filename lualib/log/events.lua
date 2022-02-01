----------------------------------------------------------------------------------------
local flib = require(ritnlog.defines.functions.events)
----------------------------------------------------------------------------------------
-- settings
local all_option = settings.startup[ritnlog.defines.settings.name.player_all_option].value
local position_option = settings.startup[ritnlog.defines.settings.name.player_position_option].value
local cursor_stack_option = settings.startup[ritnlog.defines.settings.name.player_cursor_option].value
----------------------------------------------------------------------------------------
-- FUNCTIONS
----------------------------------------------------------------------------------------
local function ignore(e) flib.events.ignore(e) end
local function basic(e) flib.events.basic(e) end

----------------------------------------------------------------------------------------
-- EVENTS
----------------------------------------------------------------------------------------


-- on_game_created_from_scenario
local function on_game_created_from_scenario(e)
    global.log.scenario_active = true
    local event = flib.events.get(e)

    flib.log(event)
end

-- on_cutscene_cancelled
local function on_cutscene_cancelled(e)
    global.log.scenario_active = false
    local event = flib.events.get(e)

    flib.log(event)
end

---------------------------------------------------------------------------------
local module = {}
module.events = {}
---------------------------------------------------------------------------------
-- for all events
for _,event in pairs(defines.events) do 
    module.events[event] = basic 
end
---------------------------------------------------------------------------------
-- specifiques events
module.events[defines.events.on_game_created_from_scenario] = on_game_created_from_scenario
module.events[defines.events.on_cutscene_cancelled] = on_cutscene_cancelled
---------------------------------------------------------------------------------
-- events on_player
local player = {}
player = require(ritnlog.defines.log.player)

for i,v in pairs(player.events) do 
    module.events[i] = player.events[i]
end
---------------------------------------------------------------------------------
-- ignore events (settings)
if all_option == false then 
    module.events[defines.events.on_chunk_generated] = ignore
    module.events[defines.events.on_chunk_charted] = ignore
    module.events[defines.events.on_entity_damaged] = ignore
    module.events[defines.events.on_entity_died] = ignore
    module.events[defines.events.on_post_entity_died] = ignore
    module.events[defines.events.on_entity_spawned] = ignore
    module.events[defines.events.on_selected_entity_changed] = ignore
end
----------------------------------------------------------------------------------------
return module