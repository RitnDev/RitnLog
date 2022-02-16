require "core.class"
----------------------------------------------------------------

local RitnEvent = newclass(function(base, e)
    --base.classname = "RitnEvent"
    if e ~= nil then 
        for name,ev in pairs(defines.events) do
            if defines.events[name] ==  e.name then 
                base.id = ev
                base.event_name = name
            end
        end
    end
end)


-- set RitnPlayer
function RitnEvent:player(RitnPlayer)
    if RitnPlayer then
        self.player = RitnPlayer
    end
    return self
end

-- set old_force
function RitnEvent:old_force(LuaForce)
    if LuaForce then 
        self.old_force = LuaForce.name
    end
    return self
end

-- set old_surface
function RitnEvent:old_surface(LuaSurface)
    if LuaSurface then 
        self.old_surface = LuaSurface.name
    end
    return self
end

-- set position
function RitnEvent:position(position)
    if type(position) == "table" then
        self.position = {
            x=math.floor(position.x),
            y=math.floor(position.y),
        }
    end
    return self
end

-- set cursor
function RitnEvent:cursor(LuaPlayer)
    if LuaPlayer then 
        self.cursor = {
            name = LuaPlayer.cursor_stack.name,
            count = LuaPlayer.cursor_stack.count,
        }
    end
    return self
end

----------------------------------------------------------------
return RitnEvent