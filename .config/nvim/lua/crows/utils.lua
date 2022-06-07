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

---returns function that `require`s `'modname'.fn` just before it's called
---@param modname string
---@param fn string
---@vararg any passed to fn
function utils.lazy_require(modname, fn, ...)
  local default_args = { ... }
  ---@vararg any passed to fn
  return function(...)
    local arg = { ... }
    local all_args = vim.tbl_deep_extend('keep', arg, default_args)
    return require(modname)[fn](unpack(all_args))
  end
end

return utils
