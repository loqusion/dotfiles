local utils = {}

---@class Feature
---@field pre? function config not depend on plugin
---@field plugins? PluginSpec[]
---@field post? function config depend on plugin

---@class FeatureWithUse : Feature
---@field use function(plugins:PluginSpec)->nil syntactic sugar for `feat.plugins[#feat.plugins+1] = <plugin_spec>`

---@param feat Feature
local function create_use(feat)
  ---@param plugin_spec PluginSpec
  return function(plugin_spec)
    feat.plugins[#feat.plugins + 1] = plugin_spec
  end
end

---@param plugins? PluginSpec[]
---@return FeatureWithUse
function utils.new_feat(plugins)
  local ret = { plugins = plugins or {} }
  ret.use = create_use(ret)
  return ret
end

return utils
