local wezterm = require 'wezterm'
local use_cursive_italics = true
local cursive_font = 'Victor Mono'

return function(config)
  config.font = wezterm.font 'JetBrains Mono'
  config.font_size = 12.0
  if use_cursive_italics then
    config.font_rules = {
      {
        italic = true,
        intensity = 'Bold',
        font = wezterm.font {
          family = cursive_font,
          weight = 'Bold',
          style = 'Italic',
        },
      },
      {
        italic = true,
        intensity = 'Half',
        font = wezterm.font {
          family = cursive_font,
          weight = 'DemiBold',
          style = 'Italic',
        },
      },
      {
        italic = true,
        intensity = 'Normal',
        font = wezterm.font {
          family = cursive_font,
          style = 'Italic',
        },
      },
    }
  end
  config.window_frame = {
    -- The font used in the tab bar.
    -- Roboto Bold is the default; this font is bundled
    -- with wezterm.
    -- Whatever font is selected here, it will have the
    -- main font setting appended to it to pick up any
    -- fallback fonts you may have used there.
    font = wezterm.font { family = 'Fira Code', weight = 'Bold' },

    -- The size of the font in the tab bar.
    -- Default to 10. on Windows but 12.0 on other systems
    font_size = 11.0,

    -- The overall background color of the tab bar when
    -- the window is focused
    active_titlebar_bg = '#12131d',

    -- The overall background color of the tab bar when
    -- the window is not focused
    inactive_titlebar_bg = '#1e2030',
  }
  config.cell_width = 0.9
end
