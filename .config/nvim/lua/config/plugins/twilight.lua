-- https://github.com/folke/twilight.nvim

local M = {}

function M.setup()
  local key = require('crows').key
  for _, mode in ipairs { 'n', 'x' } do
    key.map('Toggle dim text', mode, '<localleader>t', '<cmd>Twilight<cr>')
  end
end

function M.config() end

return M
