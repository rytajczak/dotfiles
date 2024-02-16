local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.default_prog = { '/usr/bin/fish'}

-- Theme
local material = wezterm.color.get_builtin_schemes()['Material (base16)'];
material.background = '#161414'
config.color_schemes = {
	['Better Material'] = material,
}
config.color_scheme = 'Better Material'
config.font_size = 14

-- General Settings
config.enable_tab_bar = false
config.window_background_opacity = 0.9

return config
