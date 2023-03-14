local statusline = require('utils.api').feat.new()

statusline.use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons' },
  config = true,
}

return statusline
