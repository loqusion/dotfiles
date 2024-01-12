local style = require("config.style")
local g = vim.g

local function alpha()
  return string.format("%x", math.floor((255 * g.transparency) or 0.8))
end

if vim.g.neovide then
  g.neovide_transparency = style.transparent and 0.9 or 1.0
  g.transparency = style.transparent and 0.9 or 1.0
  g.neovide_background_color = "#1E1E2E" -- .. alpha()

  g.neovide_cursor_vfx_mode = "railgun"
  g.neovide_input_macos_alt_is_meta = true
  g.neovide_fullscreen = false
  g.neovide_remember_window_size = false
end
