---------------------------------------------------------------------------------------------
local enabled_all_events = not settings.startup[ritnlib.defines.log.settings.name.disable_log].value
---------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------
-- GLOBALS
---------------------------------------------------------------------------------------------
if storage.log == nil then 
    storage.log = {
        default_active = false,
        scenario_active = false,
        use_print = settings.startup[ritnlib.defines.log.settings.name.enable_log_print].value,
        use_log = false,
        mod_name = ritnlib.defines.log.name,
        players = {},
        settings = {
            all_option = enabled_all_events,
            all_option_player = settings.startup[ritnlib.defines.log.settings.name.player_all_option].value,
            position_option = settings.startup[ritnlib.defines.log.settings.name.player_position_option].value,
            option_player_advanced = settings.startup[ritnlib.defines.log.settings.name.option_player_advanced].value,
            cursor_stack_option = settings.startup[ritnlib.defines.log.settings.name.player_cursor_option].value,
            option_player_admin = settings.startup[ritnlib.defines.log.settings.name.option_player_admin].value,
            advanced_position = settings.startup[ritnlib.defines.log.settings.name.advanced_position].value,

            option_print = settings.startup[ritnlib.defines.log.settings.name.enable_log_print].value
        }
    }
end
----------------------------------------------------

-- active print()
--storage.log.use_print = storage.log.settings.option_print
--storage.log.use_log = storage.settings.option_logfile


if not storage.log.events then 
    storage.log.events = {}
    -- for all events
    for name,event in pairs(defines.events) do 
        if event ~= 0 then 
            storage.log.events[name] = enabled_all_events 
        end
    end
end

storage.log.events.on_game_created_from_scenario = settings.startup[ritnlib.defines.log.settings.name.on_game_created_from_scenario].value
storage.log.events.on_cutscene_cancelled = settings.startup[ritnlib.defines.log.settings.name.on_cutscene_cancelled].value
---------------------------------------------------------------------------------------------
-- REMOTE FUNCTIONS INTERFACE
---------------------------------------------------------------------------------------------
local RitnEvent = require(ritnlib.defines.log.class.event)
---------------------------------------------------------------------------------------------
local log_interface = {
    -----------------------------------------------------------------------------------------
    -- trace_event
    -- @param : map = {
    --    mod_name (string)     * necessary
    --    data (table)          * necessary
    --    e (defines.events)    not necessary
    --    force_print (bool)    not necessary
    -- }

    -- remote.call("ritnlog", "trace_event", {mod_name="myMod", data=data, e=e}) 
    -- remote.call("ritnlog", "trace_event", {mod_name="myMod", data=data}) 
    -- remote.call("ritnlog", "trace_event", {mod_name="myMod", data=data, e=nil, force_print=true})
    ----------------------------------------------------------------------------------------
    trace_event = function(map)
        -- pcall
        local statut, errorMsg = pcall(function() 
        --------------------------------------------
            -- event
            if map.e ~= nil then 
                RitnEvent:new(map.e)
            end
            -- Mod Name
            if type(map.mod_name) == "string" then
                RitnEvent:setModName(map.mod_name)
            end
            
            -- data
            if map.data == nil then 
                RitnEvent:setIgnore(true)
            else 
                RitnEvent:setData(map.data)
            end
            -- log
            RitnEvent:log(map.force_print) 
        --------------------------------------------
        end)
        -- status error
        if statut == (false or nil) then 
            log("[RITNLOG] > Error log : " .. errorMsg) 
        end
    end,

    -- disable_event
    disable_event = function(event_name)
        if storage.log.events[event_name] then 
            storage.log.events[event_name] = false
        end
    end,

    -- mod_name
    mod_name = function(mod_name)
        if mod_name then 
            if type(mod_name) == "string" then 
                if mod_name ~= "" then 
                    storage.log.mod_name = mod_name
                end
            end
        end
    end,

    get_mod_name = function()
        return storage.log.mod_name
    end,

    get_use_print = function()
        return settings.startup[ritnlib.defines.log.settings.name.enable_log_print].value
    end,

}
if not remote.interfaces["RitnLog"] then remote.add_interface("RitnLog", log_interface) end
---------------------------------------------------------------------------------------------
return {}