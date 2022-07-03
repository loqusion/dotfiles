-- https://github.com/AndrewRadev/switch.vim

local M = {}

function M.setup()
  vim.g.switch_mapping = '_'
  M.register_global_keys()
end

function M.config() end

function M.register_global_keys()

  require('crows').key.map('Switch', 'n', '_', '<Plug>(Switch)')
end

return M
