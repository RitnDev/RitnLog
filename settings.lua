--INITIALIZE
ritnlog = {defines = require("core/defines")}

data:extend({

	{
		-- Activer toutes les options "player"
		type = "bool-setting",
		name = ritnlog.defines.settings.name.player_all_option,
		setting_type = "startup",
		default_value = ritnlog.defines.settings.value.player_all_option,
		order = ritnlog.defines.name_prefix .. "0001",
	},
	{
		-- Activer l'event "player" : on_player_changed_position
		type = "bool-setting",
		name = ritnlog.defines.settings.name.player_position_option,
		setting_type = "startup",
		default_value = ritnlog.defines.settings.value.player_position_option,
		order = ritnlog.defines.name_prefix .. "0002",
	},
	{
		-- Activer l'event "player" : on_player_cursor_stack_changed
		type = "bool-setting",
		name = ritnlog.defines.settings.name.player_cursor_option,
		setting_type = "startup",
		default_value = ritnlog.defines.settings.value.player_cursor_option,
		order = ritnlog.defines.name_prefix .. "0003",
	},

})