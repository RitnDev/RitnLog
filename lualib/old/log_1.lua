local module = {}
module.events = {}

local flib = require("lualib/functions")

----------------------------------
--            Event             --
----------------------------------

local function on_built_entity(e)
--pcall( function() 
    local LuaPlayer = game.players[e.player_index]
    local LuaEntity = e.created_entity

    if LuaEntity.name ~= "entity-ghost" then
        local output = ' > on_built_entity | ' .. flib.trace_player(LuaPlayer) .. ', ' .. flib.trace_entity(LuaEntity)
        flib.trace_event(output)
    end
--end)
end
module.events[defines.events.on_built_entity] = on_built_entity


local function on_cancelled_deconstruction(e)
pcall( function() 
    local LuaPlayer = game.players[e.player_index]
    local LuaEntity = e.entity

    local output = ' > on_cancelled_deconstruction | ' .. flib.trace_player(LuaPlayer) .. ', ' .. flib.trace_entity(LuaEntity)
    flib.trace_event(output)
end)
end
module.events[defines.events.on_cancelled_deconstruction] = on_cancelled_deconstruction


local function on_cancelled_upgrade(e)
pcall( function() 
    local LuaPlayer = game.players[e.player_index]
    local LuaEntity = e.entity

    local output = ' > on_cancelled_upgrade | ' .. flib.trace_player(LuaPlayer) .. ', ' .. flib.trace_entity(LuaEntity)
    flib.trace_event(output)
end)
end
module.events[defines.events.on_cancelled_upgrade] = on_cancelled_upgrade


local function on_character_corpse_expired(e)
pcall( function() 
    pcall(function()
        local LuaEntity = e.entity
        local LuaPlayer = game.players[LuaEntity.character_corpse_player_index]

        local output = ' > on_character_corpse_expired | ' .. flib.trace_player(LuaPlayer)
    flib.trace_event(output)
    end
)
end)
end
module.events[defines.events.on_character_corpse_expired] = on_character_corpse_expired


local function on_console_chat(e)
    pcall(function()
        local LuaPlayer = game.players[e.player_index]
        local message = e.message

        local output = ' > on_console_chat | ' .. flib.trace_player(LuaPlayer) .. ', message="' .. message .. '"'
    flib.trace_event(output)
    end)
end
module.events[defines.events.on_console_chat] = on_console_chat


local function on_console_command(e)
    pcall(function()
        local LuaPlayer = game.players[e.player_index]
        local command = e.command
        local parameters = e.parameters 

        local output = ' > on_console_command | ' .. flib.trace_player(LuaPlayer) .. ', command="' .. command .. '", parameters="' .. parameters .. '"'
    flib.trace_event(output)
    end)
end
module.events[defines.events.on_console_command] = on_console_command


local function on_entity_cloned(e)
pcall( function() 
    local source = e.source
    local destination = e.destination

    local output = ' > on_entity_cloned | ' .. ' source: ' .. flib.trace_entity(source) .. ', destination: ' .. flib.trace_entity(destination)
    flib.trace_event(output)
end)
end
module.events[defines.events.on_entity_cloned] = on_entity_cloned

--[[
local function on_entity_damaged(e)
pcall( function() 
    LuaEntity = e.entity
    LuaForce = e.force
    Cause = e.cause

    local output = ' > on_entity_damaged | ' .. flib.trace_entity(LuaEntity) .. ', byForce="' .. LuaForce.name .. '"'

    if Cause then
        if Cause.player then
            LuaPlayer = Cause.player
            output = output .. ', by: ' .. flib.trace_player(LuaPlayer)
        else
            output = output .. ', by: ' .. flib.trace_entity(Cause)
        end
    end

    flib.trace_event(output)
end)
end
module.events[defines.events.on_entity_damaged] = on_entity_damaged
]]

