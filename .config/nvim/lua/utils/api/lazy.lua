-- source: https://github.com/sindrets/dotfiles/blob/master/.config/nvim/lua/nvim-config/lazy.lua

local lazy = {}

---@class LazyModule : { [string] : any }
---@field __get fun(): any Load the module if needed, and return it.

local function wrap(t, handler)
  local use_handler = type(handler) == 'function'
  local export = not use_handler and t or nil

  local function __get()
    if not export and use_handler then
      ---@cast handler function
      export = handler(t)
    end
    return export
  end

  return setmetatable({}, {
    __index = function(_, key)
      if key == '__get' then
        return __get
      end
      return __get()[key]
    end,
    __newindex = function(_, key, value)
      __get()[key] = value
    end,
    __call = function(_, ...)
      return __get()(...)
    end,
    __get = __get,
  })
end

local function deref(tbl, access_path)
  local thing = tbl
  local keys = vim.split(access_path, '.', { plain = true })
  for _, key in ipairs(keys) do
    thing = thing[key]
  end
  return thing
end

---Will only require the module after first either indexing, or calling it.
---
---You can pass a handler function to process the module in some way before
---returning it. This is useful e.g. if you're trying to require the result of
---an exported function.
---
---Example:
---
---```lua
--- local foo = require('bar')
--- local foo = lazy.require('bar')
---
--- local foo = require('bar').baz({ qux = true })
--- local foo = lazy.require('bar', function(module)
---   return module.baz({ qux = true })
--- end)
---```
---@param require_path string
---@param handler? fun(module: any): any
---@return LazyModule
function lazy.require(require_path, handler)
  local use_handler = type(handler) == 'function'

  return wrap(require_path, function(s)
    if use_handler then
      ---@cast handler function
      return handler(require(s))
    end
    return require(s)
  end)
end

---Lazily access a table value. The `access_path` is a `.` separated string of
---table keys. If `x` is a string, it's treated as a lazy require.
---
---Example:
---
---```lua
--- -- table:
--- local foo = bar.baz.qux.quux
--- local foo = lazy.access(bar, "baz.qux.quux")
---
--- -- require:
--- local foo = require("bar").baz.qux.quux
--- local foo = lazy.access("bar", "baz.qux.quux")
---```
---@param x table|string Either the table to be accessed, or a module require path.
---@param access_path string
---@return LazyModule
function lazy.access(x, access_path)
  local handler = function(module)
    return deref(module, access_path)
  end

  if type(x) == 'string' then
    return lazy.require(x, handler)
  else
    return wrap(x, handler)
  end
end

---Only requires module when the returned function is called.
---Pass additional arguments for currying.
---@param modname string module name
---@param fname string|nil pass `nil` to use default export
function lazy.fn(modname, fname, ...)
  local default_args = { ... }
  return function(...)
    local args = vim.list_extend(default_args, { ... })
    local mod = require(modname)
    local fn = fname and deref(mod, fname) or mod
    return fn(unpack(args))
  end
end

return lazy