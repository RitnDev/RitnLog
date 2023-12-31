--------  INIT DATA DEFINES CORE  ----------
if not ritnlib then ritnlib = { defines={} } end -- pour settings
ritnlib.defines.log = {}
--------------------------------------------
local name = "RitnLog"
local mod_name = "__"..name.."__"
local name_prefix = "ritnmods-log-"

local defines = {

    name = name,
    directory = mod_name,

    class = {
        event = mod_name .. ".classes.RitnEvent",
        log = mod_name .. ".classes.RitnLog",
    },

    modules = {
        core = mod_name .. ".core.modules",
        ----
        globals = mod_name .. ".modules.globals",
        ----
        events = mod_name .. ".modules.events",
        player = mod_name .. ".modules.player",
    },


    names = {
        prefix = {
            log = name_prefix,
        }
    },
  
    settings = {

        name = {
            enable_log_print = name_prefix .. "enable-log-print",
            enable_log_log = name_prefix .. "enable-log-log",
            disable_log = name_prefix .. "disable-log",
            player_all_option = name_prefix .. "player-all-option",
            option_player_advanced = name_prefix .. "option-player-advanced",
            player_position_option = name_prefix .. "player-position-option",
            player_cursor_option = name_prefix .. "player-cursor-option",
            option_player_admin = name_prefix .. "option-player-admin",
            advanced_position = name_prefix .. "advanced-position",
            on_game_created_from_scenario = name_prefix .. "on_game_created_from_scenario",
            on_cutscene_cancelled = name_prefix .. "on_cutscene_cancelled",
        },
        value = {
            enable_log_print = true,
            enable_log_log = true,
            disable_log = false,
            player_all_option = false,
            option_player_advanced = false,
            player_position_option = false,
            player_cursor_option = false,
            option_player_admin = true,
            advanced_position = false,
            on_game_created_from_scenario = false,
            on_cutscene_cancelled = false,
        }
    },
}

--------------------------------------------
ritnlib.defines.log = defines
log('declare : ritnlib.defines.log | '.. ritnlib.defines.log.name ..' -> finish !')
--------------------------------------------