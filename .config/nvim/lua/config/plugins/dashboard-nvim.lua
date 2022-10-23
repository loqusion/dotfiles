-- https://github.com/glepnir/dashboard-nvim

local api = require 'utils.api'

local M = {
  safe_requires = {
    { 'dashboard', 'db' },
  },
  session_count = 5,
  filetype = 'dashboard',
}

function M.setup() end

function M.config()
  ---@diagnostic disable-next-line: missing-parameter
  M.db.session_directory = vim.fn.expand(vim.fn.stdpath 'data' .. '/sessions/')
  M.db.custom_header = require('config.dashboard.headers').animegirl2
  local ok, custom_center = pcall(M.custom_center)
  if ok then
    M.db.custom_center = custom_center
  else
    api.notify(custom_center, vim.log.levels.ERROR)
  end

  M.register_filetype_keys()
  M.dumb_workaround()
end

function M.custom_center()
  local custom_center = {}
  local last_sessions = api.sessions.last(M.session_count)
  for _, session in ipairs(last_sessions) do
    table.insert(custom_center, {
      icon = '',
      desc = ' ' .. session.name,
      action = ('lua require("utils.api.sessions").load("%s")'):format(session.file_path),
    })
  end
  return custom_center
end

local function get_entry_under_cursor()
  local current_line = vim.api.nvim_get_current_line()
  local current_entry
  for _, entry in ipairs(M.db.custom_center) do
    local trimmed_desc = vim.trim(entry.desc)
    if current_line:find(vim.pesc(trimmed_desc)) ~= nil then
      current_entry = entry
    end
  end
  return current_entry
end

local function delete_session_under_cursor()
  api.notify('Searching for session...', vim.log.levels.INFO)
  local entry = get_entry_under_cursor()
  if not entry then
    api.notify('Failed to get session under cursor', vim.log.levels.ERROR)
    api.notify(vim.inspect(M.db.custom_center), vim.log.levels.INFO)
    return
  end
  api.notify(vim.inspect(entry), vim.log.levels.INFO)
  local path = entry.file_path

  vim.ui.input({
    prompt = ('Delete [%s]?: '):format(path),
  }, function(response)
    if response == 'y' then
      vim.fn.delete(vim.fn.expand(path))
    end
  end)
end

function M.register_filetype_keys()
  local group = vim.api.nvim_create_augroup('custom-dashboard', {})
  vim.api.nvim_create_autocmd('FileType', {
    pattern = M.filetype,
    callback = function()
      require('crows').key.maps({
        dd = { delete_session_under_cursor, 'Delete session under cursor' },
      }, { buffer = true })
    end,
    group = group,
  })
end

function M.dumb_workaround()
  vim.api.nvim_create_autocmd('VimEnter', {
    pattern = '*',
    once = true,
    callback = function()
      require('config.plugins.persisted').register_global_commands()
    end,
  })
end

return M
