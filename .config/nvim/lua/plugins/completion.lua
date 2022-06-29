local completion = require('crows.utils').new_feat()

completion.use { -- A more adventurous wildmenu
  'gelguy/wilder.nvim',
  disable = true,
  config = true,
}

completion.use { -- Snippet Engine
  'L3MON4D3/LuaSnip',
  requires = 'rafamadriz/friendly-snippets',
  event = { 'InsertEnter *', 'CmdlineEnter', 'CmdwinEnter', 'CursorHold' },
  config = true,
}
completion.use { -- Pictograms for LSP/cmp
  'onsails/lspkind.nvim',
  after = 'LuaSnip',
}
completion.use { -- Better sorting for underscores
  'lukas-reineke/cmp-under-comparator',
  after = 'LuaSnip',
}
completion.use { -- Completion Engine
  'hrsh7th/nvim-cmp',
  after = { 'LuaSnip', 'lspkind.nvim', 'cmp-under-comparator' },
  config = true,
}

completion.use { -- Completion engine sources
  { -- LuaSnip
    'saadparwaiz1/cmp_luasnip',
    after = 'nvim-cmp',
  },
  { -- LSP
    'hrsh7th/cmp-nvim-lsp',
    after = 'nvim-cmp',
    config = true,
  },
  { -- LSP Signature Help
    'hrsh7th/cmp-nvim-lsp-signature-help',
    after = 'nvim-cmp',
  },
  { -- Buffer words
    'hrsh7th/cmp-buffer',
    after = 'nvim-cmp',
  },
  { -- Filesystem paths
    'hrsh7th/cmp-path',
    after = 'nvim-cmp',
  },
  { -- Vim's cmdline
    'hrsh7th/cmp-cmdline',
    after = 'nvim-cmp',
  },
  { -- Neovim's Lua API
    'hrsh7th/cmp-nvim-lua',
    after = 'nvim-cmp',
  },
  { -- `textDocument/documentSymbol`
    'hrsh7th/cmp-nvim-lsp-document-symbol',
    after = 'nvim-cmp',
  },
  { -- NPM package names and versions
    'David-Kunz/cmp-npm',
    after = 'nvim-cmp',
    config = true,
  },
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
}

completion.use { -- Powerful autopair plugin
  'windwp/nvim-autopairs',
  requires = { 'hrsh7th/nvim-cmp' },
  config = true,
}

completion.use { -- A better annotation generator
  'danymat/neogen',
  requires = 'nvim-treesitter',
  keys = { '<localleader>d', '<localleader>df', '<localleader>dc' },
  setup = true,
}

return completion
