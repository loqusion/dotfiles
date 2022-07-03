-- https://github.com/nvim-neotest/neotest

local M = {}

function M.setup() end

function M.config()
  local ok, m = pcall(require, 'neotest')
  if not ok then
    return
  end

  M.neotest = m

  M.neotest.setup {
    adapters = {
      require 'neotest-jest' {
        jestCommand = 'yarn test --'
      },
      require 'neotest-vim-test' {
        ignore_filetypes = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' },
      },
    },
  }
end

return M
