-- https://github.com/haydenmeade/octo.nvim

local M = {
  safe_requires = {
    'octo',
  },
}

function M.setup() end

function M.config()
  M.octo.setup()
end

return M
