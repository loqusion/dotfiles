local api = {
  env = require 'utils.api.env',
  lazy = require 'utils.api.lazy',
  lsp = require 'utils.api.lsp',
  --map = require 'utils.api.map',
  path = require 'utils.api.path',
  sessions = require 'utils.api.sessions',
  yabai = require 'utils.api.yabai',
}

-- Display a notification to the user.
--- @param msg any #string Content of the notification to show to the user.
--- @param level any #number|nil One of the values from `vim.log.levels`.
--- @param opts any #table|nil Optional parameters. Unused by default.
function api.notify(msg, level, opts)
  local ok, notify = pcall(require, 'notify')
  if ok then
    notify(msg, level, opts)
  else
    vim.notify(msg, level, opts)
  end
end

-- safely load all dependent plugins
function api.safe_load(M)
  if not M.safe_requires then
    return true
  end

  for _, plugin_identifier in ipairs(M.safe_requires) do
    local load_name, plug_name
    if type(plugin_identifier) == 'table' then
      load_name = plugin_identifier[1]
      plug_name = plugin_identifier[2] or load_name
    else
      load_name = plugin_identifier
      plug_name = plugin_identifier
    end

    local ok, plugin = pcall(require, load_name)
    if not ok then
      api.notify(
        string.format('Failed to load config %s: %s', api.path.current_filename(false), plugin),
        'WARN',
        { title = 'plugin' }
      )
      return nil
    end

    M[plug_name] = plugin
  end
  return true
end

return api
