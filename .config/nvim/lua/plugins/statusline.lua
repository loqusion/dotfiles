local statusline = require('crows.utils').new_feat()

statusline.pre = function()
  vim.opt.showcmd = false
  vim.opt.showmode = false
  vim.opt.laststatus = 3
end

statusline.use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  config = true,
}

return statusline
