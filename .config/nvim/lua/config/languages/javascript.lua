local lazy = require 'crows.lazy'
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
  emmet_ls = {},
  html = {},
  cssls = {},
  cssmodules_ls = {},
  -- eslint = {},
}

local prettier = lazy.fn 'formatter.defaults.prettier'
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
}

return javascript
