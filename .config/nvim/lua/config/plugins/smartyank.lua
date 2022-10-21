-- https://github.com/ibhagwan/smartyank.nvim

local M = {
  safe_requires = {
    'smartyank',
  },
}

function M.setup() end

function M.config()
  M.smartyank.setup {
    highlight = {
      timeout = 80,
    }
  }
end

return M
