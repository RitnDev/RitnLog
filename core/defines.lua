-----------------------------------------
--               DEFINES               --
-----------------------------------------
local defines = {}

defines.name_prefix = "ritnmods-log-"
defines.mod_name = "ritnlog"
defines.Modules = "core/modules"
defines.functions = {
    events = "lualib/functions/events",
    listener = "lualib/functions/event-listener",
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
    player_position_option = defines.name_prefix .. "player-position-option",
    player_cursor_option = defines.name_prefix .. "player-cursor-option",
}
defines.settings.value = {
    enable_log_print = true,
    enable_log_log = true,
    disable_log = false,
    player_all_option = false,
    player_position_option = true,
    player_cursor_option = false,
}

---------------
return defines