-- https://github.com/Pocco81/TrueZen.nvim

local M = {
  safe_requires = {
    { 'true-zen', 'true_zen' },
  },
  mapleader = '<LocalLeader>z',
}

function M.setup()
  M.register_global_keys()
end

function M.config()
  M.true_zen.setup {
    modes = {
      ataraxis = {
        callbacks = {
          open_pos = function()
            vim.opt.showtabline = 0
          end,
        },
      },
    },
    integrations = {
      lualine = true,
    },
  }
end

function M.register_global_keys()
  require('crows').key.maps {
    [M.mapleader] = {
      name = 'TrueZen',
      z = { '<Cmd>silent TZAtaraxis<CR>', 'TrueZen Ataraxis' },
      f = { '<Cmd>silent TZFocus<CR>', 'TrueZen Focus' },
      m = { '<Cmd>silent TZMinimalist<CR>', 'TrueZen Minimalist' },
      n = { ":<C-u>silent '<,'>TZNarrow<CR>", 'TrueZen Narrow', mode = { 'n', 'x' } },
    },
  }
end

return M
