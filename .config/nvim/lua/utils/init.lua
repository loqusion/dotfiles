local M = {}

function M.augroup(name)
  return vim.api.nvim_create_augroup("loqusion_" .. name, { clear = false })
end

function M.is_ssh()
  return (vim.env.SSH_CLIENT or vim.env.SSH_TTY) ~= nil
end

function M.load_dirsession(opts)
  local lutil = require("lazyvim.util")
  if lutil.has("persistence.nvim") then
    require("persistence").load()
  elseif lutil.has("resession.nvim") then
    opts = vim.tbl_deep_extend("force", opts or {}, { silence_errors = true })
    require("resession").load(lutil.get_root(), opts)
  else
    vim.notify("Failed to load session; session plugin not found", vim.log.levels.ERROR)
  end
end

return M
