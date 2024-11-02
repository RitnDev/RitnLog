local modules = {}
log('modules RitnLog')
------------------------------------------------------------------------------
-- Inclus les events onInit et onLoad + les ajouts de commandes
modules.log_globals =   require(ritnlib.defines.log.modules.globals)
------------------------------------------------------------------------------
modules.log_events = require(ritnlib.defines.log.modules.events)
--modules.player = require(ritnlib.defines.log.modules.player)
------------------------------------------------------------------------------
return modules