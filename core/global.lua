require("__RitnLib__.defines")
ritnlog = {defines = require("core/defines")}


-------------------- Global ------------------------
if not global.log then global.log = {
    default_active = false,
    scenario_active = false,
    players = {},
}
end