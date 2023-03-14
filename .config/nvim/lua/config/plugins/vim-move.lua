-- https://github.com/matze/vim-move

local M = {
  modifier = 'C',
}

function M.entrance()
  vim.g.move_map_keys = 0
  M.register_global_keys()
end

function M.register_global_keys()
  require('utils.api').key.maps({
    ['<C-j>'] = { '<Plug>MoveBlockDown', 'Move line(s) down' },
    ['<C-k>'] = { '<Plug>MoveBlockUp', 'Move line(s) up' },
  }, { mode = 'x' })
end

return M
