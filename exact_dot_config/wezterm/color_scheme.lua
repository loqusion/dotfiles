local wezterm = require 'wezterm'
local color_scheme = {
  dark = 'Catppuccin Mocha',
  light = 'Catppuccin Latte',
}

-- wezterm.gui is not available to the mux server, so take care to
-- do something reasonable when this config is evaluated by the mux
local function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

local function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return color_scheme.dark
  else
    return color_scheme.light
  end
end

return function(config)
  config.color_scheme = scheme_for_appearance(get_appearance())
end
