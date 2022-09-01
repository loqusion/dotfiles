local path = {}

--[[
Join paths together.

```lua
utils.path.join('/foo', 'bar')
-- '/foo/bar'
```
--]]
function path.join(...)
  return table.concat(vim.tbl_flatten { ... }, '/')
end

--[[
Check if a path exists.

```lua
utils.path.is_exists('/foo/bar')
-- true
```
--]]
function path.is_exists(p)
  return vim.fn.filereadable(p) == 1
end

--[[
Get current filename.

Pass `true` to get the full path.
--]]
function path.current_filename(should_get_full_path)
  should_get_full_path = should_get_full_path or false
  local info = debug.getinfo(2, 'S')
  local file = info.source
  if should_get_full_path then
    return file:match '^@*([^@]*)$'
  else
    return file:match '[^/]*.lua$'
  end
end

---@param moddirname string directory containing modules (separated by `.`)
---@param glob? string defualt is `'*.lua'`
---@param root_dir? string path containing `moddirname`
---@return table
function path.require_recursive(moddirname, glob, root_dir, exclude)
  if glob == nil then
    glob = '*.lua'
  end
  if root_dir == nil then
    root_dir = path.join(vim.fn.stdpath 'config', 'lua')
  end
  if exclude == nil then
    exclude = 'init'
  end
  local ret = {}

  local moddirpath = string.gsub(moddirname, '%.', '/')
  local full_modpath = path.join(root_dir, moddirpath)

  ---@diagnostic disable-next-line: param-type-mismatch
  local file_list = vim.fn.globpath(full_modpath, glob, false, true)

  for _, file in ipairs(file_list) do
    local modname = vim.fn.fnamemodify(file, ':t:r')
    if modname ~= exclude then
      local full_modname = path.join(moddirname, modname)
      local ok, mod = pcall(require, full_modname)
      if ok then
        ret[modname] = mod
      else
        require('utils.api').notify(
          string.format('Error requiring %s in %s: %s', modname, moddirname, mod),
          vim.log.levels.ERROR
        )
      end
    end
  end

  return ret
end

return path
