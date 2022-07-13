-- https://github.com/j-hui/fidget.nvim

local M = {
  safe_requires = {
    'fidget',
  },
}

function M.setup() end

function M.config()
  M.fidget.setup {
    window = {
      blend = 100,
    },
  }
end

return M
