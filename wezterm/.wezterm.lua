local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.default_prog = { "tmux" }

config.font_size = 14
config.font = wezterm.font("0xProto Nerd Font Mono")

config.color_scheme = "carbonfox"
config.colors = { background = "#242424" }

config.enable_tab_bar = false
config.enable_wayland = false

return config
