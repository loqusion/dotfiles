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

---returns function which executes `require(modname)[fnname](unpack(args))`
---@param modname string
---@param fnname string
---@vararg any passed to fn
function utils.lazy_require(modname, fnname, ...)
  local default_args = arg
  ---@vararg any passed to fn
  return function(...)
    local num_args = arg.n + default_args.n
    local all_args = vim.tbl_deep_extend('keep', { n = num_args }, arg, default_args)
    if num_args == 0 then
      return require(modname)[fnname]()
    end
    return require(modname)[fnname](unpack(all_args))
  end
end

return utils
