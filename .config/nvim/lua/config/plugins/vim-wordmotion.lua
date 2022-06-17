-- https://github.com/chaoren/vim-wordmotion

local M = {}

function M.config()
  vim.g.wordmotion_mappings = {
    aw = 'av',
    iw = 'iv',
  }
end

return M
