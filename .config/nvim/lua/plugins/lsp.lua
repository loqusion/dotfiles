local lsp = require('crows.utils').new_feat()

lsp.pre = function()
  local signs = require('utils.icons').diagnostics
  for sign, text in pairs(signs) do
    local hl = 'DiagnosticSign' .. sign
    vim.fn.sign_define(hl, { text = text, texthl = hl, linehl = '', numhl = '' })
  end
  vim.cmd [[
    hi link LightBulbFloatWin YellowFloat
    hi link LightBulbVirtualText YellowFloat
  ]]
end

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
  'folke/lua-dev.nvim',
  after = 'nvim-lspconfig',
}

-- lsp configs initialized here
lsp.use {
  'williamboman/nvim-lsp-installer',
  after = { 'nvim-lspconfig', 'cmp-nvim-lsp', 'lua-dev.nvim', 'null-ls.nvim' },
  config = true,
}

lsp.use {
  'nvim-lua/lsp-status.nvim',
  disable = true,
  config = true,
}

lsp.use {
  'folke/lsp-colors.nvim',
  after = 'nvim-lsp-installer',
  config = true,
}

lsp.use {
  'ray-x/lsp_signature.nvim',
  after = 'nvim-lsp-installer',
  config = true,
}

lsp.use {
  'kosayoda/nvim-lightbulb',
  after = 'nvim-lsp-installer',
  config = true,
}

lsp.use {
  'RRethy/vim-illuminate',
  after = 'nvim-lsp-installer',
  config = true,
}

lsp.use {
  'j-hui/fidget.nvim',
  after = 'nvim-lsp-installer',
  config = true,
}

lsp.use 'b0o/SchemaStore.nvim'

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

return lsp
