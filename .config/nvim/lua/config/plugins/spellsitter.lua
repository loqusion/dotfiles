-- https://github.com/lewis6991/spellsitter.nvim

local M = {}

function M.setup() end

function M.config()
  local ok, m = pcall(require, 'spellsitter')
  if not ok then
    return
  end

  M.spellsitter = m
  M.spellsitter.setup()
end

return M
