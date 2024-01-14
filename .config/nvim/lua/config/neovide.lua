local g = vim.g

local transparent = true
local unify_transparency = false
local opacity = transparent and 0.9 or 1.0

if vim.g.neovide then
  -- NOTE: g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
  g.neovide_transparency = unify_transparency and 0.0 or opacity
  g.transparency = unify_transparency and opacity or 1.0
  g.neovide_background_color = "#1E1E2E"
  g.neovide_underline_stroke_scale = 0.1

  g.neovide_cursor_vfx_mode = "railgun"
  g.neovide_input_macos_alt_is_meta = true
  g.neovide_fullscreen = false
  g.neovide_remember_window_size = false

  g.neovide_scale_factor = 1.0
  local change_scale_factor = function(delta)
    g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end
  vim.keymap.set("n", "<C-=>", function()
    change_scale_factor(1.1)
  end)
  vim.keymap.set("n", "<C-->", function()
    change_scale_factor(1 / 1.1)
  end)
end
