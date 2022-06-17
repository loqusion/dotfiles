-- https://github.com/mhinz/vim-sayonara

local M = {}

function M.setup()
  require('crows').key.map('Sayonara', 'n', 'q', '<cmd>Sayonara<cr>')
end

return M
