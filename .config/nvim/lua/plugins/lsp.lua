local lsp = require('utils.api').feat.new()

local signs = require('utils.icons').diagnostics
for sign, text in pairs(signs) do
  local hl = 'DiagnosticSign' .. sign
  vim.fn.sign_define(hl, { text = text, texthl = hl, linehl = '', numhl = '' })
end
vim.cmd [[
  hi link LightBulbFloatWin YellowFloat
  hi link LightBulbVirtualText YellowFloat
]]

lsp.use {
  'jose-elias-alvarez/null-ls.nvim',
  requires = 'nvim-lua/plenary.nvim',
  after = 'nvim-lspconfig',
  setup = true,
  config = true,
}

lsp.use {
  'ThePrimeagen/refactoring.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
}

lsp.use {
  'folke/neodev.nvim',
  -- after = 'nvim-lspconfig',
  -- module = 'neodev',
}

-- lsp configs initialized here
lsp.use {
  { 'williamboman/mason.nvim', after = 'nvim-notify' },
  { 'williamboman/mason-lspconfig.nvim', after = 'mason.nvim' },
}

lsp.use {
  'neovim/nvim-lspconfig',
  after = 'mason-lspconfig.nvim',
  config = true,
}

lsp.use { -- LSP UI
  -- too many breaking changes 💀
  -- 'glepnir/lspsaga.nvim',
  'loqusion/lspsaga.nvim',
  after = 'mason.nvim',
  config = true,
}

lsp.use {
  'nvim-lua/lsp-status.nvim',
  disable = true,
  config = true,
}

lsp.use {
  'kosayoda/nvim-lightbulb',
  disable = true, -- handled by lspsaga
  after = 'mason.nvim',
  setup = true,
}

lsp.use {
  'folke/lsp-colors.nvim',
  after = 'mason.nvim',
  config = true,
}

lsp.use {
  'ray-x/lsp_signature.nvim',
  disable = false,
  after = 'mason.nvim',
  config = true,
}

lsp.use {
  'RRethy/vim-illuminate',
  after = 'mason.nvim',
  setup = true,
  config = true,
}

lsp.use {
  'j-hui/fidget.nvim',
  disable = true, -- functionality provided by noice
  after = 'mason.nvim',
  config = true,
}

lsp.use {
  'folke/trouble.nvim',
  requires = 'kyazdani42/nvim-web-devicons',
  config = true,
}

-- Command interface for neovim LSP
lsp.use 'ii14/lsp-command'

lsp.use { -- Preview native LSP's goto definition calls in floating windows
  'rmagatti/goto-preview',
  module = 'goto-preview',
  keys = 'gp',
  setup = true,
  config = true,
}

lsp.use { -- Language-specific plugins
  { -- Minimal `typescript-language-server` integration plugin with convenience commands
    'jose-elias-alvarez/typescript.nvim',
    module = 'typescript',
  },
  { -- JSON schemas
    'b0o/SchemaStore.nvim',
  },
  { -- YAML schemas
    'someone-stole-my-name/yaml-companion.nvim',
    module = 'yaml-companion',
  },
}

return lsp
