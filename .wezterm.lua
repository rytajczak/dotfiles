local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.enable_wayland = false

config.default_prog = { "fish" }

-- Theme
local material = wezterm.color.get_builtin_schemes()["MaterialDarker"]
material.background = "#161414"
config.color_schemes = {
	["Better Material"] = material,
}
config.color_scheme = "Better Material"
config.font_size = 12

-- General Settings
config.enable_tab_bar = false
-- config.window_background_opacity = 0.9
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config
