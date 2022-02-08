-- envoie des constantes : defines.events
for event,value in pairs(defines.events) do 
    local data = '{ "type": "constante", "name": "defines.events.' .. event .. ', "value": ' .. value .. '}'
    print("[RITNLOG] > " .. data)
    log("[RITNLOG] > " .. data)
end

-- envoie des constantes : defines.controllers 
for controller,value in pairs(defines.controllers) do 
    local data = '{ "type": "constante", "name": "defines.controllers.' .. controller .. ', "value": ' .. value .. '}'
    print("[RITNLOG] > " .. data)
    log("[RITNLOG] > " .. data)
end