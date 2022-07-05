local function yabai_float(action)
  if vim.env.NVIM_IS_CHILD_PROCESS ~= 'true' then
    vim.cmd([[silent !yabai-float ]] .. action)
  end
end
local function yabai_float_on()
  yabai_float 'on'
end
local function yabai_float_off()
  yabai_float 'off'
end

local yabai = vim.api.nvim_create_augroup('yabai', {})
vim.api.nvim_create_autocmd('VimEnter', {
  group = yabai,
  pattern = '*',
  callback = yabai_float_off,
  desc = 'Make terminal full-screen',
  once = true,
})
vim.api.nvim_create_autocmd('VimResume', {
  group = yabai,
  pattern = '*',
  callback = yabai_float_off,
  desc = 'Make terminal full-screen',
})
vim.api.nvim_create_autocmd('VimSuspend', {
  group = yabai,
  pattern = '*',
  callback = yabai_float_on,
  desc = 'Make terminal float',
})
vim.api.nvim_create_autocmd('VimLeave', {
  group = yabai,
  pattern = '*',
  callback = yabai_float_on,
  desc = 'Make terminal float',
  once = true,
})
