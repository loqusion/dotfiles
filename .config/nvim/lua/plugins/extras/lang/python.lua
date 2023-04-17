local util = require("lspconfig/util")
local path = util.path

---@param workspace string
local function get_python_path(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
  end

  do -- Find and use virtualenv via poetry in workspace directory.
    local match = vim.fn.glob(path.join(workspace, "poetry.lock"))
    if match ~= "" then
      local venv = vim.fn.trim(vim.fn.system("poetry env info -p"))
      return path.join(venv, "bin", "python")
    end
  end

  -- Find and use virtualenv in workspace directory.
  for _, pattern in ipairs({ "*", ".*" }) do
    local match = vim.fn.glob(path.join(workspace, pattern, "pyvenv.cfg"))
    if match ~= "" then
      return path.join(path.dirname(match), "bin", "python")
    end
  end

  -- Fallback to system Python.
  return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
end

return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    servers = {
      pyright = {
        before_init = function(_, config)
          config.settings.python.pythonPath = get_python_path(config.root_dir)
          vim.notify(config.settings.python.pythonPath)
        end,
      },
    },
  },
}
