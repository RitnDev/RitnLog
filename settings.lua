--INITIALIZE
require("__RitnLog__.core.defines")

data:extend({

 	{
		-- Désactiver tous les logs
		type = "bool-setting",
		name = ritnlib.defines.log.settings.name.disable_log,
		setting_type = "startup",
		default_value = ritnlib.defines.log.settings.value.disable_log,
		order = ritnlib.defines.log.names.prefix.log .. "0000",
	},
	{
		-- Activer les log via print() 
		type = "bool-setting",
		name = ritnlib.defines.log.settings.name.enable_log_print,
		setting_type = "startup",
		default_value = ritnlib.defines.log.settings.value.enable_log_print,
		order = ritnlib.defines.log.names.prefix.log .. "0001",
	},
--[[ 	{
		-- Activer les log via log() 
		type = "bool-setting",
		name = ritnlib.defines.log.settings.name.enable_log_log,
		setting_type = "startup",
		default_value = ritnlib.defines.log.settings.value.enable_log_log,
		order = ritnlib.defines.log.names.prefix.log .. "0001",
	}, ]]
	{
		-- Activer toutes les options "player"
		type = "bool-setting",
		name = ritnlib.defines.log.settings.name.player_all_option,
		setting_type = "startup",
		default_value = ritnlib.defines.log.settings.value.player_all_option,
		order = ritnlib.defines.log.names.prefix.log .. "0002",
	},
	{
		-- Activer les options "player" administratif
		type = "bool-setting",
		name = ritnlib.defines.log.settings.name.option_player_admin,
		setting_type = "startup",
		default_value = ritnlib.defines.log.settings.value.option_player_admin,
		order = ritnlib.defines.log.names.prefix.log .. "0003",
	},
	{
		-- Activer les options avancées pour les events on_player
		type = "bool-setting",
		name = ritnlib.defines.log.settings.name.option_player_advanced,
		setting_type = "startup",
		default_value = ritnlib.defines.log.settings.value.option_player_advanced,
		order = ritnlib.defines.log.names.prefix.log .. "0004",
	},
	{
		-- Activer l'event "player" : on_player_changed_position
		type = "bool-setting",
		name = ritnlib.defines.log.settings.name.player_position_option,
		setting_type = "startup",
		default_value = ritnlib.defines.log.settings.value.player_position_option,
		order = ritnlib.defines.log.names.prefix.log .. "0005",
	},
	{
		-- La position n'est pas arrondis pour : on_player_changed_position
		type = "bool-setting",
		name = ritnlib.defines.log.settings.name.advanced_position,
		setting_type = "startup",
		default_value = ritnlib.defines.log.settings.value.advanced_position,
		order = ritnlib.defines.log.names.prefix.log .. "0006",
	},
	{
		-- Activer l'event "player" : on_player_cursor_stack_changed
		type = "bool-setting",
		name = ritnlib.defines.log.settings.name.player_cursor_option,
		setting_type = "startup",
		default_value = ritnlib.defines.log.settings.value.player_cursor_option,
		order = ritnlib.defines.log.names.prefix.log .. "0007",
	},
	{
		-- Activer les log de l'event : on_game_created_from_scenario
		type = "bool-setting",
		name = ritnlib.defines.log.settings.name.on_game_created_from_scenario,
		setting_type = "startup",
		default_value = ritnlib.defines.log.settings.value.on_game_created_from_scenario,
		order = ritnlib.defines.log.names.prefix.log .. "0008",
	},
	{
		-- Activer les log de l'event : on_cutscene_cancelled
		type = "bool-setting",
		name = ritnlib.defines.log.settings.name.on_cutscene_cancelled,
		setting_type = "startup",
		default_value = ritnlib.defines.log.settings.value.on_cutscene_cancelled,
		order = ritnlib.defines.log.names.prefix.log .. "0009",
	}

})