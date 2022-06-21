-- https://github.com/simrat39/symbols-outline.nvim

local M = {}

function M.setup()
  require('crows').key.map('Toggle symbols outline', 'n', '<localleader>o', '<cmd>SymbolsOutline<cr>')
end

function M.config() end

return M
