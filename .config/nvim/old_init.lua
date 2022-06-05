vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0
require 'impatient'
local g = vim.g
local fn = vim.fn
local o, opt, opt_local = vim.o, vim.opt, vim.opt_local
local map = vim.keymap.set

g.mapleader = [[,]]
g.maplocalleader = [[ ]]
g.makeleader = [[m]]

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
o.textwidth = 100
--opt_local.textwidth = o.textwidth
o.scrolloff = 0
o.wildmenu = true
opt.wildoptions:append { 'pum', 'tagfile' }
if fn.has 'patch-8.2.4463' ~= 0 then
  opt.wildoptions:append { 'fuzzy' }
end
opt.wildignore:append { '*.o', '*~', '*.pyc', 'node_modules', '.git' }
o.wildmode = 'longest,full'
o.wildignorecase = true
o.completeopt = 'menuone,noselect'
-- o.complete = '.'
o.completeslash = 'slash'
o.pumheight = 10
o.pumwidth = 0
o.pumblend = 20
o.winblend = 20
o.whichwrap = o.whichwrap .. '<,>,h,l'
o.backspace = 'indent,eol,nostop'
o.inccommand = 'nosplit'
o.incsearch = true
o.lazyredraw = true
o.redrawtime = 0
o.ignorecase = true
o.smartcase = true
o.tabstop = 4
opt_local.tabstop = o.tabstop
o.softtabstop = 0
opt_local.softtabstop = o.softtabstop
o.expandtab = true
opt_local.expandtab = o.expandtab
o.shiftwidth = 2
opt_local.shiftwidth = o.shiftwidth
o.shiftround = true
o.number = true
opt_local.number = o.number
o.relativenumber = true
opt_local.relativenumber = o.relativenumber
o.smartindent = true
opt_local.smartindent = o.smartindent
o.autoindent = true
o.cmdheight = 1
o.showcmd = false
o.showmode = false
o.signcolumn = 'yes:1'
opt_local.signcolumn = o.signcolumn
o.foldenable = false
o.foldmethod = 'manual'
o.foldcolumn = 'auto:1'
o.history = 200
o.shada = [['20,<50,s10,h,/100]]
o.hidden = true
o.shortmess = 'aTIcF'
opt.guicursor = {
  'n-v-c:block-Cursor/lCursor-blinkon0',
  'i-ci-ve:ver25-Cursor/lCursor',
  'r-cr:hor20-Cursor/lCursor',
  'o:hor50',
}
o.timeout = true
o.ttimeout = true
o.timeoutlen = 3000
o.ttimeoutlen = 100
o.updatetime = 100
o.conceallevel = 2
opt_local.conceallevel = o.conceallevel
o.concealcursor = 'nc'
opt_local.concealcursor = o.concealcursor
o.colorcolumn = '+1'
o.splitbelow = true
o.splitright = true
o.cmdwinheight = 5
o.previewheight = 5
o.helpheight = 12
o.equalalways = false
o.undofile = true
opt_local.undofile = o.undofile
opt.directory:remove { '.' }
o.synmaxcol = 500
opt_local.synmaxcol = o.synmaxcol
opt.display = { 'msgsep', 'uhex' }
o.cursorline = false
o.modeline = false
opt_local.modeline = o.modeline
o.mouse = 'nvihr'
o.grepprg = [[grep -inH]]
opt.isfname:remove { '=' }
opt.isfname:append { '@-@' }
o.backup = false
o.swapfile = false
o.visualbell = false
opt.belloff = { 'all' }
o.showfulltag = true
if fn.exists '+previewpopup' ~= 0 then
  opt.previewpopup = { 'height:10', 'width:60' }
end
o.cedit = '<C-q>'
o.shell = 'sh'
o.guifont = 'CaskaydiaCove Nerd Font:h14.5'
if fn.has 'gui_running' ~= 0 then
  o.guioptions = 'Mc'
end
o.title = true
o.titlelen = 95
o.titlestring = [[%{expand('%:p:~:.')} %<(%{fnamemodify(getcwd(), ':~')})%(%m%r%w%)]]
o.laststatus = 3
o.statusline = [[ %=%{printf('%'.(len(line('$'))+2).'d/%d',line('.'),line('$'))}]]
o.showtabline = 1
o.tabline = [[]]
o.virtualedit = 'block'
o.keywordprg = ':help'
opt.diffopt = { 'internal', 'algorithm:patience', 'indent-heuristic' }
opt.helplang = { 'en', 'ja' }
o.fileformat = 'unix'
opt.fileformats = { 'unix', 'dos', 'mac' }
o.list = true
if fn.has 'win32' > 0 then
  o.listchars = 'tab:>-,trail:-,precedes:<'
else
  opt.listchars = {
    space = '⋅',
    tab = '→ ',
    -- eol = '↴',
    precedes = '«',
    extends = '»',
    nbsp = '%',
  }
end
o.linebreak = true
o.showbreak = [[\]]
opt.breakat = {
  [' '] = true,
  ['\t'] = true,
  [';'] = true,
  [':'] = true,
  [','] = true,
  ['!'] = true,
  ['?'] = true,
}
o.commentstring = '# %s'
opt.formatoptions:remove { 't' }
opt.formatoptions:append {
  -- Auto-wrap comments
  c = true,
  -- Continue comments after <CR>
  r = true,
  -- Allow formatting comments with `gq`
  q = true,
  -- Long lines are not broken in insert mode
  l = true,
  -- Remove comment leader when joining lines
  j = true,
}

----------------------------------------------------------------------------
-- Colorscheme
opt.termguicolors = true
opt.background = 'dark'
g.space_vim_transp_bg = 1
vim.cmd [[colorscheme space_vim_theme_improved]]

----------------------------------------------------------------------------
-- Autocommands
vim.cmd [[
  augroup MyAutoCmd
    autocmd!

    " For only Vim help files.
    autocmd BufRead,BufWritePost *.txt
          \ setlocal modelines=2 modeline colorcolumn= foldcolumn=0 signcolumn=no

    " Disable unnecessary features in man pages.
    autocmd FileType man setlocal signcolumn=no

    " Disable paste.
    autocmd InsertLeave *
          \ if &paste | setlocal nopaste | setlocal paste? | endif |
          \ if &l:diff | diffupdate | endif

    " hl-QuickFixLine doesn't play nicely with listchars.
    autocmd FileType qf setlocal nolist

    " Make directory automatically.
    " --------------------------------------
    " http://vim-users.jp/2011/02/hack202/
    autocmd MyAutoCmd BufWritePre *
          \ call MkdirAsNecessary(expand('<afile>:p:h'), v:cmdbang)
    function! MkdirAsNecessary(dir, force) abort
      if !isdirectory(a:dir) && &l:buftype ==# '' &&
            \ (a:force || input(printf('"%s" does not exist. Create? [y/N]',
            \              a:dir)) =~? '^y\%[es]$')
        call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
      endif
    endfunction

    " Trim unnecessary whitespace.
    autocmd MyAutoCmd BufWritePre *
          \ call vimrc#trim_trailing_whitespace() |
          \ call vimrc#trim_final_newlines()
  augroup END

  " Reload plugins file on save.
  let $CONFIG = stdpath('config')
  let $PLUGINS_SPEC = $CONFIG .. '/lua/plugins.lua'
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost $PLUGINS_SPEC,$CONFIG/lua/config/*
          \ exec 'source ' .. $PLUGINS_SPEC |
          \ packadd packer.nvim | lua require('plugins').compile()
  augroup end
]]

----------------------------------------------------------------------------
-- Commands
vim.cmd [[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]]
vim.cmd [[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]]
vim.cmd [[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]]
vim.cmd [[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]]
vim.cmd [[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]]
vim.cmd [[command! Todo Grepper -noprompt -tool git -query -E '(TODO|FIXME|BUG|XXX):']]
vim.cmd [[
  command! -bang -bar -addr=other -complete=customlist,man#complete -nargs=* VMan
        \ exe 'vertical <mods> <count>Man <args>'
]]

----------------------------------------------------------------------------
-- Keybindings

-- Release keymappings for plugins.
map('n', 'm', '<Nop>')
map('n', ',', '<Nop>')

map({ 'n', 'x' }, '<Space>', '<Nop>', { remap = true })

map({ 'n', 'x' }, 's', '<nop>')
map({ 'n', 'x' }, 'S', '<nop>')

-- Easy indent
map('n', '>', '>>')
map('n', '<', '<<')
map('x', '>', '>gv')
map('x', '<', '<gv')

-- Insert mode keymappings:
-- <C-t>: insert tab.
map('i', '<C-t>', '<C-v><Tab>')
-- Enable undo <C-w> and <C-u>.
map('i', '<C-w>', '<C-g>u<C-w>')
map('i', '<C-u>', '<C-g>u<C-u>')
--map('i', '<C-k>', '<C-o>D')

-- Command mode keymappings:
-- <C-b>: previous char.
map('c', '<C-b>', '<Left>')
-- <C-f>: next char.
map('c', '<C-f>', '<Right>')
-- <M-b>: previous word.
map('c', '<M-b>', '<S-Left>')
-- <M-f>: next word.
map('c', '<M-f>', '<S-Right>')
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
map('c', '<C-k>', [[repeat("\<Del>", strchars(getcmdline()[getcmdpos() - 1:]))]], { expr = true })

map('n', '<Space>l', [[<cmd>call vimrc#toggle_option('laststatus')<cr>]])

-- Quickfix
map('n', '<Space>e', vim.diagnostic.open_float)
map('n', '[d', vim.diagnostic.goto_prev)
map('n', ']d', vim.diagnostic.goto_next)
map('n', '<Space>q', vim.diagnostic.setloclist)

-- Useful save/quit mappings.
map('n', '<leader><leader>', '<cmd>silent update<cr>', { silent = true })
map('n', '<leader>q', '<cmd>qa<cr>', { silent = true })
-- map('n', '<leader>x', '<cmd>x!<cr>', { silent = true })
map('n', '<leader>d', '<cmd>Sayonara<cr>', { silent = true })

-- Window movement
map('n', '<c-h>', '<c-w>h')
map('n', '<c-j>', '<c-w>j')
map('n', '<c-k>', '<c-w>k')
map('n', '<c-l>', '<c-w>l')

-- Better x
map('n', 'x', '"_x')
map('n', 'X', '"_X')

-- Disable ex-mode.
map({ 'n', 'x' }, 'q', '<Nop>')
map('n', 'Q', 'q')

-- Useless commands.
map({ 'n', 'i', 'c', 'v', 'o', 't', 'l' }, '<MiddleMouse>', '<Nop>')
map('n', 'M', 'm')
map('n', 'gs', '<nop>')

-- Smart <C-f>, <C-b>.
map(
  'n',
  '<C-f>',
  [[max([winheight(0) - 2, 1]) .. '<C-e>' .. (line('w$') >= line('$') ? 'L' : 'M')]],
  { expr = true }
)
map(
  'n',
  '<C-b>',
  [[max([winheight(0) - 2, 1]) .. '<C-y>' .. (line('w0') <= 1 ? 'H' : 'M')]],
  { expr = true }
)

-- Disable ZZ.
map('n', 'ZZ', '<nop>')

-- Redraw.
map('n', '<C-S-l>', '<cmd>redraw!<cr>', { silent = true })

-- If press l on fold, fold open.
map('n', 'l', [[foldclosed(line('.')) != -1 ? 'zo0' : 'l']], { expr = true })
-- If press l on fold, range fold open.
map('x', 'l', [[foldclosed(line('.')) != -1 ? 'zogv0' : 'l']], { expr = true })

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
map('i', '<C-CR>', '<C-o>o')
map('i', '<S-CR>', '<C-o>O')

-- Suppress "Type :qa and press <Enter> to exit Nvim"
map('n', '<C-c>', '<silent> <C-c>')

if vim.fn.exists 'g:neovide' ~= 0 then
  vim.cmd [[cd $HOME]]
end
