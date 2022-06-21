-- https://github.com/nvim-neotest/neotest

local M = {}

function M.setup() end

function M.config()
  require('neotest').setup {
    adapters = {
      require 'neotest-jest' {},
      require 'neotest-vim-test' {
        ignore_filetypes = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' },
      },
    },
  }
end

return M
