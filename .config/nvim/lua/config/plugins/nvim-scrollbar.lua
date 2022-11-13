-- https://github.com/petertriho/nvim-scrollbar

local M = {
  safe_requires = {
    'scrollbar',
  },
}

function M.setup() end

function M.config()
  M.scrollbar.setup {
    handlers = {
      diagnostic = false,
    },
  }
end

return M
