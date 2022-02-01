local flib = require(ritnlog.defines.flib)
local category = "player"
-- settings
local all_option = settings.startup[ritnlog.defines.settings.name.player_all_option].value
local position_option = settings.startup[ritnlog.defines.settings.name.player_position_option].value
local cursor_stack_option = settings.startup[ritnlog.defines.settings.name.player_cursor_option].value
--
local module = {}
module.events = {}
-----------------------
--   Main functions
-----------------------

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

local function on_player_created(e)
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }

    flib.trace_event(data)
end

local function on_player_died(e)
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
    
    flib.trace_event(data)
end
  
local function on_player_kicked(e)
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
    
    flib.trace_event(data)
end
   
local function on_player_left_game(e)
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
    
    flib.trace_event(data)
end

local function on_player_promoted(e)
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
    
    flib.trace_event(data)
end

local function on_player_demoted(e)
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
    
    flib.trace_event(data)
end
   
local function on_player_removed(e)
    local data = data_player(e)
    flib.trace_event(data)
end

local function on_player_respawned(e)
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
    
    flib.trace_event(data)
end

local function on_player_joined_game(e)
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
    
    flib.trace_event(data)
end

local function on_player_changed_surface(e)
    local LuaSurface = game.surfaces[e.surface_index]
    
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
        surface = LuaSurface.name
    }

    flib.trace_event(data)
end

local function on_player_muted(e)
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
    
    flib.trace_event(data)
end

local function on_player_unmuted(e)
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
    
    flib.trace_event(data)
end

local function on_player_changed_force(e)
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
        old_force = e.force.name
    }

    flib.trace_event(data)
end

-----------------------
-- Function Position
-----------------------

local function on_player_changed_position(e)
    local LuaPlayer = game.players[e.player_index]
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
        position = flib.get_position(LuaPlayer.position),
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

-----------------------
-- Optionnal Functions
-----------------------

local function on_player_cheat_mode_disabled(e)
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
    
    flib.trace_event(data)
end
   
local function on_player_cheat_mode_enabled(e)
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
    
    flib.trace_event(data)
end


local function on_player_alt_selected_area(e)
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
    
    flib.trace_event(data)
end 

local function on_player_ammo_inventory_changed(e)
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
    
    flib.trace_event(data)
end 

local function on_player_armor_inventory_changed(e)
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
    
    flib.trace_event(data)
end 

local function on_player_built_tile(e) 
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
    
    flib.trace_event(data)
end  

local function on_player_cancelled_crafting(e) 
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
    
    flib.trace_event(data)
end 

local function on_player_clicked_gps_tag(e)
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
    
    flib.trace_event(data)
end 

local function on_player_configured_blueprint(e)
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
    
    flib.trace_event(data)
end 

local function on_player_configured_spider_remote(e)
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
    
    flib.trace_event(data)
end 

local function on_player_crafted_item(e) 
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
    
    flib.trace_event(data)
end 

local function on_player_deconstructed_area(e) 
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
    
    flib.trace_event(data)
end 

local function on_player_display_resolution_changed(e)
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
        old_resolution = {
            width = e.old_resolution.width,
            height = e.old_resolution.height,
        },
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

local function on_player_driving_changed_state(e) 
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
    
    flib.trace_event(data)
end 

local function on_player_dropped_item(e) 
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
    
    flib.trace_event(data)
end 

local function on_player_fast_transferred(e) 
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
    
    flib.trace_event(data)
end 

local function on_player_flushed_fluid(e)
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
    
    flib.trace_event(data)
end 

local function on_player_gun_inventory_changed(e) 
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
    
    flib.trace_event(data)
end 

local function on_player_main_inventory_changed(e) 
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
    
    flib.trace_event(data)
end 

local function on_player_mined_entity(e) 
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
    
    flib.trace_event(data)
end 

local function on_player_mined_item(e)
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
    
    flib.trace_event(data)
end 

local function on_player_mined_tile(e)
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
    
    flib.trace_event(data)
end 


local function on_player_pipette(e)
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
    
    flib.trace_event(data)
end 

local function on_player_placed_equipment(e) 
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
    
    flib.trace_event(data)
end 

local function on_player_removed_equipment(e)
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
    
    flib.trace_event(data)
end 

local function on_player_repaired_entity(e) 
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
    
    flib.trace_event(data)
end 

local function on_player_rotated_entity(e) 
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
    
    flib.trace_event(data)
end 

local function on_player_selected_area(e) 
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
    
    flib.trace_event(data)
end 

local function on_player_set_quick_bar_slot(e) 
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
    
    flib.trace_event(data)
end 

local function on_player_setup_blueprint(e) 
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
        
    flib.trace_event(data)
end 

local function on_player_toggled_alt_mode(e) 
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
            
    flib.trace_event(data)
end 

local function on_player_toggled_map_editor(e) 
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
                
    flib.trace_event(data)
