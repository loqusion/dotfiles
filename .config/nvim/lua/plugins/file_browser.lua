local file_browser = require('crows.utils').new_feat()

file_browser.use {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    setup = true,
  },
  { -- For neotree `w` mapping
    's1n7ax/nvim-window-picker',
    tag = 'v1.*',
    module = 'window-picker',
    config = true,
  },
}

file_browser.use {
  'nanozuki/tabby.nvim',
  requires = 'kyazdani42/nvim-web-devicons',
  config = true,
}

return file_browser
