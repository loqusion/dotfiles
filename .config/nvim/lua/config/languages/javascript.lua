local util = require 'lspconfig.util'

local javascript = {}

javascript.lsp_configs = {
  tsserver = {
    root_dir = function(fname)
      return util.root_pattern 'tsconfig.json'(fname) or util.root_pattern('package.json', 'jsconfig.json')(fname)
    end,
  },
  tailwindcss = {
    root_dir = util.root_pattern('tailwind.config.js', 'tailwind.config.ts'),
  },
  denols = {
    root_dir = util.root_pattern 'deno_root',
    init_options = {
      enable = true,
      lint = true,
      unstable = true,
    },
  },
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
  },
  yamlls = {},
  -- eslint = {},
}

local prettier = require 'config.formatters.prettier'
javascript.formatters = {
  javascript = { prettier },
  typescript = { prettier },
  javascriptreact = { prettier },
  typescriptreact = { prettier },
  vue = { prettier },
  html = { prettier },
  css = { prettier },
  scss = { prettier },
  sass = { prettier },
  graphql = { prettier },
  json = { prettier },
  yaml = { prettier },
}

return javascript
