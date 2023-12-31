local modules = {}
------------------------------------------------------------------------------
-- Inclus les events onInit et onLoad + les ajouts de commandes
modules.globals =   require(ritnlib.defines.log.modules.globals)
------------------------------------------------------------------------------
modules.events = require(ritnlib.defines.log.modules.events)
--modules.player = require(ritnlib.defines.log.modules.player)
------------------------------------------------------------------------------
return modules