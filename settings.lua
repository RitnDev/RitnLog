--INITIALIZE
ritnlog = {defines = require("core/defines")}

data:extend({

	{
		-- Désactiver tous les logs
		type = "bool-setting",
		name = ritnlog.defines.settings.name.disable_log,
		setting_type = "startup",
		default_value = ritnlog.defines.settings.value.disable_log,
		order = ritnlog.defines.name_prefix .. "0001",
	},
	{
		-- Activer les log via print() 
		type = "bool-setting",
		name = ritnlog.defines.settings.name.enable_log_print,
		setting_type = "startup",
		default_value = ritnlog.defines.settings.value.enable_log_print,
		order = ritnlog.defines.name_prefix .. "0001",
	},
	{
		-- Activer les log via log() 
		type = "bool-setting",
		name = ritnlog.defines.settings.name.enable_log_log,
		setting_type = "startup",
		default_value = ritnlog.defines.settings.value.enable_log_log,
		order = ritnlog.defines.name_prefix .. "0001",
	},
	{
		-- Activer toutes les options "player"
		type = "bool-setting",
		name = ritnlog.defines.settings.name.player_all_option,
		setting_type = "startup",
		default_value = ritnlog.defines.settings.value.player_all_option,
		order = ritnlog.defines.name_prefix .. "0002",
	},
	{
		-- Activer les options "player" administratif
		type = "bool-setting",
		name = ritnlog.defines.settings.name.option_player_admin,
		setting_type = "startup",
		default_value = ritnlog.defines.settings.value.option_player_admin,
		order = ritnlog.defines.name_prefix .. "0003",
	},
	{
		-- Activer les options avancées pour les events on_player
		type = "bool-setting",
		name = ritnlog.defines.settings.name.option_player_advanced,
		setting_type = "startup",
		default_value = ritnlog.defines.settings.value.option_player_advanced,
		order = ritnlog.defines.name_prefix .. "0004",
	},
	{
		-- Activer l'event "player" : on_player_changed_position
		type = "bool-setting",
		name = ritnlog.defines.settings.name.player_position_option,
		setting_type = "startup",
		default_value = ritnlog.defines.settings.value.player_position_option,
		order = ritnlog.defines.name_prefix .. "0005",
	},
	{
		-- Activer l'event "player" : on_player_cursor_stack_changed
		type = "bool-setting",
		name = ritnlog.defines.settings.name.player_cursor_option,
		setting_type = "startup",
		default_value = ritnlog.defines.settings.value.player_cursor_option,
		order = ritnlog.defines.name_prefix .. "0006",
	},

})