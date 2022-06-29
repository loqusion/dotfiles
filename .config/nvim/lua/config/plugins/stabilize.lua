-- https://github.com/luukvbaal/stabilize.nvim

local M = {}

function M.setup() end

function M.config()
  local ok, m = pcall(require, 'stabilize')
  if not ok then
    return
  end

  M.stabilize = m
  M.stabilize.setup()
end

return M
