local map = vim.keymap.set

local direction = 'float'
require('toggleterm').setup {
  direction = direction,
  border = 'shadow',
  shell = vim.fn.getenv 'SHELL',
  open_mapping = [[<c-\>]],
}

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new {
  cmd = 'lazygit',
  hidden = true,
  dir = 'git_dir',
  direction = 'float',
  float_opts = {
    border = 'double'
  },
  on_open = function(term)
    vim.cmd [[startinsert!]]
    vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<cr>', {
      noremap = true,
      silent = true,
    })
  end
}

function _G._lazygit_toggle()
  lazygit:toggle()
end

function _G.set_terminal_keymaps()
  if direction ~= 'float' then
    -- map('t', '<C-h>', [[<C-\><C-n><C-W>h]])
    -- map('t', '<C-j>', [[<C-\><C-n><C-W>j]])
    -- map('t', '<C-k>', [[<C-\><C-n><C-W>k]])
    -- map('t', '<C-l>', [[<C-\><C-n><C-W>l]])
  end
end

map('n', '<localleader>g', '<cmd>lua _lazygit_toggle()<cr>', { silent = true })
map('t', '<esc>', [[<C-\><C-n>]])
vim.cmd [[autocmd! TermOpen term://* lua set_terminal_keymaps()]]
vim.cmd [[autocmd! TermOpen term://* set nolist]]
