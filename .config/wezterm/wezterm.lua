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

-- fix: font size adjustment blocking on wayland tiling compositors
-- for default value, see https://wezfurlong.org/wezterm/config/lua/config/tiling_desktop_environments.html
config.tiling_desktop_environments = config.tiling_desktop_environments
  or {
    'X11 LG3D',
    'X11 bspwm',
    'X11 i3',
    'X11 dwm',
  }
table.insert(config.tiling_desktop_environments, 'X11 wlroots wm')

return compose(config, { color_scheme, font, tab, keymaps, window })
