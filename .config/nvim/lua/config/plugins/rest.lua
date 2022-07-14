-- https://github.com/NTBBloodbath/rest.nvim

local M = {
  safe_requires = {
    { 'rest-nvim', 'rest' },
  },
}

function M.setup() end

function M.config()
  M.rest.setup {}
end

return M
