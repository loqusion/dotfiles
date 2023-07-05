local M = {}

local util = require("lspconfig/util")
local path = util.path

---Get VIRTUAL_ENV from workspace.
---@param workspace string
---@return string|nil venv
function M.get_venv(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return vim.env.VIRTUAL_ENV
  end

  do -- Find and use virtualenv via poetry in workspace directory.
    local match = vim.fn.glob(path.join(workspace, "poetry.lock"))
    if match ~= "" then
      return vim.fn.trim(vim.fn.system("poetry env info -p"))
    end
  end

  -- Find and use virtualenv in workspace directory.
  for _, pattern in ipairs({ "*", ".*" }) do
    local match = vim.fn.glob(path.join(workspace, pattern, "pyvenv.cfg"))
    if match ~= "" then
      return path.dirname(match)
    end
  end

  return nil
end

--- Activate virtualenv in workspace and return path.
---@param workspace string
---@return string|nil venv
function M.activate_venv(workspace)
  local venv = M.get_venv(workspace)
  if venv and vim.env.VIRTUAL_ENV ~= venv then
    if vim.fn.executable(path.join(venv, "bin", "activate")) then
      vim.system({ "source", path.join(venv, "bin", "activate.fish") }, { timeout = 5000 }):wait()
    else
      vim.env.VIRTUAL_ENV = venv
    end
  end
  return venv
end

---Get python executable path.
---@param venv string|nil
---@return string python
function M.get_path(venv)
  if venv then
    return path.join(venv, "bin", "python")
  end
  return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
end

return M
