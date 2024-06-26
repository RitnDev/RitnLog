-- RitnLogEvent
----------------------------------------------------------------

local function getEventName(event)
    for name,ev in pairs(defines.events) do
        if event.name == 0 then return "on_tick" end
        if defines.events[name] == event.name then 
            return name
        end
    end
end

----------------------------------------------------------------
--- CLASSE DEFINES
----------------------------------------------------------------
RitnLogEvent = ritnlib.classFactory.newclass(RitnLibEvent, function(self, event)
    if event == nil then return end
    RitnLibEvent.init(self, event, ritnlib.defines.log.name)
    --------------------------------------------------
    self.mod_name = global.log.mod_name
    self.force_print = force_print
    self.ignore = false
    self.data = {}
    self.data.type = "details"

    if self.event then 
        self.data.type = "event"
        self.data.event = {
            id = self.index,
            event_name = self.name,
        }

        if self.player then 
            self.data.event.player = {}
            self.data.event.player.index = self.player.index
            self.data.event.player.name = self.player.name

            if global.log.settings.option_player_advanced == true then 
                self.data.event.player.force_name = self.player.force.name
                self.data.event.player.surface_name = self.player.surface.name
                self.data.event.player.controller_type = self.player.controller_type
            end
        end

        if string.sub(self.name,1,13) ==  "on_pre_player" then 
            self.ignore = true
        end
    end
end)
----------------------------------------------------------------


-- declenche des events pour création des infos par defaut du jeu
function RitnLogEvent:active_default()
    if global.log.default_active == false then 
        -- create force by default (neutral, enemy, player)
        local ev = {name = defines.events.on_force_created}
        local data = {}
        data.type = "event"
        data.event = {
            name = getEventName(ev),
            index = ev.name
        }
        data.event.force = {}
        -- neutral
        local LuaForce = game.forces['neutral']
        data.event.force.index = LuaForce.index
        data.event.force.name = LuaForce.name    
        if self.ignore == false then 
            self:log(self.force_print, data)
        end
        -- enemy
        local LuaForce = game.forces['enemy']
        data.event.force.index = LuaForce.index
        data.event.force.name = LuaForce.name
        if self.ignore == false then 
            self:log(self.force_print, data)
        end
        -- player
        local LuaForce = game.forces['player']
        data.event.force.index = LuaForce.index
        data.event.force.name = LuaForce.name
        if self.ignore == false then 
            self:log(self.force_print, data)
        end

        global.log.default_active = true
    end
end


function RitnLogEvent:createGlobalPlayer()
    local LuaPlayer = self.player
    self:active_default()
    if not global.log.players[LuaPlayer.name] then 
        global.log.players[LuaPlayer.name] = {
            name = LuaPlayer.name,
            index = LuaPlayer.index
        }
    end
    return self
end
----------------------------------------------------------------


-- GETTERS


function RitnLogEvent:getName()
    return self.name
end

function RitnLogEvent:getIndex()
    return self.index
end

function RitnLogEvent:getModName()
    return self.mod_name
end

function RitnLogEvent:getIgnore()
    return self.ignore
end



-- SETTERS

function RitnLogEvent:setModName(modName)
    if modName then 
        if type(modName) == "string" then 
            self.mod_name = modName
        end
    end
    return self
end


function RitnLogEvent:setIgnore(ignore)
    if type(ignore) == "boolean" then 
        self.ignore = ignore
    end
    return self
end


function RitnLogEvent:playerChangedPosition()
    if global.log.scenario_active == true then return self end

    local LuaPlayer = self.player
    if LuaPlayer then 
        if LuaPlayer.valid then 
            if LuaPlayer.object_name == "LuaPlayer" then 
                if global.log.settings.advanced_position then 
                    self.data.event.position = {
                        x=LuaPlayer.position.x,
                        y=LuaPlayer.position.y,
                    }
                else
                    self.data.event.position = {
                        x=math.floor(LuaPlayer.position.x),
                        y=math.floor(LuaPlayer.position.y),
                    }
                end
            end
        end
    end

    return self
end


