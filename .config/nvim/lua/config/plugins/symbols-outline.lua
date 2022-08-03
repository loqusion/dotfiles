-- https://github.com/simrat39/symbols-outline.nvim

local M = {}

function M.setup()
  M.register_global_keys()
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'Outline',
    command = 'setlocal nolist',
  })
end

function M.config() end

function M.register_global_keys()
  require('crows').key.map('Toggle symbols outline', 'n', '<localleader>so', '<cmd>SymbolsOutline<cr>')
end

return M
