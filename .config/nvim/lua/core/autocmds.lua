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

-- local saved_cursorline = nil
-- vim.api.nvim_create_autocmd('WinLeave', {
--   desc = 'Hide cursorline',
--   pattern = '*',
--   callback = function()
--     saved_cursorline = vim.go.cursorline
--     vim.api.nvim_win_set_option(0, 'cursorline', false)
--   end,
--   group = groups.cursorline,
-- })
-- vim.api.nvim_create_autocmd('WinEnter', {
--   desc = 'Show cursorline',
--   pattern = '*',
--   callback = function()
--     local cursorline = saved_cursorline
--     if cursorline == nil then
--       cursorline = require('core.settings').opt.cursorline
--     end
--     vim.api.nvim_win_set_option(0, 'cursorline', cursorline)
--   end,
--   group = groups.cursorline,
-- })
