ritnlog = {defines = require("core/defines")}

-------------------- Global ------------------------
if not global.log then global.log = {
    default_active = false,
    scenario_active = false,
    use_print = false,
    use_log = false,
    players = {},
}
end

-- settings
if not global.settings then global.settings = {} end

global.settings.all_option = false
global.settings.all_option_player = settings.startup[ritnlog.defines.settings.name.player_all_option].value
global.settings.position_option = settings.startup[ritnlog.defines.settings.name.player_position_option].value
global.settings.option_player_advanced = settings.startup[ritnlog.defines.settings.name.option_player_advanced].value
global.settings.cursor_stack_option = settings.startup[ritnlog.defines.settings.name.player_cursor_option].value
global.settings.option_player_admin = settings.startup[ritnlog.defines.settings.name.option_player_admin].value

global.settings.option_print = settings.startup[ritnlog.defines.settings.name.enable_log_print].value
global.settings.option_logfile = settings.startup[ritnlog.defines.settings.name.enable_log_log].value


-- active print() or log()
global.log.use_print = global.settings.option_print
global.log.use_log = global.settings.option_logfile

if global.log.use_print == false and global.log.use_log == false then 
    --force print if not option actived
    global.log.use_print = true
end