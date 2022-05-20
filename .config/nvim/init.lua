vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0
require 'impatient'
local g = vim.g
local cmd = vim.cmd
local fn = vim.fn
local o, opt, opt_local = vim.o, vim.opt, vim.opt_local
local utils = require 'config.utils'
local autocmd = utils.autocmd
local map = vim.keymap.set

g.mapleader = [[,]]
g.maplocalleader = [[m]]

local disabled_builtins = {
  '2html_plugin',
  'getscriptPlugin',
  'gtags',
  'gtags_cscope',
  'gzip',
  'logiPat',
  'matchit',
  -- 'matchparen',
  'netrwFileHandlers',
  'netrwPlugin',
  'netrwSettings',
  -- 'node_provider',
  -- 'perl_provider',
  'python_provider',
  'rrhelper',
  -- 'ruby_provider',
  'shada_plugin',
  'spellfile_plugin',
  'tar',
  'tarPlugin',
  'tutor_mode_plugin',
  'vimballPlugin',
  'zip',
  'zipPlugin',
}

for _, builtin in ipairs(disabled_builtins) do
  g['loaded_' .. builtin] = 1
end

g.did_install_default_menus = 1
g.terminal_scrollback_buffer_size = 3000

----------------------------------------------------------------------------
-- Settings
opt.textwidth = 100
opt_local.textwidth = o.textwidth
opt.scrolloff = 2
opt.wildmenu = true
opt.wildoptions:append { 'pum', 'tagfile' }
if fn.has('patch-8.2.4463') ~= 0 then
  opt.wildoptions:append { 'fuzzy' }
