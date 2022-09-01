local api = require 'utils.api'

---@type Feature[]
local plugins = {}

local mods = api.path.require_recursive 'plugins'
for _, mod in pairs(mods) do
  table.insert(plugins, mod)
end

require('crows').setup {
  modules = { 'plugins' },
  features = plugins,
}

return plugins