end 

local function on_player_trash_inventory_changed(e) 
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
    
    flib.trace_event(data)
end 

local function on_player_used_capsule(e) 
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
    
    flib.trace_event(data)
end 

local function on_player_used_spider_remote(e)
    local data = {
        event = flib.get_event(e, category),
        player = flib.get_player(e),
    }
    
    flib.trace_event(data)
end 


-----------------------

module.events[defines.events.on_player_joined_game] = on_player_joined_game
module.events[defines.events.on_player_unbanned] = on_player_unbanned
module.events[defines.events.on_player_banned] = on_player_banned
module.events[defines.events.on_player_created] = on_player_created
module.events[defines.events.on_player_died] = on_player_died
module.events[defines.events.on_player_kicked] = on_player_kicked
module.events[defines.events.on_player_left_game] = on_player_left_game
module.events[defines.events.on_player_promoted] = on_player_promoted
module.events[defines.events.on_player_demoted] = on_player_demoted
module.events[defines.events.on_player_removed] = on_player_removed
module.events[defines.events.on_player_muted] = on_player_muted
module.events[defines.events.on_player_unmuted] = on_player_unmuted
module.events[defines.events.on_player_respawned] = on_player_respawned
module.events[defines.events.on_player_changed_surface] = on_player_changed_surface
module.events[defines.events.on_player_changed_force] = on_player_changed_force

if position_option then 
    module.events[defines.events.on_player_changed_position] = on_player_changed_position
end

if cursor_stack_option then 
    module.events[defines.events.on_player_cursor_stack_changed] = on_player_cursor_stack_changed
end

if all_option then 
    module.events[defines.events.on_player_cheat_mode_enabled] = on_player_cheat_mode_enabled
    module.events[defines.events.on_player_cheat_mode_disabled] = on_player_cheat_mode_disabled  
    module.events[defines.events.on_player_alt_selected_area] = on_player_alt_selected_area  
    module.events[defines.events.on_player_ammo_inventory_changed] = on_player_ammo_inventory_changed
    module.events[defines.events.on_player_armor_inventory_changed] = on_player_armor_inventory_changed
    module.events[defines.events.on_player_built_tile] = on_player_built_tile
    module.events[defines.events.on_player_cancelled_crafting] = on_player_cancelled_crafting
    module.events[defines.events.on_player_clicked_gps_tag] = on_player_clicked_gps_tag
    module.events[defines.events.on_player_configured_blueprint] = on_player_configured_blueprint
    module.events[defines.events.on_player_configured_spider_remote] = on_player_configured_spider_remote
    module.events[defines.events.on_player_crafted_item] = on_player_crafted_item
    module.events[defines.events.on_player_deconstructed_area] = on_player_deconstructed_area
    module.events[defines.events.on_player_display_resolution_changed] = on_player_display_resolution_changed
    module.events[defines.events.on_player_display_scale_changed] = on_player_display_scale_changed
    module.events[defines.events.on_player_driving_changed_state] = on_player_driving_changed_state
    module.events[defines.events.on_player_dropped_item] = on_player_dropped_item
    module.events[defines.events.on_player_fast_transferred] = on_player_fast_transferred
    module.events[defines.events.on_player_flushed_fluid] = on_player_flushed_fluid
    module.events[defines.events.on_player_gun_inventory_changed] = on_player_gun_inventory_changed
    module.events[defines.events.on_player_main_inventory_changed] = on_player_main_inventory_changed
    module.events[defines.events.on_player_mined_entity] = on_player_mined_entity
    module.events[defines.events.on_player_mined_item] = on_player_mined_item
    module.events[defines.events.on_player_mined_tile] = on_player_mined_tile
    module.events[defines.events.on_player_pipette] = on_player_pipette
    module.events[defines.events.on_player_placed_equipment] = on_player_placed_equipment
    module.events[defines.events.on_player_removed_equipment] = on_player_removed_equipment
    module.events[defines.events.on_player_repaired_entity] = on_player_repaired_entity
    module.events[defines.events.on_player_rotated_entity] = on_player_rotated_entity
    module.events[defines.events.on_player_selected_area] = on_player_selected_area
    module.events[defines.events.on_player_set_quick_bar_slot] = on_player_set_quick_bar_slot
    module.events[defines.events.on_player_setup_blueprint] = on_player_setup_blueprint
    module.events[defines.events.on_player_toggled_alt_mode] = on_player_toggled_alt_mode
    module.events[defines.events.on_player_toggled_map_editor] = on_player_toggled_map_editor
    module.events[defines.events.on_player_trash_inventory_changed] = on_player_trash_inventory_changed
    module.events[defines.events.on_player_used_capsule] = on_player_used_capsule
    module.events[defines.events.on_player_used_spider_remote] = on_player_used_spider_remote
end

-----------------------
return module