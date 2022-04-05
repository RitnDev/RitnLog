----------------------------------------------------------------------------------------
local RitnEvent = require(ritnlog.defines.classes.RitnEvent)
----------------------------------------------------------------------------------------
local ritnlog_interface =
{
----------------------------------------------------------------------------------------
--                                trace_event
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
----------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------
--                                disable_event
  disable_event = function(event_name)
    if global.log.events[event_name] then 
      global.log.events[event_name] = false
    end
  end,
----------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------
--                                disable_event
mod_name = function(mod_name)
  if mod_name then 
    if type(mod_name) == "string" then 
      if mod_name ~= "" then 
        global.log.mod_name = mod_name
      end
    end
  end
end,
----------------------------------------------------------------------------------------

}






if not remote.interfaces["ritnlog"] then
  remote.add_interface("ritnlog", ritnlog_interface)
end