local function on_entity_died(e)
pcall( function() 
    local LuaEntity = e.entity
    local LuaForce = e.force
    local Cause = e.cause

    local output = ' > on_entity_died | ' .. flib.trace_entity(LuaEntity) .. ', byForce="' .. LuaForce.name .. '", '

    if Cause.is_player() then
        LuaPlayer = Cause.player
        output = output .. 'by: ' .. flib.trace_player(LuaPlayer)
    else
        output = output .. 'by: ' .. flib.trace_entity(Cause)
    end

    flib.trace_event(output)
end)
end
module.events[defines.events.on_entity_died] = on_entity_died


local function on_entity_settings_pasted(e)
pcall( function() 
    local LuaPlayer = game.players[e.player_index]
    local source = e.source
    local destination = e.destination

    local output = ' > on_entity_settings_pasted | ' .. flib.trace_player(LuaPlayer) .. ', source: ' .. flib.trace_entity(source) .. ', destination: ' .. flib.trace_entity(destination)
    flib.trace_event(output)
end)
end
module.events[defines.events.on_entity_settings_pasted] = on_entity_settings_pasted


local function on_land_mine_armed(e)
pcall( function() 
    local mine = e.mine

    local output = ' > on_land_mine_armed | mine: ' .. flib.trace_entity(mine)
    flib.trace_event(output)
end)
end
module.events[defines.events.on_land_mine_armed] = on_land_mine_armed


local function on_picked_up_item(e)
pcall( function() 
    local LuaPlayer = game.players[e.player_index]
    local ItemStack = e.item_stack

    local output = ' > on_picked_up_item | ' .. flib.trace_player(LuaPlayer) 
    if ItemStack then
        output = output .. ', ' .. flib.trace_ItemStack(ItemStack)
    end
    flib.trace_event(output)
end)
end
module.events[defines.events.on_picked_up_item] = on_picked_up_item

--[[
local function on_put_item(e)
pcall( function() 
    -- futur release
end)
end
module.events[defines.events.on_put_item] = on_put_item
]]

local function on_research_finished(e)
pcall( function() 
    local LuaTechnology = e.research
    local by_script = flib.get_boolean(e.by_script)

    local output = ' > on_research_finished | technology: ' .. LuaTechnology.name .. ', force: ' .. LuaTechnology.force .. ', by_script:' .. by_script
    flib.trace_event(output)
end)
end
module.events[defines.events.on_research_finished] = on_research_finished


local function on_research_started(e)
pcall( function() 
    local LuaTechnology = e.research
    local last_research = e.last_research

    local output = ' > on_research_started | technology: ' .. LuaTechnology.name .. ', force: ' .. LuaTechnology.force .. ', last_research:' .. last_research.name
    flib.trace_event(output)
end)
end
module.events[defines.events.on_research_started] = on_research_started


local function on_resource_depleted(e)
pcall( function() 
    -- futur release
end)
end
module.events[defines.events.on_resource_depleted] = on_resource_depleted


local function on_robot_built_entity(e)
pcall( function() 
    local LuaEntity = e.created_entity

    local output = ' > on_robot_built_entity | ' .. flib.trace_entity(LuaEntity)
    flib.trace_event(output)
end)
end
module.events[defines.events.on_robot_built_entity] = on_robot_built_entity


local function on_robot_built_tile(e)
pcall( function() 
    local Tile = e.tile 
    local item = e.item
    local surface = game.surfaces[e.surface_index]

    local output = ' > on_robot_built_tile | item="' .. item.name .. ', tile="' .. Tile.name ..'", surface="' .. surface.name .. '"' 
    flib.trace_event(output)
end)
end
module.events[defines.events.on_robot_built_tile] = on_robot_built_tile


local function on_robot_exploded_cliff(e)
pcall( function() 
    -- futur release
end)
end
module.events[defines.events.on_robot_exploded_cliff] = on_robot_exploded_cliff


local function on_robot_mined(e)
pcall( function() 
    local LuaEntity = e.entity
    local ItemStack = e.item_stack

    local output = ' > on_robot_mined | '
    if ItemStack then
        output = output .. 'mined (item):' .. flib.trace_ItemStack(ItemStack)
    end
    flib.trace_event(output)
end)
end
module.events[defines.events.on_robot_mined] = on_robot_mined


