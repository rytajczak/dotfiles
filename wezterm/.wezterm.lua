local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.default_prog = { "zsh" }

config.font_size = 14
config.font = wezterm.font("JetBrainsMono Nerd Font")

config.color_scheme = "carbonfox"
config.colors = { background = "#000000" }
config.window_background_opacity = 0.80

config.enable_tab_bar = false
config.enable_wayland = false

return config
