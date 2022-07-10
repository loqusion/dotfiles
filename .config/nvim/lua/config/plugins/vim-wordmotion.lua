-- https://github.com/chaoren/vim-wordmotion

local M = {}

function M.entrance()
  vim.g.wordmotion_mappings = {
    aw = 'av',
    iw = 'iv',
    ['<C-R><C-W>'] = '',
  }
end

return M
