local flib = require(ritnlog.defines.functions.events)

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
      local data = {}
      if type(map.data) ~= "table" then 
        data = {
          details = map.data
        }
      else 
        data = map.data
      end
      if map.e ~= nil then 
        data = flib.events.get(map.e, data)
      end
      return flib.log(data, map.mod_name, map.force_print) 
--------------------------------------------
    end)
-- status error
    if statut == (false or nil) then 
      log("[RITNLOG] > Error log : " .. errorMsg) 
    end
  end,
----------------------------------------------------------------------------------------
}






if not remote.interfaces["ritnlog"] then
  remote.add_interface("ritnlog", ritnlog_interface)
end