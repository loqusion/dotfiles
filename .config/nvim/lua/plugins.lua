local fn = vim.fn
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap = nil
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup {
  function(use)
    use 'wbthomason/packer.nvim'

    use 'lewis6991/impatient.nvim'

    use {
      'kyazdani42/nvim-web-devicons',
      config = function()
        require('nvim-web-devicons').setup { default = true }
      end,
    }

    -- Highlights
    use {
      {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
      },
      {
        'nvim-treesitter/playground',
        cmd = 'TSPlaygroundToggle',
        after = 'nvim-treesitter',
      },
      {
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
      },
      {
        'RRethy/nvim-treesitter-endwise',
        ft = { 'lua', 'ruby', 'sh', 'vim' },
        after = 'nvim-treesitter',
      },
      {
        'windwp/nvim-ts-autotag',
        ft = { 'html', 'javascriptreact', 'typescriptreact', 'vue' },
        after = 'nvim-treesitter',
      },
    }
    use {
      'norcalli/nvim-colorizer.lua',
      ft = {
        'css',
        'html',
        'javascript',
        'javascriptreact',
        'sass',
        'scss',
        'typescript',
        'typescriptreact',
        'vim',
        'vue',
      },
      config = function()
        require('colorizer').setup({
          'css',
          'html',
          'javascript',
          'javascriptreact',
          'sass',
          'scss',
          'typescript',
          'typescriptreact',
          'vim',
          'vue',
        }, {
          RGB = true,
          RRGGBB = true,
          names = true,
          RRGGBBAA = true,
          rgb_fn = true,
          hsl_fn = true,
        })
      end,
    }

    -- LSP
    use {
      'williamboman/nvim-lsp-installer',
      'neovim/nvim-lspconfig',
      'nvim-lua/lsp-status.nvim',
      'folke/trouble.nvim',
      'folke/lsp-colors.nvim',
      'ray-x/lsp_signature.nvim',
      'kosayoda/nvim-lightbulb',
      { 'jose-elias-alvarez/null-ls.nvim', requires = 'nvim-lua/plenary.nvim' },
      {
        'ThePrimeagen/refactoring.nvim',
        requires = {
          'nvim-lua/plenary.nvim',
          'nvim-treesitter/nvim-treesitter',
        },
      },
    }

    -- Completion/Snippets
    use {
      'hrsh7th/nvim-cmp',
      requires = {
        'L3MON4D3/LuaSnip',
        'onsails/lspkind.nvim',
        { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-nvim-lsp-signature-help', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
        {
          'David-Kunz/cmp-npm',
          requires = 'nvim-lua/plenary.nvim',
          after = 'nvim-cmp',
          config = [[require('cmp-npm').setup()]],
        },
        'lukas-reineke/cmp-under-comparator',
        { 'hrsh7th/cmp-nvim-lsp-document-symbol', after = 'nvim-cmp' },
      },
      config = [[require('config.cmp')]],
      event = { 'InsertEnter *', 'CursorHold' },
    }
    use {
      'danymat/neogen',
      requires = 'nvim-treesitter',
      config = [[require('config.neogen')]],
      keys = { '<localleader>d', '<localleader>df', '<localleader>dc' },
    }

    -- Search
    use {
      {
        -- 'nvim-telescope/telescope.nvim',
        '~/Projects/telescope.nvim',
        requires = {
          'nvim-lua/popup.nvim',
          'nvim-lua/plenary.nvim',
          'telescope-frecency.nvim',
          'telescope-fzf-native.nvim',
          'telescope-dap.nvim',
          'nvim-telescope/telescope-ui-select.nvim',
        },
        wants = {
          'popup.nvim',
          'plenary.nvim',
          'telescope-frecency.nvim',
          'telescope-fzf-native.nvim',
        },
        setup = [[require('config.telescope_setup')]],
        config = [[require('config.telescope')]],
        cmd = 'Telescope',
        module = 'telescope',
      },
      {
        'nvim-telescope/telescope-frecency.nvim',
        after = 'telescope.nvim',
        requires = 'tami5/sqlite.lua',
      },
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
      },
      {
        'nvim-telescope/telescope-dap.nvim',
      },
    }

    -- Documentation
    use 'rizzatti/dash.vim'

    -- REPL
    use {
      'hkupty/iron.nvim',
      setup = [[require('config.iron_setup')]],
      config = [[require('config.iron')]],
      cmd = { 'IronRepl', 'IronSend', 'IronReplHere' },
      module = 'iron',
    }

    -- Build
    use { 'tpope/vim-dispatch', cmd = { 'Dispatch', 'Make', 'Focus', 'Start' } }

    -- Debug
    use {
      {
        'mfussenegger/nvim-dap',
        setup = [[require('config.dap_setup')]],
        config = [[require('config.dap')]],
        requires = { 'jbyuki/one-small-step-for-vimkind' },
        wants = 'one-small-step-for-vimkind',
        module = 'dap',
      },
      {
        'rcarriga/nvim-dap-ui',
        requires = 'nvim-dap',
        after = 'nvim-dap',
        config = function()
          require('dapui').setup()
        end,
      },
    }

    -- Quickfix/Location list
    use { 'romainl/vim-qf', config = [[require('config.qf')]] }
    -- use 'kevinhwang91/nvim-bqf'
    use {
      'mhinz/vim-grepper',
      cmd = 'Grepper',
      keys = '<plug>(GrepperOperator)',
      setup = [[require('config.grepper')]],
    }

    -- Git
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    -- use { 'mhinz/vim-signify', config = [[require('config.signify')]] }
    use {
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = [[require('config.gitsigns')]],
    }
    use { 'TimUntersberger/neogit', cmd = 'Neogit', config = [[require('config.neogit')]] }

    -- JavaScript/TypeScript
    use {
      'vuki656/package-info.nvim',
      requires = 'MunifTanjim/nui.nvim',
      config = function()
        require('package-info').setup()
      end,
    }

    -- Markdown
    use 'preservim/vim-markdown'
    use {
      'iamcco/markdown-preview.nvim',
      run = 'cd app && yarn install',
      ft = { 'markdown', 'pandoc.markdown', 'rmd' },
      setup = function()
        vim.g.mkdp_filetypes = { 'markdown', 'pandoc.markdown', 'rmd' }
      end,
    }

    -- Python
    use 'Vimjas/vim-python-pep8-indent'
    use {
      'mfussenegger/nvim-dap-python',
      requires = 'nvim-dap',
    }

    -- Rust
    use {
      'simrat39/rust-tools.nvim',
      ft = 'rust',
      config = [[require('rust-tools').setup({})]],
    }

    -- Text objects
    use {
      'kana/vim-textobj-user',
      'kana/vim-textobj-entire',
    }
    use 'wellle/targets.vim'
    use 'chaoren/vim-wordmotion'

    -- Operators and mappings
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use {
      'kana/vim-arpeggio',
      config = [[require('config.arpeggio')]],
    }
    use {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup {
          -- toggler = { block = 'gBB' },
          -- opleader = { block = 'gB' },
        }
      end,
    }
    use { 'AndrewRadev/splitjoin.vim', config = [[require('config.splitjoin')]] }
    use {
      'AndrewRadev/switch.vim',
      setup = [[vim.g.switch_mapping = '_']],
      keys = '_',
    }
    use { 'tpope/vim-unimpaired', config = [[require('config.unimpaired')]] }

    -- Augmentations
    use { 'kana/vim-niceblock', config = [[require('config.niceblock')]] }
    use { 'osyo-manga/vim-jplus', config = [[require('config.jplus')]] }
    use {
      'tyru/open-browser.vim',
      config = [[require('config.open_browser')]],
    }
    use { 'mhinz/vim-sayonara', cmd = 'Sayonara' }
    use { 'rhysd/accelerated-jk', config = [[require('config.accelerated_jk')]] }
    use { 'hrsh7th/vim-eft', config = [[require('config.eft')]] }
    use {
      'yuki-yano/fuzzy-motion.vim',
      requires = { 'vim-denops/denops.vim', event = 'CursorHold' },
      config = [[require('config.fuzzy_motion')]],
    }
    -- use 'kana/vim-smartinput'
    use { 'windwp/nvim-autopairs', config = [[require('config.autopairs')]] }
    use { 'andymass/vim-matchup', config = [[require('config.matchup')]] }
    use { 'romainl/vim-cool' }
    use {
      'dhruvasagar/vim-prosession',
      after = 'vim-obsession',
      requires = {
        {
          'tpope/vim-obsession',
          -- cmd = 'Prosession',
        },
      },
      config = [[require('config.prosession')]],
    }
    use 'tpope/vim-eunuch'

    -- UI
    use { 'lukas-reineke/indent-blankline.nvim' }
    use {
      'tversteeg/registers.nvim',
      keys = { { 'n', '"' }, { 'i', '<c-r>' } },
      config = [[require('config.registers')]],
    }
    use {
      'mbbill/undotree',
      cmd = 'UndotreeToggle',
      config = [[vim.g.undotree_SetFocusWhenToggle = 1]],
    }
    use {
      'VonHeikemen/fine-cmdline.nvim',
      disable = true,
      requires = 'MunifTanjim/nui.nvim',
      -- keys = ':',
      config = [[require('config.fine_cmdline')]],
    }
    use {
      {
        'justinmk/vim-dirvish',
        config = function()
          vim.g.dirvish_mode = 1
          vim.cmd [[autocmd FileType dirvish silent sort ,^.*[/],]]
        end,
      },
      'bounceme/remote-viewer',
    }
    use {
      'akinsho/bufferline.nvim',
      disable = true,
      requires = 'kyazdani42/nvim-web-devicons',
      config = [[require('config.bufferline')]],
    }
    use { 'akinsho/toggleterm.nvim', config = [[require('config.toggleterm')]] }
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = [[require('config.lualine')]],
    }
    use {
      'simrat39/symbols-outline.nvim',
      cmd = { 'SymbolsOutline', 'SymbolsOutlineOpen', 'SymbolsOutlineClose' },
      setup = [[require('config.symbols_outline')]],
    }

    -- plugin writing
    use 'tpope/vim-scriptease'
    use { 'tweekmonster/helpful.vim', cmd = 'HelpfulVersion' }
    use 'folke/lua-dev.nvim'

    -- filetype
    use {
      'vimwiki/vimwiki',
      keys = '<Plug>Vimwiki',
      setup = [[require('config.vimwiki')]],
    }
    use {
      'Shougo/vinarise.vim',
      cmd = 'Vinarise',
      setup = [[vim.g.vinarise_enable_auto_detect = 1]],
    }
    -- use 'Shougo/context_filetype.vim'

    -- Settings
    use 'tpope/vim-sleuth'
    -- use {
    --   'editorconfig/editorconfig-vim',
    --   setup = [[require('config.editorconfig')]],
    -- }

    -- Profiling
    use {
      'dstein64/vim-startuptime',
      cmd = 'StartupTime',
      config = [[vim.g.startuptime_tries = 10]],
    }

    -- Misc
    use 'vim-jp/vimdoc-ja'
    -- use 'chrisbra/vim-zsh'
    -- use 'roxma/nvim-yarp'
    -- use 'vim-jp/syntax-vim-ex'
    -- use 'cespare/vim-toml'
    -- use 'thinca/vim-qfreplace'
    -- use 'rcarriga/nvim-notify'
    use 'MunifTanjim/nui.nvim'
    -- use 'Shougo/ddx.vim'
    use 'antoinemadec/FixCursorHold.nvim'

    -- Colorscheme
    use 'liuchengxu/space-vim-theme'
    use 'sainnhe/gruvbox-material'

    if packer_bootstrap then
      require('packer').sync()
    end
  end,
  config = {
    display = {
      open_fn = require('packer.util').float,
    },
  },
}
