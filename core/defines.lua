-----------------------------------------
--               DEFINES               --
-----------------------------------------
local defines = {}

defines.name_prefix = "ritnmods-log-"
defines.mod_name = "ritnlog"


defines.core = {
    class = "core/class",
    modules = "core/modules",
    listener = "core/event-listener",
}


defines.classes = {
    RitnEvent = "classes/RitnEvent",
    RitnEventPlayer = "classes/RitnEventPlayer",
    RitnEventForce = "classes/RitnEventForce",
}


defines.log = {
    events = "lualib/log/events", 
    remote = "lualib/remote",
    player = "lualib/log/player",
}


defines.settings = {}
defines.settings.name = {
    enable_log_print = defines.name_prefix .. "enable-log-print",
    enable_log_log = defines.name_prefix .. "enable-log-log",
    disable_log = defines.name_prefix .. "disable-log",
    player_all_option = defines.name_prefix .. "player-all-option",
    option_player_advanced = defines.name_prefix .. "option-player-advanced",
    player_position_option = defines.name_prefix .. "player-position-option",
    player_cursor_option = defines.name_prefix .. "player-cursor-option",
    option_player_admin = defines.name_prefix .. "option-player-admin",
    advanced_position = defines.name_prefix .. "advanced-position",
}
defines.settings.value = {
    enable_log_print = true,
    enable_log_log = true,
    disable_log = false,
    player_all_option = false,
    option_player_advanced = false,
    player_position_option = false,
    player_cursor_option = false,
    option_player_admin = true,
    advanced_position = false,
}

---------------
return defines