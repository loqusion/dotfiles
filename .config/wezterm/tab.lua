local wezterm = require 'wezterm'

local function format_tab_title()
  ---@diagnostic disable-next-line: unused-local
  wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
    return {
      { Text = ' ' .. tab.active_pane.title .. ' ' },
    }
  end)
end

return function(config)
  format_tab_title()
  config.hide_tab_bar_if_only_one_tab = true
  config.tab_bar_at_bottom = true
  config.window_background_opacity = 0.90
  config.show_tab_index_in_tab_bar = false
end
