local transparent = true

local function os_capture(cmd, raw)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read '*a')
  f:close()
  if raw then
    return s
  end
  s = string.gsub(s, '^%s+', '')
  s = string.gsub(s, '%s+$', '')
  s = string.gsub(s, '[\n\r]+', ' ')
  return s
end

local uname = os_capture 'uname -s'

return function(config)
  config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  }
  -- disable title bar, but keep resize
  config.window_decorations = uname == 'Darwin' and 'TITLE | RESIZE' or 'RESIZE'
  config.window_background_opacity = transparent and 0.90 or 1.00
  config.window_close_confirmation = 'NeverPrompt'

  config.initial_rows = 50
  config.initial_cols = 110
end
