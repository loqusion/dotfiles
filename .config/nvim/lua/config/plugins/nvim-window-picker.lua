-- https://github.com/s1n7ax/nvim-window-picker

local M = {}

function M.setup() end

function M.config()
  local ok, m = pcall(require, 'window-picker')
  if not ok then
    vim.notify(
      string.format('Failed to load config %s', require('utils.api.path').current_filename(true)),
      vim.log.levels.ERROR
    )
    return
  end

  M.window_picker = m
  M.window_picker.setup()
end

return M
