local style = require("config.style")
local opt = vim.opt

vim.g.maplocalleader = [[\]]
opt.background = style.background
opt.backup = true -- Save backups to ~/.local/state/backup/
opt.backupdir:remove(".")
opt.colorcolumn = { "+1" }
opt.display = { "uhex" } -- Show unprintable characters as <xx>
opt.equalalways = false -- Splitting or closing a window won't automatically resize all windows
opt.fillchars:append({ diff = "╱", fold = " ", foldopen = "", foldsep = " ", foldclose = "", eob = " " })
opt.foldcolumn = "1"
opt.foldlevel = 99
opt.helpheight = 12 -- Minimum height of the help window
opt.linebreak = true -- Only break lines between punctuation and white space
opt.listchars:append({ precedes = "«", extends = "»" }) -- Text beyond horizontal window boundaries
opt.mousemodel = "extend"
-- opt.relativenumber = false -- Relative line numbers
opt.shell = "bash" -- Shell to use for ! and :! commands
opt.shiftwidth = 0 -- Use 'tabstop' value instead
opt.swapfile = false -- Don't use swapfile
-- opt.showbreak = "↪ " -- Show where line wraps
opt.showcmd = false -- Don't show command in statusline
opt.spelllang = { "en_us", "cjk" }
opt.textwidth = 120 -- Maximum width of text
opt.virtualedit = "block" -- Allow positioning cursor where there is no text in visual block mode
