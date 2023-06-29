local wezterm = require 'wezterm'
local act = wezterm.action
local disable = act.DisableDefaultAssignment

local smart_splits = require 'smart-splits'

local mod = 'SHIFT|ALT'

return function(config)
  config.keys = {}

  local disabled = {
    { key = 'Enter', mods = 'ALT', action = disable },
    { key = '_', mods = 'CTRL', action = disable },
    { key = '_', mods = 'CTRL|SHIFT', action = disable },
    { key = '+', mods = 'CTRL', action = disable },
    { key = '+', mods = 'CTRL|SHIFT', action = disable },
    { key = ')', mods = 'CTRL', action = disable },
    { key = ')', mods = 'CTRL|SHIFT', action = disable },
    { key = 'L', mods = 'CTRL|SHIFT', action = disable },
    { key = 'Z', mods = 'CTRL|SHIFT', action = disable },
  }

  local debug_ = {
    { key = 'D', mods = 'CTRL|SHIFT', action = act.ShowDebugOverlay },
  }

  local pane = {
    { key = '\\', mods = mod, action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = '|', mods = mod, action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = '-', mods = mod, action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = '_', mods = mod, action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = 'Z', mods = mod, action = act.TogglePaneZoomState },
    { key = 'W', mods = mod, action = act.CloseCurrentPane { confirm = true } },
  }

  for _, vv in ipairs { disabled, debug_, pane, smart_splits.keys } do
    for _, v in ipairs(vv) do
      table.insert(config.keys, v)
    end
  end
end
