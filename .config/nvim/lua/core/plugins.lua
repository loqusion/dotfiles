local api = require 'utils.api'

local plugins = {}

local mods = api.path.require_recursive 'plugins'
for path, mod in pairs(mods) do
  local kind = path
  plugins[kind] = mod.plugins
end

require('utils.aux.packer').entry(plugins)

return plugins
