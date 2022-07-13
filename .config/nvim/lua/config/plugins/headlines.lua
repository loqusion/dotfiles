-- https://github.com/lukas-reineke/headlines.nvim

local M = {
  safe_requires = {
    'headlines',
  },
}

function M.setup() end

function M.config()
  M.headlines.setup {}
end

return M
