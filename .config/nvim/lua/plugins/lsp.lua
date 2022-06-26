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
  disable = true,
  requires = 'nvim-lua/plenary.nvim',
  config = true,
}

lsp.use {
  'folke/trouble.nvim',
  requires = 'kyazdani42/nvim-web-devicons',
  config = true,
}

lsp.use {
  'nvim-lua/lsp-status.nvim',
  disable = true,
  config = true,
}

lsp.use {
  'folke/lsp-colors.nvim',
  config = true,
}

lsp.use {
  'ray-x/lsp_signature.nvim',
  config = true,
}

lsp.use {
  'kosayoda/nvim-lightbulb',
  config = true,
}

lsp.use {
  'RRethy/vim-illuminate',
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
  'j-hui/fidget.nvim',
  event = 'BufReadPre',
  config = true,
}

lsp.use 'b0o/SchemaStore.nvim'

-- lsp configs initialized here
lsp.use {
  'williamboman/nvim-lsp-installer',
  config = true,
}

return lsp
