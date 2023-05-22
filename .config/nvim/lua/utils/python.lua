local M = {}

local util = require("lspconfig/util")
local path = util.path

---@param workspace string
---@return string|nil virtual_env
---@return string python
function M.get_path(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return vim.env.VIRTUAL_ENV, path.join(vim.env.VIRTUAL_ENV, "bin", "python")
  end

  do -- Find and use virtualenv via poetry in workspace directory.
    local match = vim.fn.glob(path.join(workspace, "poetry.lock"))
    if match ~= "" then
      local venv = vim.fn.trim(vim.fn.system("poetry env info -p"))
      return venv, path.join(venv, "bin", "python")
    end
  end

  -- Find and use virtualenv in workspace directory.
  for _, pattern in ipairs({ "*", ".*" }) do
    local match = vim.fn.glob(path.join(workspace, pattern, "pyvenv.cfg"))
    if match ~= "" then
      local venv = path.dirname(match)
      return venv, path.join(venv, "bin", "python")
    end
  end

  -- Fallback to system Python.
  return nil, vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
end

return M
