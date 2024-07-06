local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.default_prog = { "tmux" }

config.font_size = 14
config.font = wezterm.font("MesloLGS Nerd Font Mono")

config.color_scheme = "Dark+"

config.enable_tab_bar = false
config.enable_wayland = false

return config
