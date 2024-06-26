----------------------------------------------------------------------------------------
-- FUNCTIONS
----------------------------------------------------------------------------------------

local function getEventName(event)
    for name,ev in pairs(defines.events) do
        if event.name == 0 then return "on_tick" end
        if defines.events[name] ==  event.name then 
            return name
        end
    end
end

local function ignore(e) return end
local function basic(e) 
    if e.name == 0 then return end
    local event_name = getEventName(e)
    RitnLog():getEvent(e):setIgnore(global.log.events[event_name]):trace()
end
----------------------------------------------------------------------------------------
-- EVENTS
----------------------------------------------------------------------------------------


-- on_game_created_from_scenario
local function on_game_created_from_scenario(e)

    global.log.scenario_active = true
    
    -- desactive la partie scenario si l'intro freeplay est skip
    if script.level.level_name == "freeplay" then 
        if remote.interfaces.freeplay.get_skip_intro then 
            global.log.scenario_active = false
        end
    end
    

    RitnLog():getEvent(e):setIgnore(global.log.events.on_game_created_from_scenario):trace()
end

-- on_cutscene_cancelled
local function on_cutscene_cancelled(e)
    global.log.scenario_active = false
    RitnLog():getEvent(e):setIgnore(global.log.events.on_cutscene_cancelled):trace()
end

---------------------------------------------------------------------------------
local module = {}
module.events = {}
---------------------------------------------------------------------------------
-- for all events
for name,event in pairs(defines.events) do 
    --if string.sub(name,1,9) ~=  "on_player" 
    --and string.sub(name,1,13) ~=  "on_pre_player" then 
        --if global.log.events[name] then 
            module.events[event] = basic
        --else
            --module.events[event] = ignore  
        --end  
    --end
end
---------------------------------------------------------------------------------
-- specifiques events
module.events[defines.events.on_game_created_from_scenario] = on_game_created_from_scenario
module.events[defines.events.on_cutscene_cancelled] = on_cutscene_cancelled
---------------------------------------------------------------------------------
-- events on_player
local player = {}
player = require(ritnlib.defines.log.modules.player)

for i,v in pairs(player.events) do 
    module.events[i] = player.events[i]
end
---------------------------------------------------------------------------------
-- ignore events (settings)
if global.log.settings.all_option then 
    module.events[defines.events.on_string_translated] = ignore
    module.events[defines.events.on_chunk_generated] = ignore
    module.events[defines.events.on_chunk_charted] = ignore
    module.events[defines.events.on_entity_damaged] = ignore
    module.events[defines.events.on_entity_died] = ignore
    module.events[defines.events.on_post_entity_died] = ignore
    module.events[defines.events.on_entity_spawned] = ignore
    module.events[defines.events.on_selected_entity_changed] = ignore
    --module.events[defines.events.on_gui_text_changed] = ignore
    --module.events[defines.events.on_gui_location_changed] = ignore
    --module.events[defines.events.on_gui_click] = ignore
end

----------------------------------------------------------------------------------------
return module