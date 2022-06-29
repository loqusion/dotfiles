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

return path
