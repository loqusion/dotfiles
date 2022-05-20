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

return require('packer').startup({ function()
  use 'wbthomason/packer.nvim'
  
  use 'lewis6991/impatient.nvim'

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
      config = [[require('config.lsp')]],
    },
    -- 'folke/trouble.nvim',
    -- Is this needed?
    -- 'ray-x/lsp_signature.nvim',
    -- 'kosayoda/nvim-lightbulb',
  }
  -- jose-elias-alvarez/null-ls.nvim

  use {
    'jiangmiao/auto-pairs',
    config = [[vim.g.AutoPairsFlyMode = 1]],
    -- event = 'InsertEnter *',
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  }
  use 'AndrewRadev/splitjoin.vim'

  use {
    'tyru/open-browser.vim',
    config = [[require('config.open_browser')]],
  }

  use 'liuchengxu/space-vim-theme'
  use {
    'kyazdani42/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').setup { default = true, }
    end
  }

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
