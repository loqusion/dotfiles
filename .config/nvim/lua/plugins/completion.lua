local completion = require('crows.utils').new_feat()

completion.use {
  'gelguy/wilder.nvim',
  disable = true,
  config = true,
}

completion.use {
  'hrsh7th/nvim-cmp',
  requires = {
    -- Snippets
    'L3MON4D3/LuaSnip',
    'onsails/lspkind.nvim',
    -- Completion engine sources
    { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' }, -- LuaSnip
    { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' }, -- LSP
    { 'hrsh7th/cmp-nvim-lsp-signature-help', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }, -- Buffer words
    { 'hrsh7th/cmp-path', after = 'nvim-cmp' }, -- Filesystem paths
    { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' }, -- Vim's cmdline
    { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' }, -- Neovim's Lua API
    { 'David-Kunz/cmp-npm', after = 'nvim-cmp' }, -- NPM package names and versions
    { 'lukas-reineke/cmp-under-comparator', after = 'nvim-cmp' }, -- Better sorting for underscores
    { 'hrsh7th/cmp-nvim-lsp-document-symbol', after = 'nvim-cmp' }, -- `textDocument/documentSymbol`
    { -- AI pair programmer
      'zbirenbaum/copilot-cmp',
      disable = true,
      requires = {
        -- 'github/copilot.vim', -- Use this for setup
        {
          'zbirenbaum/copilot.lua',
          disable = true,
          event = 'VimEnter',
          config = true,
        },
      },
      after = { 'copilot.lua', 'nvim-cmp' },
    },
  },
  event = { 'InsertEnter *', 'CmdlineEnter', 'CmdwinEnter', 'CursorHold' },
  config = true,
}

completion.use {
  'hrsh7th/cmp-nvim-lsp',
  config = true,
}

completion.use {
  'David-Kunz/cmp-npm',
  config = true,
}

-- autopairs
completion.use {
  'windwp/nvim-autopairs',
  requires = { 'hrsh7th/nvim-cmp' },
  config = true,
}

return completion
