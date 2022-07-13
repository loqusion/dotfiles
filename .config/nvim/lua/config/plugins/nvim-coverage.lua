-- https://github.com/andythigpen/nvim-coverage

local M = {
  safe_requires = {
    'coverage',
  },
}

function M.setup() end

function M.config()
  M.coverage.setup {
    commands = true,
  }
end

return M