end
opt.wildignore:append { '*.o', '*~', '*.pyc', 'node_modules' }
opt.wildmode = { 'longest', 'full' }
opt.wildignorecase = true
-- set completeopt=menuone,noselect
-- if exists('+completepopup')
--   set completeopt+=popup
--   set completepopup=height:4,width:60,highlight:InfoPopup
-- endif
-- opt.complete = { '.' }
opt.completeslash = 'slash'
opt.pumheight = 10
opt.pumwidth = 0
opt.pumblend = 20
opt.winblend = 20
--opt.whichwrap:append { '<', '>', 'h', 'l' }
o.whichwrap = o.whichwrap .. '<,>,h,l'
opt.backspace = { 'indent', 'eol', 'nostop' }
opt.inccommand = 'nosplit'
opt.incsearch = true
opt.hlsearch = false
opt.lazyredraw = true
opt.redrawtime = 0
opt.ignorecase = true
opt.smartcase = true
opt.tabstop = 2
opt_local.tabstop = o.tabstop
opt.softtabstop = 0
opt_local.softtabstop = o.softtabstop
opt.expandtab = true
opt_local.expandtab = o.expandtab
--opt.smarttab = true
opt.shiftwidth = 2
opt_local.shiftwidth = o.shiftwidth
opt.number = true
opt_local.number = o.number
opt.relativenumber = true
opt_local.relativenumber = o.relativenumber
opt.smartindent = true
opt_local.smartindent = o.smartindent
opt.autoindent = true
opt.laststatus = 3
opt.cmdheight = 1
opt.showcmd = false
opt.showmode = false
opt.signcolumn = 'yes:1'
opt_local.signcolumn = o.signcolumn
opt.foldenable = false
opt.foldmethod = 'manual'
opt.foldcolumn = 'auto:1'
opt.history = 200
o.shada = [['20,<50,s10,h,/100]]
opt.hidden = true
opt.shortmess = 'aTIcF'
opt.guicursor = {
  'n-v-c:block-Cursor/lCursor-blinkon0',
  'i-ci-ve:ver25-Cursor/lCursor',
  'r-cr:hor20-Cursor/lCursor',
  'o:hor50',
}
opt.timeout = true
opt.ttimeout = true
opt.timeoutlen = 3000
opt.ttimeoutlen = 100
opt.updatetime = 100
opt.conceallevel = 2
opt_local.conceallevel = o.conceallevel
opt.concealcursor = 'nc'
opt_local.concealcursor = o.concealcursor
opt.colorcolumn = '+1'
opt.splitbelow = true
opt.splitright = true
opt.cmdwinheight = 5
opt.previewheight = 5
opt.helpheight = 12
opt.equalalways = false
opt.undofile = true
opt_local.undofile = o.undofile
opt.synmaxcol = 500
opt_local.synmaxcol = o.synmaxcol
opt.display = { 'msgsep', 'uhex' }
opt.cursorline = false
opt.modeline = false
opt_local.modeline = o.modeline
opt.mouse = 'nvihr'
opt.grepprg = [[grep\ -inH]]
opt.isfname:remove { '=' }
opt.isfname:append { '@-@' }
opt.backup = false
opt.swapfile = false
opt.visualbell = false
opt.belloff = { 'all' }
opt.showfulltag = true
if fn.exists('+previewpopup') ~= 0 then
  opt.previewpopup = { 'height:10', 'width:60' }
end
opt.cedit = '<C-q>'
opt.shell = 'sh'
opt.guifont = 'CaskaydiaCove_Nerd_Font:h14'
opt.guifontwide = o.guifont
opt.title = true
opt.titlelen = 95
opt.titlestring = [[%{expand('%:p:~:.')} %<(%{fnamemodify(getcwd(), ':~')})%(%m%r%w%)]]

----------------------------------------------------------------------------
-- Colorscheme
opt.termguicolors = true
opt.background = 'dark'
g.space_vim_transp_bg = 1
cmd [[colorscheme space_vim_theme_improved]]

----------------------------------------------------------------------------
-- Autocommands
-- cmd [[
-- augroup MyAutoCmd
--   autocmd!
-- augroup END
--
-- " For only Vim help files.
-- autocmd MyAutoCmd BufRead,BufWritePost *.txt setlocal modelines=2 modeline
--
-- " Disable paste.
-- autocmd MyAutoCmd InsertLeave *
--       \ if &paste | setlocal nopaste | echo 'nopaste' | endif |
--       \ if &l:diff | diffupdate | endif
--
-- " Update diff.
-- " (duplicate?)
-- autocmd MyAutoCmd InsertLeave * if &l:diff | diffupdate | endif
--
-- " Make directory automatically.
-- " --------------------------------------
-- " http://vim-users.jp/2011/02/hack202/
-- autocmd MyAutoCmd BufWritePre *
--       \ call MkdirAsNecessary(expand('<afile>:p:h'), v:cmdbang)
-- function! MkdirAsNecessary(dir, force) abort
--   if !isdirectory(a:dir) && &l:buftype ==# '' &&
--         \ (a:force || input(printf('"%s" does not exist. Create? [y/N]',
--         \              a:dir)) =~? '^y\%[es]$')
--     call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
--   endif
-- endfunction
--
-- cmd [[
-- autocmd MyAutoCmd BufWritePre *
--       \ call vimrc#trim_trailing_whitespace() |
--       \ call vimrc#trim_final_newlines()
-- ]]
--
-- let $CONFIG = stdpath('config')
-- augroup packer_user_config
--   autocmd!
--   autocmd BufWritePost $CONFIG/lua/plugins.lua
--         \ source <a-file> | PackerCompile
-- augroup end
-- ]]

-- Commands
--cmd [[command! WhatHighlight :call util#syntax_stack()]]
cmd [[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]]
cmd [[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]]
cmd [[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]]
cmd [[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]]
cmd [[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]]

----------------------------------------------------------------------------
-- Keybindings

-- Release keymappings for plugins.
map('n', 'm', '<Nop>')
map('n', ',', '<Nop>')

map('n', '<Space>', '[Space]', { remap = true })
map('n', '[Space]', '<Nop>')

map('n', '>', '>>')
map('n', '<', '<<')
map('x', '>', '>gv')
map('x', '<', '<gv')

-- if (!has('nvim') || $DISPLAY !=# '') && has('clipboard')
--   xnoremap <silent> y "*y:let [@+,@"]=[@*,@*]<CR>
-- endif

-- Insert mode keymappings:
-- <C-t>: insert tab.
map('i', '<C-t>', '<C-v><Tab>')
-- Enable undo <C-w> and <C-u>.
map('i', '<C-w>', '<C-g>u<C-w>')
map('i', '<C-u>', '<C-g>u<C-u>')
--map('i', '<C-k>', '<C-o>D')

-- Command mode keymappings:
-- <C-b>: previous char.
map('c', '<C-b>', 'Left')
-- <C-f>: next char.
map('c', '<C-f>', '<Right>')
-- <C-a> move to head.
map('c', '<C-a>', '<Home>')
-- <C-e> move to end.
map('c', '<C-e>', '<End>')
-- <C-p>: previous history.
map('c', '<C-p>', '<Up>')
-- <C-n>: next history.
map('c', '<C-n>', '<Down>')
-- <C-y>: paste.
map('c', '<C-y>', '<C-r>*')
-- <C-g>: Exit.
map('c', '<C-g>', '<C-c>')
-- <C-d>: delete char.
map('c', '<C-d>', '<Del>')
-- <C-k>: Delete to the end.
map('c', '<C-k>',
  [[repeat("\<Del>", strchars(getcmdline()[getcmdpos() - 1:]))]],
  { expr = true }
)

map('n', '[Space]l', [[<cmd>call vimrc#toggle_option('laststatus')]])

-- Quickfix
map('n', '[Space]e', vim.diagnostic.open_float)
map('n', '[d', vim.diagnostic.goto_prev)
map('n', ']d', vim.diagnostic.goto_next)
map('n', '[Space]q', vim.diagnostic.setloclist)

-- Useful save mappings.
map('n', '<leader><leader>', '<cmd>silent update<cr>', { silent = true })

-- s: Windows and buffers (High priority)
map('n', 'sp', '<cmd>vsplit<cr>', { silent = true })
map('n', 'so', '<cmd>only<cr>', { silent = true })
map('n', 'q', [[winnr('$') != 1 ? '<cmd>close<cr>' : '']], {
  silent = true,
  expr = true,
})

-- Window movement
map('n', '<c-h>', '<c-w>h')
map('n', '<c-j>', '<c-w>j')
map('n', '<c-k>', '<c-w>k')
map('n', '<c-l>', '<c-w>l')

-- Tab movement
map('n', '<C-Left>', '<cmd>tabpre<cr>')
map('n', '<C-Right>', '<cmd>tabnext<cr>')

-- Better x
map('n', 'x', '"_x')
map('n', 'X', '"_X')

-- Disable ex-mode.
map('n', 'Q', 'q')

-- Useless commands.
map({'n', 'i', 'c', 'v', 'o', 't', 'l'}, '<MiddleMouse>', '<Nop>')
map('n', 'M', 'm')
map('n', 'gs', '<nop>')
map('n', 's', '<nop>')
map('n', 'S', '<nop>')

-- Smart <C-f>, <C-b>.
map('n', '<C-f>',
  [[max([winheight(0) - 2, 1]) .. '<C-d>' .. (line('w$') >= line('$') ? 'L' : 'M')]],
  { expr = true }
)
map('n', '<C-b>',
  [[max([winheight(0) - 2, 1]) .. '<C-u>' .. (line('w0') <= 1 ? 'H' : 'M')]],
  { expr = true }
)

-- Disable ZZ.
map('n', 'ZZ', '<nop>')

-- Redraw.
map('n', '<C-l>', '<cmd>redraw!<cr>', { silent = true })

-- If press l on fold, fold open.
map('n', 'l', [[foldclosed(line('.')) != -1 ? 'zo0' : 'l']], { expr = true })
-- If press l on fold, range fold open.
map('x', 'l', [[foldclosed(line('.')) != -1 ? 'zogv0' : 'l']], { expr = true })

-- Substitute.
map('x', 's', '<cmd>s//g<left><left>')

-- Easy escape.
map('i', 'jj', '<Esc>')
map('t', 'jj', [[<C-\><C-n>]])
map('c', 'j', [[getcmdline()[getcmdpos()-2] ==# 'j' ? '<BS><C-c>' : 'j']],
  { expr = true }
)
map('i', 'j<Space>', 'j')
map('t', 'j<Space>', 'j')

-- Improved increment.
-- cmd [[
--   nmap <C-a> <SID>(increment)
--   nmap <C-x> <SID>(decrement)
--   nnoremap <silent> <SID>(increment)    <Cmd>AddNumbers 1<CR>
--   nnoremap <silent> <SID>(decrement)    <Cmd>AddNumbers -1<CR>
--   command! -range -nargs=1 AddNumbers
--         \ call vimrc#add_numbers((<line2>-<line1>+1) * eval(<args>))
-- ]]

-- Switch between alternate buffer.
map('n', '#', '<C-^>', { silent = true })

-- {visual}p to put without yank to unnamed register
map('x', 'p', 'P')

-- Insert special character
map('i', '<C-v>u', '<C-r>=nr2char(0x)<Left>')

-- Tag jump
map('n', 'tt', 'g<C-]>')
map('n', 'tp', '<cmd>pop<cr>')

-- Begin a new line without leaving insert mode.
map('i', '<C-CR>','<C-o>o')
map('i', '<S-CR>', '<C-o>O')

-- Suppress "Type :qa and press <Enter> to exit Nvim"
map('n', '<C-c>', '<silent> <C-c>')
