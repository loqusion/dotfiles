-- https://github.com/akinsho/toggleterm.nvim

local M = {
  safe_requires = {
    'toggleterm',
    { 'toggleterm.terminal', 'terminal' },
  },
}

function M.setup() end

function M.config()
  M.toggleterm.setup {
    direction = 'float',
    border = 'shadow',
    shell = vim.fn.getenv 'SHELL',
    open_mapping = [[<c-\>]],
  }

  local Terminal = M.terminal.Terminal
  local lazygit = Terminal:new {
    cmd = 'lazygit',
    hidden = true,
    dir = 'git_dir',
    direction = 'float',
    float_opts = {
      border = 'double',
    },
    on_open = function(term)
      vim.cmd [[startinsert!]]
      M.register_buffer_keys(term.bufnr)
    end,
  }

  function _G._lazygit_toggle()
    lazygit:toggle()
  end

  vim.cmd [[autocmd! TermOpen term://* set nolist]]
  M.register_global_keys()
end

function M.register_global_keys()
  local key = require('crows').key
  key.map('Open lazygit', 'n', '<localleader>g', '<cmd> lua _lazygit_toggle()<cr>', {
    silent = true,
  })
  -- vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])
end

function M.register_buffer_keys(bufnr)
  require('crows').key.map('Close terminal', 'n', 'q', '<cmd>close<cr>', {
    bufnr = bufnr,
    silent = true,
  })
end

return M
