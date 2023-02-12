-- https://github.com/sumneko/lua-language-server
-- https://github.com/folke/neodev.nvim

-- https://github.com/sumneko/vscode-lua/blob/master/setting/schema.json

require('neodev').setup()

local lua = {}

lua.lsp_configs = {
  -- sumneko_lua = {
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
      },
    },
  },
}

return lua
