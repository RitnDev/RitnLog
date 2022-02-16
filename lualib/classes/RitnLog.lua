require "core.class"
----------------------------------------------------------------

local RitnLog = newclass(function(base, ...)
    --base.classname = "RitnLog"
    base.type = "none"
end)

-- set RitnEvent
function RitnLog:event(RitnEvent)
    self.type = "event"
    self.event = RitnEvent
    return self
end

-- set details
function RitnLog:details(details)
    self.type = "details"
    self.details = details
    return self
end

----------------------------------------------------------------
return RitnLog