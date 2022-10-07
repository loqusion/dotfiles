local lazy = require 'crows.lazy'
local persisted = lazy.require 'persisted'
local persisted_utils = lazy.require 'persisted.utils'

local M = {}

function M.load(file_path, _opts)
  local opts = _opts or {}
  if not opts.should_save then
    persisted.stop()
  end
  if vim.o.filetype == 'dashboard' then
    vim.cmd [[
      autocmd! dashboard-nvim
      augroup! dashboard-nvim
    ]]
    vim.api.nvim_input('<Esc>:bd<CR>')
  end
  local ok, err = pcall(persisted_utils.load_session, file_path)
  if not ok then
    vim.api.nvim_echo({
      { '[sessions.lua]: ', 'ErrorMsg' },
      { 'Error loading the session! ', 'WarningMsg' },
      { err, 'Normal' },
    }, true, {})
  end
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
