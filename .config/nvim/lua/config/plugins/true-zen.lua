-- https://github.com/Pocco81/true-zen.nvim

local M = {
  safe_requires = {
    { 'true-zen', 'true_zen' },
  },
  map_leader = 'gz',
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
  require('crows').key.maps {
    [M.map_leader] = {
      z = { '<Cmd>silent TZAtaraxis<CR>', 'TrueZen Ataraxis' },
      f = { '<Cmd>silent TZFocus<CR>', 'TrueZen Focus' },
      m = { '<Cmd>silent TZMinimalist<CR>', 'TrueZen Minimalist' },
      n = { "<Cmd>'<,'>TZNarrow<CR>", 'TrueZen Narrow', mode = { 'n', 'x' } },
    },
  }
end

return M
