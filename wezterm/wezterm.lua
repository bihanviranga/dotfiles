local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.adjust_window_size_when_changing_font_size = false

config.audible_bell = "Disabled"

config.color_scheme = "Catpuccin Mocha"

config.default_prog = { "/opt/homebrew/bin/tmux" }

config.enable_tab_bar = false

config.font = wezterm.font "AporeticSansMono Nerd Font"

config.font_size = 13

return config
