local lazy = require 'crows.lazy'
local persisted = lazy.require 'persisted'

local M = {}

function M.load(file_path)
  vim.cmd('source ' .. vim.fn.fnameescape(file_path))
end

function M.list()
  return persisted.list()
end

-- returns last `count` sessions sorted by last modified
---@param count number defaults to 10
function M.last(count)
  local function comparator(a, b)
    local date_a = vim.fn.getftime(a.file_path)
    local date_b = vim.fn.getftime(b.file_path)
    if date_a == date_b then
      return a.name < b.name
    end
    return date_a > date_b
  end

  count = count or 10

  local sessions = M.list() or {}
  table.sort(sessions, comparator)
  count = math.min(count, #sessions)

  local last_sessions = {}
  for i = 1, count do
    table.insert(last_sessions, sessions[i])
  end
  return last_sessions
end

return M
