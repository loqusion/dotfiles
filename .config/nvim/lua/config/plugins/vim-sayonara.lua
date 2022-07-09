-- https://github.com/mhinz/vim-sayonara

local M = {}

function M.entrance()
  M.register_global_keys()
end

function M.register_global_keys()
  require('crows').key.map('Sayonara', 'n', '<leader>d', '<cmd>Sayonara<cr>')
end

return M
