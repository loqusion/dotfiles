----------------------------------------------------------------------------
-- Commands
vim.cmd [[
  command! -bang -bar -addr=other -complete=customlist,man#complete -nargs=* VMan
  \ exe 'vertical <mods> <count>Man <args>'
]]

----------------------------------------------------------------------------
-- Keybindings
local map = vim.keymap.set

-- Release keymappings for plugins.
map('n', 'm', '<Nop>')
map('n', ',', '<Nop>')

map({ 'n', 'x' }, '<Space>', '<Nop>', { remap = true })

-- Easy indent
map('n', '>', '>>')
map('n', '<', '<<')
map('x', '>', '>gv')
map('x', '<', '<gv')

-- Use * for hl, not navigation
map({ 'n', 'x' }, '*', '*N')
map({ 'n', 'x' }, 'g*', 'g*N')
-- map({ 'n', 'x' }, '#', '#N')
map({ 'n', 'x' }, 'g#', 'g#N')

-- Insert mode keymappings:
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
map('n', '<leader>X', '<cmd>x!<cr>', { silent = true })
map('n', '<leader>D', '<cmd>Sayonara<cr>', { silent = true })

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
-- map('n', 'gs', '<nop>')

-- Smart <C-f>, <C-b>.
map('n', '<C-f>', [[max([winheight(0) - 2, 1]) .. '<C-e>' .. (line('w$') >= line('$') ? 'L' : 'M')]], { expr = true })
map('n', '<C-b>', [[max([winheight(0) - 2, 1]) .. '<C-y>' .. (line('w0') <= 1 ? 'H' : 'M')]], { expr = true })

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

-- Begin a new line without leaving insert mode.
map('i', '<C-CR>', '<C-o>o')
map('i', '<S-CR>', '<C-o>O')

-- Suppress "Type :qa and press <Enter> to exit Nvim"
map('n', '<C-c>', '<silent> <C-c>')

-- Select previously inserted/yanked text
map({ 'n', 'x' }, 'gV', 'v`[o`]')
