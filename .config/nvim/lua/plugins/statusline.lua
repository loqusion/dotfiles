local statusline = require('crows.utils').new_feat()

statusline.use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons' },
  config = true,
}

return statusline
