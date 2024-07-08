local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.default_prog = { "tmux" }

config.font_size = 14
config.font = wezterm.font("Comic Mono")

config.color_scheme = "Monokai (base16)"
config.colors = { background = "#161414" }

config.enable_tab_bar = false
config.enable_wayland = false

return config
