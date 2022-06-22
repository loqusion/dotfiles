-- https://github.com/folke/twilight.nvim

local M = {}

function M.setup()
  M.register_global_keys()
end

function M.config() end

function M.register_global_keys()
  local key = require('crows').key
  for _, mode in ipairs { 'n', 'x' } do
    key.map('Toggle dim text', mode, '<localleader>t', '<cmd>Twilight<cr>')
  end
end

return M
