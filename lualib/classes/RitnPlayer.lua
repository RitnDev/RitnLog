require "core.class"
----------------------------------------------------------------

local RitnPlayer = newclass(function(base, LuaPlayer)
    if LuaPlayer then 
        base.index = LuaPlayer.index
        base.name = LuaPlayer.name 
        
    end
end)

-- set force_name
function RitnPlayer:force(LuaPlayer)
    if LuaPlayer then 
        self.force_name = LuaPlayer.force.name
    end
    return self
end

-- set surface_name
function RitnPlayer:surface(LuaPlayer)
    if LuaPlayer then 
        self.surface_name = LuaPlayer.force.name
    end
    return self
end

-- set controller_type
function RitnPlayer:controllerType(LuaPlayer)
    if LuaPlayer then 
        self.controller_type = LuaPlayer.controller_type
    end
    return self
end

-- set controller_type
function RitnPlayer:controllerType(LuaPlayer)
    if LuaPlayer then 
        self.controller_type = LuaPlayer.controller_type
    end
    return self
end

----------------------------------------------------------------
return RitnPlayer