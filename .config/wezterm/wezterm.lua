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

return compose(config, { color_scheme, font, tab, keymaps, window })
