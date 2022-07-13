-- https://github.com/Pocco81/TrueZen.nvim

local M = {
  safe_requires = {
    {'true-zen', 'true_zen'}
  },
  mapleader = '<LocalLeader>z',
}

function M.setup()
  M.register_global_keys()
end

function M.config()
  M.true_zen.setup {
    integrations = {
      gitsigns = true,
      lualine = true,
      twilight = false,
    },
  }

  M.true_zen.after_mode_ataraxis_on = function()
    vim.wo.list = false
    vim.wo.showbreak = '  '
    vim.opt.statusline = ' '
    vim.wo.colorcolumn = ''
  end
end

function M.register_global_keys()
  require('crows').key.maps {
    [M.mapleader] = {
      name = 'TrueZen',
      z = { '<Cmd>silent TZAtaraxis<CR>', 'TrueZen Ataraxis' },
      f = { '<Cmd>silent TZFocus<CR>', 'TrueZen Focus' },
      m = { '<Cmd>silent TZMinimalist<CR>', 'TrueZen Minimalist' },
    },
  }
end

return M
