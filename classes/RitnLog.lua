-- RitnLog
----------------------------------------------------------------
--- FUNCTIONS
----------------------------------------------------------------

local function table_to_json(table)
    local json = "{"
    for key, value in pairs(table) do
        if type(value) == "table" then
            json = json .. '"' .. key .. '":' .. table_to_json(value) .. ','
        elseif type(value) == "string" then
            json = json .. '"' .. key .. '":"' .. value .. '",'
        else
            json = json .. '"' .. key .. '":' .. tostring(value) .. ','
        end
    end
    json = json:sub(1, -2) .. "}"
    return json
end


----------------------------------------------------------------
--- CLASSE DEFINES
----------------------------------------------------------------
RitnLog = ritnlib.classFactory.newclass(function(self, logType)
    local defaultType = "event"
    if logType ~= nil then 
        if type(logType) == "string" then
            defaultType = logType 
        end
    end
    ---------------------------------
    self.object_name = "RitnLog"
    self.mod_name = remote.call("RitnLog", "get_mod_name")
    self.use_print = remote.call("RitnLog", "get_use_print")
    ---------------------------------
    self.log_type = defaultType
    self.custom_type = (defaultType ~= "event")
    self.force_print = false
    self.ignore = false
    ---------------------------------
    self.event_index = 0
    self.event_name = "on_tick"
    self.data = {}
    ---------------------------------
    return self
end)


-- set mod_name
function RitnLog:setModName(name) 
    if type(name) == "string" then 
        self.mod_name = name
    end
    return self
end


-- ignore log
function RitnLog:setIgnore(value)
    if type(value) == "boolean" then 
        self.ignore = value
    end

    return self
end


-- set log type
function RitnLog:setType(value)
    if type(value) == "string" then 
        self.log_type = value
        self.custom_type = true
    end

    return self
end


-- set log data
function RitnLog:setData(value)
    if type(value) == "string" then 
        self.data.log = value
    elseif type(value) == "table" then 
        self.data = value
    end

    return self
end


-- force print() log
function RitnLog:setForcePrint(value)
    if type(value) == "boolean" then 
        self.force_print = value
    end

    return self
end


-- get RitnLogEvent
function RitnLog:getEvent(event)
    self.r_event = RitnLogEvent(event)
    self.event_index = self.r_event.index
    self.event_name = self.r_event.name

    self.data.type = "event"
    self.data.event = {
        id = self.event_index,
        event_name = self.event_name,
    }

    return self
end


function RitnLog:dataPlayer()
    if self.r_event.player == nil then return end

    self.data.event.player.index = self.r_event.player.index
    self.data.event.player.name = self.r_event.player.name

    if storage.log.settings.option_player_advanced == true then 
        self.data.event.player.force_name = self.r_event.player.force.name
        self.data.event.player.surface_name = self.r_event.player.surface.name
        self.data.event.player.controller_type = self.r_event.player.controller_type
    end
    
    return self
end



function RitnLog:dataPlayerChangedPosition()
    if self.r_event.player == nil then return end
    if storage.log.scenario_active == true then return self end

    if self.r_event.player.valid then 
        if self.r_event.player.object_name == "LuaPlayer" then 
            if storage.log.settings.advanced_position then 
                self.data.event.position = {
                    x=self.r_event.player.position.x,
                    y=self.r_event.player.position.y,
                }
            else
                self.data.event.position = {
                    x=math.floor(self.r_event.player.position.x),
                    y=math.floor(self.r_event.player.position.y),
                }
            end
        end
    end

    return self
end



-- trace log
function RitnLog:trace()
    if not self.ignore then
        log('[' .. string.upper(self.mod_name) .. '] > ' .. helpers.table_to_json(self.data))
    end

    if (self.use_print and not self.ignore)
    or self.force_print then 
        print('[' .. string.upper(self.mod_name) .. '] > ' .. helpers.table_to_json(self.data))
    end
end


--return RitnLog