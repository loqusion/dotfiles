-- https://github.com/AndrewRadev/switch.vim

local M = {}

function M.setup()
  vim.g.switch_mapping = '_'
  require('crows').key.map('Switch', 'n', '_', '<Plug>(Switch)')
end

function M.config() end

return M
