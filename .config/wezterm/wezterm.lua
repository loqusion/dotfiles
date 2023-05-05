local wezterm = require 'wezterm'
local compose = require 'compose'
local color_scheme = require 'color_scheme'
local font = require 'font'
local tab = require 'tab'
local keymaps = require 'keymaps'

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- disable title bar, but keep resize
config.window_decorations = 'RESIZE'

config.scrollback_lines = 10000

return compose(config, { color_scheme, font, tab, keymaps })
