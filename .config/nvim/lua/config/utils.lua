local M = {}

---@param name string
function M.augroup(name)
  return vim.api.nvim_create_augroup("loqusion_" .. name, { clear = false })
end

function M.is_ssh()
  return (vim.env.SSH_CLIENT or vim.env.SSH_TTY) ~= nil
end

---@param plugin string
function M.has(plugin)
  return require("lazy.core.config").plugins[plugin] ~= nil
end

return M
