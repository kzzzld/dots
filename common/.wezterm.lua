-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Appearance
config.color_scheme = "Catppuccin Mocha"
config.window_background_opacity = 0.9
config.colors = {
	tab_bar = {
		active_tab = {
			bg_color = "#89b4fa",
			fg_color = "#1e1e2e",
		},
	},
}

-- Font
config.font_size = 13
config.font = wezterm.font("JetBrainsMono Nerd Font")

-- Tabbar
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- Window
-- config.window_decorations = "TITLE|RESIZE|MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
config.window_decorations = "RESIZE"

config.window_padding = {
	left = 25,
	right = 25,
	top = 25,
	bottom = 25,
}

-- Behaviour
config.window_close_confirmation = "NeverPrompt"

-- Keybindings
config.keys = {
	{
		key = "r",
		mods = "OPT|SHIFT",
		action = wezterm.action.ReloadConfiguration,
	},
	{
		key = "d",
		mods = "OPT",
		action = wezterm.action.SplitHorizontal({
			domain = "CurrentPaneDomain",
		}),
	},
	{
		key = "s",
		mods = "OPT",
		action = wezterm.action.SplitVertical({
			domain = "CurrentPaneDomain",
		}),
	},
	{
		key = "h",
		mods = "OPT",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "OPT",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "OPT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "OPT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "w",
		mods = "OPT",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
	{ key = "1", mods = "OPT", action = wezterm.action.ActivateTab(0) },
	{ key = "2", mods = "OPT", action = wezterm.action.ActivateTab(1) },
	{ key = "3", mods = "OPT", action = wezterm.action.ActivateTab(2) },
	{ key = "4", mods = "OPT", action = wezterm.action.ActivateTab(3) },
	{ key = "6", mods = "OPT", action = wezterm.action.ActivateTab(5) },
	{ key = "7", mods = "OPT", action = wezterm.action.ActivateTab(6) },
	{ key = "8", mods = "OPT", action = wezterm.action.ActivateTab(7) },
	{ key = "9", mods = "OPT", action = wezterm.action.ActivateTab(8) },
}

-- Finally, return the configuration to wezterm:
return config
