local feat = {}

---@class Feature
---@field pre? function config not depend on plugin
---@field plugins? PluginSpec[]
---@field post? function config depend on plugin

---@class FeatureWithUse : Feature
---@field use function(plugins:PluginSpec)->nil syntactic sugar for `feat.plugins[#feat.plugins+1] = <plugin_spec>`

---specs consisting of a table of exactly 1 table must be flattened
---@param spec PluginSpec
local function is_unsupported_multispec(spec)
  if type(spec) ~= 'table' then
    return false
  end
  for i, v in pairs(spec) do
    if i ~= 1 or type(v) ~= 'table' then
      return false
    end
  end
  return true
end

---@param feat Feature
local function create_use(feat)
  ---@param plugin_spec PluginSpec
  return function(plugin_spec)
    if is_unsupported_multispec(plugin_spec) then
      plugin_spec = plugin_spec[1]
    end
    feat.plugins[#feat.plugins + 1] = plugin_spec
  end
end

---@param plugins? PluginSpec[]
---@return FeatureWithUse
function feat.new(plugins)
  local ret = { plugins = plugins or {} }
  ret.use = create_use(ret)
  return ret
end

return feat
