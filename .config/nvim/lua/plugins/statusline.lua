local statusline = require('crows.utils').new_feat()

statusline.use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  config = true,
}

return statusline
