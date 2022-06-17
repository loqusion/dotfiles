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

return path
