-- https://github.com/matze/vim-move

local M = {
  modifier = 'C',
}

function M.entrance()
  vim.g.move_key_modifier = M.modifier
  vim.g.move_key_modifier_visualmode = M.modifier
end

return M
