local style = require("config.style")
local g = vim.g
local opt = vim.opt

local normal_font = "JetBrainsMono Nerd Font:h14"
local italic_font = "VictorMono Nerd Font"

local function alpha()
  return string.format("%x", math.floor((255 * g.transparency) or 0.8))
end

if vim.g.neovide then
  opt.guifont = {
    normal_font,
    italic_font,
  }

  g.neovide_transparency = style.transparent and 0.9 or 1.0
  g.transparency = style.transparent and 0.9 or 1.0

  g.neovide_background_color = "#0f1117" .. alpha()

  g.neovide_input_macos_alt_is_meta = true

  g.neovide_cursor_vfx_mode = "railgun"
end