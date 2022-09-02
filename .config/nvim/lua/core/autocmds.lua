local yabai = require 'utils.api.yabai'

local groups = {
  cursorline = vim.api.nvim_create_augroup('cursorline', {}),
  yabai = vim.api.nvim_create_augroup('yabai', {}),
}

vim.api.nvim_create_autocmd('VimEnter', {
  desc = 'Make terminal full-screen',
  pattern = '*',
  callback = yabai.float_off,
  once = true,
  group = groups.yabai,
})
vim.api.nvim_create_autocmd('VimResume', {
  desc = 'Make terminal full-screen',
  pattern = '*',
  callback = yabai.float_off,
  group = groups.yabai,
})
vim.api.nvim_create_autocmd('VimSuspend', {
  desc = 'Make terminal float',
  pattern = '*',
  callback = yabai.float_on,
  group = groups.yabai,
})
vim.api.nvim_create_autocmd('VimLeave', {
  desc = 'Make terminal float',
  pattern = '*',
  callback = yabai.float_on,
  once = true,
  group = groups.yabai,
})

-- vim.api.nvim_create_autocmd('WinEnter', {
--   desc = 'Show cursorline',
--   pattern = '*',
--   callback = function()
--     if vim.w.saved_cursorline then
--       vim.w.saved_cursorline = nil
--       vim.wo.cursorline = true
--     end
--   end,
--   group = groups.cursorline,
-- })
-- vim.api.nvim_create_autocmd('WinLeave', {
--   desc = 'Hide cursorline',
--   pattern = '*',
--   callback = function()
--     if vim.wo.cursorline then
--       vim.w.saved_cursorline = true
--       vim.wo.cursorline = false
--     end
--   end,
--   group = groups.cursorline,
-- })
