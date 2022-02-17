----------------------------------------------------------------------------------------
local flib = require(ritnlog.defines.functions.events)
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
    -- desactive la partie scenario si l'intro freeplay est skip
    if remote.interfaces.freeplay.get_skip_intro then 
        global.log.scenario_active = false
    end
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
for name,event in pairs(defines.events) do 
    if string.sub(name,1,9) ~=  "on_player" 
    and string.sub(name,1,13) ~=  "on_pre_player" then 
        module.events[event] = basic 
    end
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
if global.settings.all_option == false then 
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