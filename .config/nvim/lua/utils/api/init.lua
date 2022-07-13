local api = {
  env = require 'utils.api.env',
  yabai = require 'utils.api.yabai',
  path = require 'utils.api.path',
}

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
      vim.notify(
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
