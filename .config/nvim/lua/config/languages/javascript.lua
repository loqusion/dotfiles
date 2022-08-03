local lspconfig_util = require 'lspconfig.util'
local api = require 'utils.api'
-- local yaml_config = require('yaml-companion').setup {}
local ok, yaml_companion = pcall(require, 'yaml-companion')
if not ok then
  yaml_companion = nil
end

local javascript = {}

javascript.lsp_configs = {
  tsserver = {
    root_dir = function(fname)
      return lspconfig_util.root_pattern 'tsconfig.json'(fname)
        or lspconfig_util.root_pattern('package.json', 'jsconfig.json')(fname)
    end,
    on_attach = api.lsp.disable_formatting,
  },
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
  html = {},
  cssls = {},
  cssmodules_ls = {},
  jsonls = {
    settings = {
      json = {
        schemas = require('schemastore').json.schemas(),
        validate = { enable = true },
      },
    },
    on_attach = api.lsp.disable_formatting,
  },
  ---@diagnostic disable-next-line: need-check-nil
  yamlls = yaml_companion and yaml_companion.setup {} or {},
  -- eslint = {},
}

return javascript
