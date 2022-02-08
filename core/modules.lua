local modules = {}
------------------------------------------------------------------------------
require(ritnlog.defines.log.remote) -- remote log
------------------------------------------------------------------------------
-- settings
local disable_log = settings.startup[ritnlog.defines.settings.name.disable_log].value
------------------------------------------------------------------------------
if disable_log == false then 
    modules.events = require(ritnlog.defines.log.events)
end
------------------------------------------------------------------------------
return modules