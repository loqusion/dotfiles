local style = require("config.style")
local opt = vim.opt
local g = vim.g

vim.g.maplocalleader = [[\]]
opt.backup = true -- Save backups to ~/.local/state/backup/
opt.backupdir:remove(".")
opt.display = { "uhex" } -- Show unprintable characters as <xx>
opt.equalalways = false -- Splitting or closing a window won't automatically resize all windows
opt.fillchars:append({ diff = "╱", fold = " ", foldopen = "", foldsep = " ", foldclose = "", eob = " " })
opt.foldcolumn = "1"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
opt.foldmethod = "expr"
opt.helpheight = 12 -- Minimum height of the help window
opt.linebreak = true -- Only break lines between punctuation and white space
opt.listchars:append({ precedes = "«", extends = "»" }) -- Text beyond horizontal window boundaries
opt.mousemodel = "extend"
opt.relativenumber = false -- Relative line numbers
opt.shell = "bash" -- Shell to use for ! and :! commands
opt.shiftwidth = 0 -- Use 'tabstop' value instead
opt.showbreak = "  ↳  " -- Show where line wraps
opt.showcmd = false -- Don't show command in statusline
opt.spelllang = { "en_us", "cjk" }
opt.virtualedit = "block" -- Allow positioning cursor where there is no text in visual block mode

if vim.g.neovide then
  local function alpha()
    return string.format("%x", math.floor((255 * g.transparency) or 0.8))
  end
  opt.guifont = "JetBrainsMono Nerd Font Mono:h14"
  g.neovide_transparency = 0.0
  g.transparency = 0.9
  g.neovide_background_color = "#0f1117" .. alpha()
  g.neovide_input_macos_alt_is_meta = true
  g.neovide_cursor_vfx_mode = "railgun"
end
