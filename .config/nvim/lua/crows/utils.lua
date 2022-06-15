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

---returns function that requires a module just before it calls `'modname'.fname`
---pass additional arguments for currying
---@param modname string module name
---@param fname string pass `nil` to use default export
function utils.lazy_require(modname, fname, ...)
  local default_args = { ... }
  return function(...)
    local args = vim.list_extend(default_args, { ... })
    local mod = require(modname)
    local fn = fname and mod[fname] or mod
    return fn(unpack(args))
  end
end

return utils
