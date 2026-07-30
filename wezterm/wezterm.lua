local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.adjust_window_size_when_changing_font_size = false

config.audible_bell = "Disabled"

config.color_scheme = "Catpuccin Frappe"

config.default_prog = { "/opt/homebrew/bin/tmux" }

config.enable_tab_bar = false

config.font = wezterm.font("Monaspace Neon NF Light")

config.font_size = 13

config.keys = {
  -- shift-enter to send a newline
  -- (this is required for multi-line prompts in cursor agent)
  {
    key = "Enter",
    mods = "SHIFT",
    action = wezterm.action.SendString "\x0a"
  },
}

return config
