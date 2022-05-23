local fn = vim.fn
local install_path =
fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap = nil
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git', 'clone', '--depth', '1',
    'https://github.com/wbthomason/packer.nvim', install_path
  })
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup({ function(use)
  use 'wbthomason/packer.nvim'

  use 'lewis6991/impatient.nvim'

  use {
    'kyazdani42/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').setup { default = true, }
    end
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

  -- Completion
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

  -- Search
  use {
    {
      'nvim-telescope/telescope.nvim',
      requires = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
        'telescope-frecency.nvim',
        'telescope-fzf-native.nvim',
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
  }

  -- LSP
  use {
    'williamboman/nvim-lsp-installer',
    {
      'neovim/nvim-lspconfig',
      -- config = [[require('config.lsp')]],
    },
    'folke/trouble.nvim',
    'folke/lsp-colors.nvim',
    -- Is this needed?
    -- 'ray-x/lsp_signature.nvim',
    -- 'kosayoda/nvim-lightbulb',
  }
  -- jose-elias-alvarez/null-ls.nvim

  -- Build
  use { 'tpope/vim-dispatch', cmd = { 'Dispatch', 'Make', 'Focus', 'Start' } }

  -- REPL
  use {
    'hkupty/iron.nvim',
    setup = [[require('config.iron_setup')]],
    config = [[require('config.iron')]],
    cmd = { 'IronRepl', 'IronSend', 'IronReplHere'},
    module = 'iron',
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

  -- Python
  use 'Vimjas/vim-python-pep8-indent'

  -- Text objects
  use {
    'kana/vim-textobj-user',
    'kana/vim-textobj-entire',
  }
  use 'wellle/targets.vim'
  use 'chaoren/vim-wordmotion'

  -- Operators and mappings
  use {
    'kana/vim-operator-user',
    {
      'rhysd/vim-operator-surround',
      requires = 'kana/vim-operator-user',
      config = [[require('config.operator_surround')]],
    }
  }
  use {
    'kana/vim-arpeggio',
    config = [[require('config.arpeggio')]],
  }
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup {}
    end,
  }
  use { 'AndrewRadev/splitjoin.vim', config = [[require('config.splitjoin')]] }
  use {
    'AndrewRadev/switch.vim',
    setup = [[vim.g.switch_mapping = '_']],
    keys = '_',
  }

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
  use 'kana/vim-smartinput'
  use {
    'jiangmiao/auto-pairs',
    config = [[vim.g.AutoPairsFlyMode = 1]],
    disable = true,
    -- event = 'InsertEnter *',
  }
  use { 'andymass/vim-matchup', config = [[require('config.matchup')]] }
  use { 'romainl/vim-cool' }
  use {
    'dhruvasagar/vim-prosession',
    after = 'vim-obsession',
    requires = { {
      'tpope/vim-obsession',
      -- cmd = 'Prosession',
    } },
    config = [[require('config.prosession')]],
  }

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
    requires = 'MunifTanjim/nui.nvim',
    -- keys = ':',
    config = [[require('config.fine_cmdline')]],
  }

  -- plugin writing
  use 'tpope/vim-scriptease'
  use { 'tweekmonster/helpful.vim', cmd = 'HelpfulVersion', }

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

  if packer_bootstrap then
    require('packer').sync()
  end
end,
config = {
  display = {
    open_fn = require('packer.util').float,
  },
}
})