local function on_robot_mined_entity(e)
pcall( function() 
    local LuaEntity = e.entity

    local output = ' > on_robot_mined_entity | mined: ' .. flib.trace_entity(LuaEntity)
    flib.trace_event(output)
end)
end
module.events[defines.events.on_robot_mined_entity] = on_robot_mined_entity


local function on_robot_mined_tile(e)
pcall( function() 
    local surface = game.surfaces[e.surface_index]

    local output = ' > on_robot_mined_tile | surface="' .. surface.name .. '"'
    flib.trace_event(output)
end)
end
module.events[defines.events.on_robot_mined_tile] = on_robot_mined_tile


local function on_rocket_launch_ordered(e)
pcall( function() 
    local LuaPlayer = {}
    if e.player_index then LuaPlayer = game.players[e.player_index] else LuaPlayer = nil end
    local rocket = e.rocket
    local rocket_silo = e.rocket_silo

    local output = ' > on_rocket_launch_ordered | '
    if LuaPlayer then output = output .. flib.trace_player(LuaPlayer) .. ', ' end
    output = output .. 'rocket_silo: ' .. flib.trace_entity(rocket_silo)
    flib.trace_event(output)
end)
end
module.events[defines.events.on_rocket_launch_ordered] = on_rocket_launch_ordered


local function on_rocket_launched(e)
pcall( function() 
    local LuaPlayer = {}
    if e.player_index then LuaPlayer = game.players[e.player_index] else LuaPlayer = nil end
    local rocket = e.rocket
    local rocket_silo = e.rocket_silo

    local output = ' > on_rocket_launched                | '
    if LuaPlayer then output = output .. flib.trace_player(LuaPlayer) .. ', ' end
    output = output .. 'rocket: ' .. flib.trace_entity(rocket) .. ', rocket_silo: ' .. flib.trace_entity(rocket_silo)
    flib.trace_event(output)
end)
end
module.events[defines.events.on_rocket_launched] = on_rocket_launched


local function on_runtime_mod_setting_changed(e)
pcall( function() 
    local LuaPlayer = game.players[e.player_index]
    local setting = e.setting
    local setting_type = e.setting_type

    local output = ' > on_runtime_mod_setting_changed | ' .. flib.trace_player(LuaPlayer) .. ', setting: "' .. setting .. '", setting_type: "' .. setting_type .. '"'
    flib.trace_event(output)
end)
end
module.events[defines.events.on_runtime_mod_setting_changed] = on_runtime_mod_setting_changed


local function on_train_changed_state(e)
pcall( function() 
    -- future release
end)
end
module.events[defines.events.on_train_changed_state] = on_train_changed_state


local function on_train_created(e)
pcall( function() 
    local train = e.train

    local output = ' > on_train_created | Train(id):(' .. train.id .. ')'
    flib.trace_event(output)
end)
end
module.events[defines.events.on_train_created] = on_train_created


local function on_train_schedule_changed(e)
pcall( function() 
    if not game.active_mods["LogisticTrainNetwork"] then 
        local LuaPlayer = {}
        if e.player_index then LuaPlayer = game.players[e.player_index] else LuaPlayer = nil end
        local train = e.train

        local output = ' > on_train_schedule_changed | ' 
        if LuaPlayer then output = output .. flib.trace_player(LuaPlayer) .. ', ' end
        output = output .. 'Train(id):(' .. train.id .. ')'
        flib.trace_event(output)
    end
end)
end
module.events[defines.events.on_train_schedule_changed] = on_train_schedule_changed


local function on_trigger_created_entity(e)
pcall( function() 
    -- future release
end)
end
module.events[defines.events.on_trigger_created_entity] = on_trigger_created_entity


local function on_trigger_fired_artillery(e)
pcall( function() 
    -- future release
end)
end
module.events[defines.events.on_trigger_fired_artillery] = on_trigger_fired_artillery


-------------------------------------
return module