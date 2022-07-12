local yabai = require 'utils.api.yabai'

local yabai_autocmd_group = vim.api.nvim_create_augroup('yabai', {})
vim.api.nvim_create_autocmd('VimEnter', {
  group = yabai_autocmd_group,
  pattern = '*',
  callback = yabai.float_off,
  desc = 'Make terminal full-screen',
  once = true,
})
vim.api.nvim_create_autocmd('VimResume', {
  group = yabai_autocmd_group,
  pattern = '*',
  callback = yabai.float_off,
  desc = 'Make terminal full-screen',
})
vim.api.nvim_create_autocmd('VimSuspend', {
  group = yabai_autocmd_group,
  pattern = '*',
  callback = yabai.float_on,
  desc = 'Make terminal float',
})
vim.api.nvim_create_autocmd('VimLeave', {
  group = yabai_autocmd_group,
  pattern = '*',
  callback = yabai.float_on,
  desc = 'Make terminal float',
  once = true,
})
