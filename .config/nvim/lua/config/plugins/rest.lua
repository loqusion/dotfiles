-- https://github.com/NTBBloodbath/rest.nvim

local M = {}

function M.setup() end

function M.config()
  local ok, m = pcall(require, 'rest-nvim')
  if not ok then
    return
  end

  M.rest_nvim = m

  m.setup {}
end

return M
