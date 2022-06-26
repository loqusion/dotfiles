local lazy = require 'crows.lazy'

local lua = {}

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
  sumneko_lua = {
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
  },
}

lua.formatters = {
  lua = {
    lazy.fn('formatter.filetypes.lua', 'stylua'),
  },
}

return lua
