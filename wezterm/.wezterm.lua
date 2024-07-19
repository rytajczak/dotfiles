local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.default_prog = { "fish" }

config.font_size = 14
config.font = wezterm.font("0xProto Nerd Font Mono")

config.color_scheme = "Catppuccin Mocha"
config.colors = { background = "#1e1e1e" }

config.enable_tab_bar = false
config.enable_wayland = false

return config
