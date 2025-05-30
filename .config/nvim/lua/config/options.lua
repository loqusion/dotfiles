local style = require("config.style")
local opt = vim.opt
local o = vim.o

-- LazyVim/Snacks.nvim options
-- See: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
vim.g.lazyvim_picker = "telescope"
vim.g.lazyvim_cmp = "nvim-cmp"
vim.g.lazyvim_explorer = "neo-tree"
vim.g.snacks_animate = true

vim.g.maplocalleader = [[\]]
opt.background = style.background
opt.backup = true -- Save backups to ~/.local/state/backup/
opt.backupdir:remove(".")
opt.colorcolumn = { "+1" }
opt.cursorline = true
opt.diffopt:append({ "vertical" })
opt.display = { "uhex" } -- Show unprintable characters as <xx>
opt.equalalways = false -- Splitting or closing a window won't automatically resize all windows
-- opt.fillchars:append({ diff = "╱", fold = " ", foldopen = "", foldsep = " ", foldclose = "", eob = " " })
opt.foldcolumn = "1"
opt.foldlevel = 99
opt.helpheight = 12 -- Minimum height of the help window
opt.linebreak = true -- Only break lines between punctuation and white space
opt.listchars:append({ precedes = "«", extends = "»" }) -- Text beyond horizontal window boundaries
opt.mousemodel = "extend"
opt.relativenumber = false -- Relative line numbers
opt.shell = "bash" -- Shell to use for ! and :! commands
opt.shiftwidth = 0 -- Use 'tabstop' value instead
opt.swapfile = false -- Don't use swapfile
-- opt.showbreak = "↪ " -- Show where line wraps
opt.showcmd = false -- Don't show command in statusline
opt.spelllang = { "en_us", "cjk" }
opt.tabstop = 4 -- Default tab width 4 spaces
opt.textwidth = 120 -- Maximum width of text
opt.virtualedit = "block" -- Allow positioning cursor where there is no text in visual block mode

local normal_font = "SauceCodePro NF"
local cjk_font = "Noto Serif CJK JP"
local emoji_font = "Twemoji"
local font_options = {
  "h12.5",
}
o.guifont = vim.fn.join({
  normal_font,
  cjk_font,
  emoji_font,
}, ",") .. ":" .. vim.fn.join(font_options, ":")
o.linespace = -2
