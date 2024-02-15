local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Shell
config.default_prog = { '/usr/bin/fish'}

-- Theme
local material = wezterm.color.get_builtin_schemes()['Material (base16)'];
material.background = '#161414'
config.color_schemes = {
	['Better Material'] = material,
}
config.color_scheme = 'Better Material'

-- General Settings
config.enable_tab_bar = false
config.initial_cols = 160
config.initial_rows = 48

return config
