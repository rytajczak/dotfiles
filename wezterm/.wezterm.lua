local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.default_prog = { "tmux" }

config.font_size = 16
config.font = wezterm.font("0xProto Nerd Font Mono")

config.color_scheme = "Catppuccin Mocha"
config.colors = { background = "#161414" }

config.enable_tab_bar = false
config.enable_wayland = false

return config
