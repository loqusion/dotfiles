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
    -- 'folke/trouble.nvim',
    -- Is this needed?
    -- 'ray-x/lsp_signature.nvim',
    -- 'kosayoda/nvim-lightbulb',
  }
  -- jose-elias-alvarez/null-ls.nvim

  -- Git
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use {
    'mhinz/vim-signify',
    config = [[require('config.signify')]],
  }
  use 'airblade/vim-gitgutter'

  -- Python
  use 'Vimjas/vim-python-pep8-indent'

  use {
    'jiangmiao/auto-pairs',
    config = [[vim.g.AutoPairsFlyMode = 1]],
    -- event = 'InsertEnter *',
  }
  use { 'mhinz/vim-sayonara', cmd = 'Sayonara' }

  use {
    'kana/vim-operator-user',
    {
      'rhysd/vim-operator-surround',
      requires = 'kana/vim-operator-user',
      config = [[require('config.operator_surround')]],
    }
  }
  use { 'kana/vim-niceblock', config = [[require('config.niceblock')]] }
  use { 'osyo-manga/vim-jplus', config = [[require('config.jplus')]] }
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup {}
    end,
  }
  use 'AndrewRadev/splitjoin.vim'
  use {
    'tyru/open-browser.vim',
    config = [[require('config.open_browser')]],
  }

  use { 'rhysd/accelerated-jk', config = [[require('config.accelerated_jk')]] }
  use { 'hrsh7th/vim-eft', config = [[require('config.eft')]] }
  use {
    'yuki-yano/fuzzy-motion.vim',
    requires = { 'vim-denops/denops.vim', event = 'CursorHold' },
    config = [[require('config.fuzzy_motion')]],
  }

  use { 'andymass/vim-matchup', config = [[require('config.matchup')]] }
  use { 'whatyouhide/vim-lengthmatters', config = [[require('config.lengthmatters')]] }
  use { 'lukas-reineke/indent-blankline.nvim' }
  use {
    'tversteeg/registers.nvim',
    keys = { { 'n', '"' }, { 'i', '<c-r>' } },
    config = [[require('config.registers')]],
  }

  use 'liuchengxu/space-vim-theme'
  use {
    'kyazdani42/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').setup { default = true, }
    end
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

  -- settings
  use 'tpope/vim-sleuth'
  -- use {
  --   'editorconfig/editorconfig-vim',
  --   setup = [[require('config.editorconfig')]],
  -- }

  -- use 'vim-jp/autofmt'
  use 'vim-jp/vimdoc-ja'
  -- use 'chrisbra/vim-zsh'
  -- use 'roxma/nvim-yarp'
  -- use 'vim-jp/syntax-vim-ex'
  -- use 'cespare/vim-toml'
  -- use 'thinca/vim-qfreplace'
  -- use 'rcarriga/nvim-notify'
  -- use 'MunifTanjim/nui.nvim'
  -- use 'Shougo/ddx.vim'
  -- use 'VonHeikemen/fine-cmdline.nvim'

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
