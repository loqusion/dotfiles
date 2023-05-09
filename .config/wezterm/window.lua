return function(config)
  config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  }
  -- disable title bar, but keep resize
  config.window_decorations = 'RESIZE'
  config.window_background_opacity = 0.90
  config.window_close_confirmation = 'NeverPrompt'
end
