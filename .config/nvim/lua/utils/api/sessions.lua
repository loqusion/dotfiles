local lazy = require 'utils.api.lazy'

local persisted = lazy.require 'persisted'
local persisted_utils = lazy.require 'persisted.utils'

local session_manager_utils = lazy.require 'session_manager.utils'

local plugin = 'persisted'

local function resolve_value(session, key)
  if key == nil then
    return nil
  elseif type(key) == 'function' then
    return key(session)
  elseif type(key) == 'string' then
    return session[key]
  end
end

local implementations = {
  persisted = {
    load = function(filename)
      local ok, err = pcall(persisted_utils.load_session, filename)
      if ok then
        persisted.start()
      else
        vim.api.nvim_echo({
          { '[sessions.lua]: ', 'ErrorMsg' },
          { 'Error loading the session! ', 'WarningMsg' },
          { err, 'Normal' },
        }, true, {})
      end
    end,
    list = function()
      return persisted.list()
    end,
    is_session = function()
      return vim.g.persisting
    end,
    get = function(session, key)
      local resolved_key = ({
        filename = 'file_path',
        -- timestamp = 'timestamp',
        -- dir = 'dir',
        name = 'name',
      })[key]
      return resolve_value(session, resolved_key)
    end,
  },
  session_manager = {
    load = function(filename)
      session_manager_utils.load_session(filename, false)
    end,
    list = function()
      return session_manager_utils.get_sessions()
    end,
    is_session = function()
      return session_manager_utils.is_session
    end,
    get = function(session, key)
      local resolved_key = ({
        filename = 'filename',
        timestamp = 'timestamp',
        dir = 'dir',
        name = function(_session)
          return vim.fn.fnamemodify(_session.dir.filename, ':~')
        end,
      })[key]
      return resolve_value(session, resolved_key)
    end,
  },
}

local session_metatable = {
  __index = function(session, key)
    return implementations[plugin].get(session, key)
  end,
}

local M = {}

function M.load(filename)
  if vim.o.filetype == 'dashboard' then
    vim.cmd [[
      if exists('#dashboard-nvim')
        autocmd! dashboard-nvim
        augroup! dashboard-nvim
      endif
    ]]
    vim.api.nvim_input '<Esc>:bd<CR>'
  end

  implementations[plugin].load(filename)
end

function M.list()
  local sessions = implementations[plugin].list()
  return vim.tbl_map(function(session)
    setmetatable(session, session_metatable)
    return session
  end, sessions or {})
end

-- returns last `count` sessions sorted by last modified
---@param count number defaults to 10
function M.last(count)
  local function comparator(a, b)
    local date_a = vim.fn.getftime(a.filename)
    local date_b = vim.fn.getftime(b.filename)
    if date_a == date_b then
      return a.name < b.name
    end
    return date_a > date_b
  end

  count = count or 10

  local sessions = M.list()
  table.sort(sessions, comparator)
  count = math.min(count, #sessions)

  local last_sessions = {}
  for i = 1, count do
    table.insert(last_sessions, sessions[i])
  end
  return last_sessions
end

M.is_session = implementations[plugin].is_session

return M
