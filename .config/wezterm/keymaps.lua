local wezterm = require 'wezterm'
local act = wezterm.action
local disable = act.DisableDefaultAssignment
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

  local pane = {
    { key = '|', mods = mod, action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = '_', mods = mod, action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = 'H', mods = mod, action = act.ActivatePaneDirection 'Left' },
    { key = 'J', mods = mod, action = act.ActivatePaneDirection 'Down' },
    { key = 'K', mods = mod, action = act.ActivatePaneDirection 'Up' },
    { key = 'L', mods = mod, action = act.ActivatePaneDirection 'Right' },
    { key = 'H', mods = 'CTRL|' .. mod, action = act.AdjustPaneSize { 'Left', 4 } },
    { key = 'J', mods = 'CTRL|' .. mod, action = act.AdjustPaneSize { 'Down', 4 } },
    { key = 'K', mods = 'CTRL|' .. mod, action = act.AdjustPaneSize { 'Up', 4 } },
    { key = 'L', mods = 'CTRL|' .. mod, action = act.AdjustPaneSize { 'Right', 4 } },
    { key = 'Z', mods = mod, action = act.TogglePaneZoomState },
    { key = 'W', mods = mod, action = act.CloseCurrentPane { confirm = true } },
  }

  for _, vv in ipairs { disabled, pane } do
    for _, v in ipairs(vv) do
      table.insert(config.keys, v)
    end
  end
end
