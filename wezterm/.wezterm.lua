-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Appearance
config.color_scheme = "Catppuccin Mocha"
config.colors = {
	tab_bar = {
		active_tab = {
			bg_color = "#89b4fa",
			fg_color = "#1e1e2e",
		},
	},
}

-- Font
config.font_size = 15
config.font = wezterm.font("JetBrainsMono Nerd Font")

-- Tabbar
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- Window
config.window_decorations = "TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"

-- Keybindings
config.keys = {
	{
		key = "r",
		mods = "CMD|SHIFT",
		action = wezterm.action.ReloadConfiguration,
	},
	{
		key = "d",
		mods = "CMD",
		action = wezterm.action.SplitHorizontal({
			domain = "CurrentPaneDomain",
		}),
	},
	{
		key = "s",
		mods = "CMD",
		action = wezterm.action.SplitVertical({
			domain = "CurrentPaneDomain",
		}),
	},
	{
		key = "h",
		mods = "CMD",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "CMD",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "CMD",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "CMD",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
}

-- Finally, return the configuration to wezterm:
return config
