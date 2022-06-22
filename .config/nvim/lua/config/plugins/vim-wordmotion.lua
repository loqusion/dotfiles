-- https://github.com/chaoren/vim-wordmotion

local M = {}

function M.entrance()
  vim.g.wordmotion_mappings = {
    aw = 'av',
    iw = 'iv',
  }
end

return M