function RitnLogEvent:playerChangedForce()
    local LuaForce = self.force
    if LuaForce then 
        if LuaForce.valid then 
            if LuaForce.object_name == "LuaForce" then 
                self.data.event.old_force = LuaForce.name
            end
        end
    end
    return self
end


function RitnLogEvent:playerChangedSurface()
    local LuaSurface = self.surface
    if LuaSurface then 
        if LuaSurface.valid then 
            if LuaSurface.object_name == "LuaSurface" then 
                self.data.event.old_surface = LuaSurface.name
            end
        end
    end
    return self
end


function RitnLogEvent:playerLeftGame()
    if self.reason then 
        if type(self.reason) == "string" then 
            self.data.event.reason = self.reason
        end
    end
    return self
end


function RitnLogEvent:playerBanned()
    self.data.event.banned = {
        name = "",
        byPlayer = "server",
    }
    
    pcall(function() self.data.event.banned.name = self.player.name end)
    pcall(function() 
        local byPlayer = game.players[self.event.by_player]
        self.data.event.banned.byPlayer = byPlayer.name 
    end)
    pcall(function() self.data.event.banned.reason = self.reason end)
    
    return self
end

function RitnLogEvent:playerUnbanned()
    self.data.event.unbanned = {
        name = "",
        byPlayer = "server",
    }
    
    pcall(function() self.data.event.unbanned.name = self.player.name end)
    pcall(function() 
        local byPlayer = game.players[self.event.by_player]
        self.data.event.unbanned.byPlayer = byPlayer.name 
    end)
    pcall(function() self.data.event.unbanned.reason = self.reason end)
    
    return self
end


function RitnLogEvent:playerKicked()
    self.data.event.kicked = {
        byPlayer = "server",
    }

    pcall(function() 
        local byPlayer = game.players[self.event.by_player]
        self.data.event.kicked.byPlayer = byPlayer.name 
    end)
    pcall(function() self.data.event.kicked.reason = self.reason end)
    
    return self
end


function RitnLogEvent:playerDied()
    local LuaEntity = self.cause

    if LuaEntity then 
        pcall(function()
            self.data.event.cause = {
                name = LuaEntity.name,
                force_name = LuaEntity.force.name
            }
        end)
    end

    return self
end


function RitnLogEvent:playerCursorChanged()
    local LuaPlayer  = self.player

    self.data.event.cursor = {}
    self.data.event.cursor.name = "empty-hand"
    self.data.event.cursor.count = 0
    pcall(function() 
        if LuaPlayer.cursor_stack ~= nil and LuaPlayer.cursor_stack.valid_for_read then 
            self.data.event.cursor.name = LuaPlayer.cursor_stack.name
            self.data.event.cursor.count = LuaPlayer.cursor_stack.count
        end
    end)

    return self
end


function RitnLogEvent:playerDisplayScaleChanged()
    local LuaPlayer = self.player

    pcall(function()
        self.data.event.scale = {
            current_scale = LuaPlayer.display_scale,
            old_scale = self.m_event.old_scale,
        }
    end)

    return self
end


----------------------------------------------------------------

--- METHODES

function RitnLogEvent:setData(data)
    self.data.details = data
    return self
end


-- trace Log ( ou print() )
function RitnLogEvent:log(force_print, data)

    if self.ignore ~= nil then
        if self.ignore == true then return end
    end

    pcall(function()      
        local print_ok = false
        local local_data = {}
        if data == nil then
            local_data = self.data
        else
            local_data = data
        end
        
        if global.log.use_print then 
            print('[' .. string.upper(self.mod_name) .. '] > ' .. game.table_to_json(local_data)) 
            print_ok = true
        end
        
        if global.log.use_log then 
            log('[' .. string.upper(self.mod_name) .. '] > ' .. game.table_to_json(local_data)) 
        end
        
        if force_print == nil then return end
        
        if force_print == true and print_ok == false then 
            print('[' .. string.upper(self.mod_name) .. '] > ' .. game.table_to_json(local_data)) 
        end
    end)
end


----------------------------------------------------------------
--return RitnLogEvent