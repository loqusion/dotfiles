local options = require 'core.options'

local keymap = {}

---@alias MapMode string|table<number, string>

---@class MapOptsWithoutMode
---@field prefix? string prepended to every mapping
---@field buffer? number default `nil`
---@field silent? boolean default `true`
---@field remap? boolean default `false` unless `<Plug> included in mapping`
---@field nowait? boolean default `false`
---@field use_whichkey? boolean default `true`
---@field desc? string ignored; may be used in the future

---@class MapOpts : MapOptsWithoutMode
---@field mode? MapMode

---@class WhichkeyOpts
---@field mode? string
---@field prefix? string
---@field buffer? number default `nil`
---@field silent? boolean default `true`
---@field noremap? boolean default `true` unless `<Plug>` included in mapping
---@field nowait? boolean default `false`

local function to_whichkey_opts(opts)
  if opts == nil or next(opts) == nil then
    return {}
  end

  -- need this to avoid async issues
  local opts_clone = vim.deepcopy(opts)
  if opts.remap ~= nil then
    opts_clone.noremap = not opts.remap
  end
  opts_clone.desc = nil
  opts_clone.use_whichkey = nil
  return opts_clone
end

local function to_native_opts(opts)
  if opts == nil or next(opts) == nil then
    return {}
  end

  local opts_clone = vim.deepcopy(opts)
  if opts.noremap ~= nil and opts.remap == nil then
    opts.remap = not opts.noremap
  end
  opts_clone.noremap = nil
  opts_clone.prefix = nil
  opts_clone.use_whichkey = nil
  opts_clone.mode = nil
  return opts_clone
end

local function native_map(mappings, opts, prefix)
  prefix = prefix or ''
  for key, reg in pairs(mappings) do
    if key == 'name' then goto continue end
    if #reg >= 2 then
      local mode = reg.mode or opts.mode or 'n'
      local merged_opts = to_native_opts(opts)
      for k, opt in pairs(reg) do
        if type(k) ~= 'number' and k ~= 'mode' then
          merged_opts[k] = opt
        end
      end
      if reg[2] ~= 'which_key_ignore' then
        merged_opts.desc = reg[2]
      end
      vim.keymap.set(mode, prefix .. key, reg[1], merged_opts)
    elseif #reg == 0 then
      native_map(reg, opts, prefix .. key)
    end
    ::continue::
  end
end

---@param msg string
---@param mode MapMode
---@param lhs string
---@param rhs string|function
---@param opts? MapOptsWithoutMode
function keymap.map(msg, mode, lhs, rhs, opts)
  opts = opts or {}
  if options.disable_whichkey or opts.use_whichkey == false then
    opts = to_native_opts(opts)
    opts.desc = msg
    vim.keymap.set(mode, lhs, rhs, opts)
    return
  end

  ---@cast opts WhichkeyOpts
  opts = to_whichkey_opts(opts)
  local modes = type(mode) == 'table' and mode or { mode }

  for _, _mode in ipairs(modes) do
    opts.mode = _mode
    require('which-key').register({ [lhs] = { rhs, msg } }, opts)
  end
end

---@param mappings table
---@param opts? MapOpts
function keymap.maps(mappings, opts, use_whichkey)
  opts = opts or {}
  if options.disable_whichkey or opts.use_whichkey == false or use_whichkey == false then
    native_map(mappings, opts)
    return
  end

  ---@cast opts WhichkeyOpts
  opts = to_whichkey_opts(opts)
  local modes = type(opts.mode) == 'table' and opts.mode or { opts.mode or 'n' }

  for _, mode in ipairs(modes) do
    opts.mode = mode
    require('which-key').register(mappings, opts)
  end
end

function keymap.reset()
  require('which-key').reset()
end

return keymap
