-- HACK: workaround to trigger autocmd for virtcolumn.nvim
vim.schedule(function()
  vim.opt_local.colorcolumn = ""
  vim.opt.textwidth = 0
end)
