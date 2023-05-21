local wezterm = require 'wezterm'
local compose = require 'compose'
local color_scheme = require 'color_scheme'
local font = require 'font'
local tab = require 'tab'
local keymaps = require 'keymaps'
local window = require 'window'

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.scrollback_lines = 10000

-- temporary workaround for https://github.com/wez/wezterm/issues/1701
config.enable_wayland = false

return compose(config, { color_scheme, font, tab, keymaps, window })
