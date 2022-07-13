-- https://github.com/AndrewRadev/switch.vim

local M = {}

function M.entrance()
  vim.g.switch_mapping = '_'
  M.register_global_keys()
end

function M.register_global_keys()
  require('crows').key.map('Switch', 'n', '_', '<Plug>(Switch)')
end

return M
