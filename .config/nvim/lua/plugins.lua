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

    use 'lewis6991/impatient.nvim' -- Speed up loading Lua modules to improve startup time

    use { -- Adds filetype glyphs to various plugins
      'kyazdani42/nvim-web-devicons',
      config = function()
        require('nvim-web-devicons').setup { default = true }
      end,
    }

    -- Treesitter
    use { -- Config: ../plugin/treesitter.lua
      { -- Efficient syntax tree for highlighting, etc
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
      },
      { -- View treesitter information directly in Neovim!
        'nvim-treesitter/playground',
        cmd = 'TSPlaygroundToggle',
        after = 'nvim-treesitter',
      },
      { -- Syntax aware text-objects, select, move, swap, and peek support
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
      },
      { -- Wisely add "end" in ruby, Lua, Vimscript, etc
        'RRethy/nvim-treesitter-endwise',
        ft = { 'lua', 'ruby', 'sh', 'vim' },
        after = 'nvim-treesitter',
      },
      { -- Autoclose and autorename html tag
        'windwp/nvim-ts-autotag',
        ft = { 'html', 'javascriptreact', 'typescriptreact', 'vue', 'markdown' },
        after = 'nvim-treesitter',
      },
    }

    -- Highlights
    use { -- Color highlighter
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
    use { -- Config: ../plugin/lsp.lua
      'williamboman/nvim-lsp-installer', -- Manage LSP servers
      'neovim/nvim-lspconfig', -- Collection of common configurations for LSP servers
      'nvim-lua/lsp-status.nvim', -- Generate statusline components
      { -- Pretty list for showing diagnostics, references, telescope results, quickfix and location lists
        'folke/trouble.nvim',
        config = [[require('config.trouble')]],
      },
      'folke/lsp-colors.nvim', -- Automatically creates missing LSP diagnostics highlight groups
      'ray-x/lsp_signature.nvim', -- Show function signature when you type
      'kosayoda/nvim-lightbulb', -- Show  for `textDocument/codeAction`s
      { -- Inject LSP diagnostics, code actions, and more
        'jose-elias-alvarez/null-ls.nvim',
        requires = 'nvim-lua/plenary.nvim',
      },
      { -- Automated refactorings
        'ThePrimeagen/refactoring.nvim',
        requires = {
          'nvim-lua/plenary.nvim',
          'nvim-treesitter/nvim-treesitter',
        },
      },
    }

    -- Completion/Snippets
    use { -- Config: ./config/cmp.lua
      'hrsh7th/nvim-cmp', -- Completion engine
      requires = {
        'L3MON4D3/LuaSnip', -- Snippets
        'onsails/lspkind.nvim', -- Pictograms for LSP
        -- Completion engine sources
        { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' }, -- LSP
        { 'hrsh7th/cmp-nvim-lsp-signature-help', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }, -- Buffer words
        { 'hrsh7th/cmp-path', after = 'nvim-cmp' }, -- Filesystem paths
        { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' }, -- Vim's cmdline
        { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' }, -- Neovim's Lua API
        { -- NPM package names and versions
          'David-Kunz/cmp-npm',
          requires = 'nvim-lua/plenary.nvim',
          after = 'nvim-cmp',
          config = [[require('cmp-npm').setup()]],
        },
        'lukas-reineke/cmp-under-comparator', -- Better sorting for underscores
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
              config = function()
                vim.defer_fn(function()
                  require('copilot').setup()
                end, 100)
              end,
            },
          },
          after = { 'copilot.lua', 'nvim-cmp' },
        },
      },
      config = [[require('config.cmp')]],
      event = { 'InsertEnter *', 'CmdlineEnter', 'CmdwinEnter', 'CursorHold' },
    }
    use { -- Creates annotations with one keybind
      'danymat/neogen',
      requires = 'nvim-treesitter',
      config = [[require('config.neogen')]],
      keys = { '<localleader>d', '<localleader>df', '<localleader>dc' },
    }

    -- Search
    use {
      { -- Gaze deeply into unknown regions using the power of the moon.
        -- 'nvim-telescope/telescope.nvim',
        '~/Projects/telescope.nvim', -- Until `find_files` has additional ignore options
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
      { -- Intelligent prioritization when selecting files from your editing history
        'nvim-telescope/telescope-frecency.nvim',
        after = 'telescope.nvim',
        requires = 'tami5/sqlite.lua',
      },
      { -- fzf syntax for Telescope
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
      },
      { -- Integration for nvim-dap
        'nvim-telescope/telescope-dap.nvim',
      },
    }

    -- Documentation
    use 'rizzatti/dash.vim' -- Dash.app

    -- REPL
    use { -- Quickly interact with the repl without having to leave your work buffer
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
      { -- Launch debug sessions, set breakpoints, step through code, inspect state
        'mfussenegger/nvim-dap',
        setup = [[require('config.dap_setup')]],
        config = [[require('config.dap')]],
        requires = { 'jbyuki/one-small-step-for-vimkind' },
        wants = 'one-small-step-for-vimkind',
        module = 'dap',
      },
      { -- UI for nvim-dap
        'rcarriga/nvim-dap-ui',
        requires = 'nvim-dap',
        after = 'nvim-dap',
        config = function()
          require('dapui').setup()
        end,
      },
      { -- Python DAP
        'mfussenegger/nvim-dap-python',
        requires = 'nvim-dap',
        ft = 'python',
        config = [[require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')]],
      },
    }

    -- Quickfix/Location list
    use { -- Settings, commands, and mappings to make working with qf list smoother
      'romainl/vim-qf',
      config = [[require('config.qf')]],
    }
    -- use 'kevinhwang91/nvim-bqf'
    use { -- Use your favorite grep tool to start an asynchronous search and populate quickfix/location list
      'mhinz/vim-grepper',
      cmd = 'Grepper',
      keys = '<plug>(GrepperOperator)',
      setup = [[require('config.grepper')]],
    }
    use 'Olical/vim-enmasse'

    -- Git
    use 'tpope/vim-fugitive' -- A git wrapper so awesome, it should be illegal
    use 'tpope/vim-rhubarb' -- :GBrowse and completion for issues/URLs/collaborators
    -- use { 'mhinz/vim-signify', config = [[require('config.signify')]] }
    use { -- Super fast git decorations
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = [[require('config.gitsigns')]],
    }
    use { -- Magit clone
      'TimUntersberger/neogit',
      cmd = 'Neogit',
      config = [[require('config.neogit')]],
    }

    -- JavaScript/TypeScript
    use { -- All the `npm`/`yarn`/`pnpm` commands I don't want to type
      'vuki656/package-info.nvim',
      requires = 'MunifTanjim/nui.nvim',
      config = function()
        require('package-info').setup()
        require 'config.package_info'
      end,
    }

    -- Markdown
    use 'preservim/vim-markdown'
    use { -- Preview markdown on your modern browser with synchronized scrolling and flexible configuration
      'iamcco/markdown-preview.nvim',
      run = 'cd app && yarn install',
      ft = { 'markdown', 'pandoc.markdown', 'rmd' },
      setup = function()
        vim.g.mkdp_filetypes = { 'markdown', 'pandoc.markdown', 'rmd' }
      end,
    }

    -- Python
    use 'Vimjas/vim-python-pep8-indent' -- Modify indentation behavior to comply with PEP8

    -- Rust
    use { -- Extra rust tools
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
    use {
      'Pocco81/TrueZen.nvim',
      config = [[require('config.true_zen')]],
    }
    use { -- Dims inactive portions of code
      -- 'folke/twilight.nvim',
      'loqusion/twilight.nvim', -- Use this one until https://github.com/folke/twilight.nvim/issues/15 is resolved
      setup = function()
        vim.keymap.set({ 'n', 'v' }, '<localleader>t', '<cmd>Twilight<cr>')
      end,
    }
    -- use 'stevearc/dressing.nvim'
    -- use {
    --   'hood/popui.nvim',
    --   requires = 'RishabhRD/popfix',
    --   config = function()
    --     vim.ui.select = require('popui.ui-overrider')
    --     vim.ui.input = require('popui.input-overrider')
    --   end,
    -- }

    -- Vim
    use 'tpope/vim-scriptease'
    use { 'tweekmonster/helpful.vim', cmd = 'HelpfulVersion' }
    use 'folke/lua-dev.nvim'
    use { 'folke/which-key.nvim', config = [[require('which-key').setup()]] }

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
