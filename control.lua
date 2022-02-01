require("core.global")
-- Chargement de l'event listener :
local event_listener = require(ritnlib.defines.event)
-- Activation de gvv s'il est présent
if script.active_mods["gvv"] then require(ritnlib.defines.gvv)() end
-- envoie des modules à l'event listener :
event_listener.add_libraries(require(ritnlog.defines.Modules))
