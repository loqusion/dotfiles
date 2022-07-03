-- https://github.com/sumneko/lua-language-server
-- https://github.com/folke/lua-dev.nvim

-- https://github.com/sumneko/vscode-lua/blob/master/setting/schema.json
-- https://github.com/xiyaowong/coc-sumneko-lua/blob/main/settings.md

local lazy = require 'crows.lazy'
local lua_dev = require 'lua-dev'

local lua = {}

lua.attach_callback = function(client, _)
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false
end

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

local function workspace_files()
  local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ':~')
  if cwd == '~/.config/nvim' then
    -- Make the server aware of Neovim runtime files, only in config cwd
    return vim.api.nvim_get_runtime_file('', true)
  end
  return nil
end

lua.lsp_configs = {
  sumneko_lua = vim.tbl_deep_extend('force', lua_dev.setup(), {
    cmd = { 'lua-language-server' },
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
          path = runtime_path,
        },
        completion = {
          autoRequire = false,
        },
        diagnostics = {
          globals = { 'vim' },
        },
        workspace = {
          library = workspace_files(),
          maxPreload = 5000,
        },
        telemetry = {
          enable = false,
        },
      },
    },
    on_attach = function(client, _)
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false
    end
  }),
}

return lua
