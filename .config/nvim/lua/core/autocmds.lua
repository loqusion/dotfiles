local yabai = vim.api.nvim_create_augroup('yabai', {})
-- TODO: handle nested vims
vim.api.nvim_create_autocmd('VimEnter', {
  group = yabai,
  pattern = '*',
  command = 'silent !yabai-float off',
  desc = 'Make terminal full-screen',
  once = true,
})
vim.api.nvim_create_autocmd('VimResume', {
  group = yabai,
  pattern = '*',
  command = 'silent !yabai-float off',
  desc = 'Make terminal full-screen',
})
vim.api.nvim_create_autocmd('VimSuspend', {
  group = yabai,
  pattern = '*',
  command = 'silent !yabai-float on',
  desc = 'Make terminal float',
})
vim.api.nvim_create_autocmd('VimLeave', {
  group = yabai,
  pattern = '*',
  command = 'silent !yabai-float on',
  desc = 'Make terminal float',
  once = true,
})
