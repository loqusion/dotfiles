-- https://github.com/L3MON4D3/LuaSnip

local M = {}

function M.setup() end

function M.config()
  if not vim.g.did_load_luasnip_config then
    vim.g.did_load_luasnip_config = true
    require('luasnip.loaders.from_vscode').lazy_load()
    require('luasnip.loaders.from_vscode').load { paths = '.' }
  end
end

return M
