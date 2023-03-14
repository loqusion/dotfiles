-- https://github.com/Pocco81/true-zen.nvim

local M = {
  safe_requires = {
    { 'true-zen', 'true_zen' },
  },
  map_leader = '<LocalLeader>z',
}

function M.setup()
  M.register_global_keys()
end

function M.config()
  M.true_zen.setup {
    modes = {
      ataraxis = {
        callbacks = {
          open_post = function()
            vim.opt.showtabline = 0
          end,
        },
      },
    },
  }
end

function M.register_global_keys()
  require('utils.api').key.maps {
    [M.map_leader] = {
      z = { '<Cmd>silent TZAtaraxis<CR>', 'TrueZen Ataraxis' },
      f = { '<Cmd>silent TZFocus<CR>', 'TrueZen Focus' },
      m = { '<Cmd>silent TZMinimalist<CR>', 'TrueZen Minimalist' },
      n = { "<Cmd>'<,'>TZNarrow<CR>", 'TrueZen Narrow', mode = { 'n', 'x' } },
    },
    gZ = { '<Cmd>silent TZAtaraxis<CR>', 'TrueZen Ataraxis' },
  }
end

return M
