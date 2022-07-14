-- https://github.com/s1n7ax/nvim-window-picker

local M = {
  safe_requires = {
    { 'window-picker', 'window_picker' },
  },
}

function M.setup() end

function M.config()
  M.window_picker.setup()
end

return M
