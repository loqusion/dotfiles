local lspconfig_util = require 'lspconfig.util'
local api = require 'utils.api'

local javascript = {}

javascript.lsp_configs = {
  tsserver = {
    root_dir = function(fname)
      return lspconfig_util.root_pattern 'tsconfig.json'(fname)
        or lspconfig_util.root_pattern('package.json', 'jsconfig.json')(fname)
    end,
  },
  eslint = {},
  tailwindcss = {
    root_dir = lspconfig_util.root_pattern('tailwind.config.js', 'tailwind.config.ts'),
  },
  -- denols = {
  --   root_dir = lspconfig_util.root_pattern 'deno_root',
  --   init_options = {
  --     enable = true,
  --     lint = true,
  --     unstable = true,
  --   },
  -- },
  graphql = {
    filetypes = { 'graphql' },
  },
  emmet_ls = {
    filetypes = { 'html', 'javascriptreact', 'typescriptreact', 'css', 'sass', 'scss', 'less', 'vue' },
  },
  angularls = {},
  html = {},
  cssls = {},
  cssmodules_ls = {},
  jsonls = {
    settings = {
      json = {
        schemas = require('schemastore').json.schemas {
          replace = {
            ['package.json'] = {
              fileMatch = { 'package.json' },
              url = 'https://json.schemastore.org/package.json',
            },
          },
        },
        validate = { enable = true },
      },
    },
  },
  yamlls = {},
}

local typescript_ok, typescript = pcall(require, 'typescript')
if typescript_ok then
  local saved_on_attach = javascript.lsp_configs.tsserver.on_attach
  javascript.lsp_configs.tsserver = vim.tbl_extend('force', javascript.lsp_configs.tsserver, {
    on_attach = function(...)
      if saved_on_attach then
        saved_on_attach(...)
      end
      api.lsp.disable_formatting(...)
    end,
  })
  -- calls `lspconfig.tsserver.setup()`
  typescript.setup {
    disable_commands = false,
    debug = false,
    server = javascript.lsp_configs.tsserver,
  }
  javascript.lsp_configs.tsserver = nil
end

local yaml_companion_ok, yaml_companion = pcall(require, 'yaml-companion')
if yaml_companion_ok then
  javascript.lsp_configs.yamlls = yaml_companion.setup(javascript.lsp_configs.yamlls)
end

return javascript
