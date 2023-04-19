local M = {}

function M.augroup(name)
  return vim.api.nvim_create_augroup("loqusion_" .. name, { clear = false })
end

function M.is_ssh()
  return (vim.env.SSH_CLIENT or vim.env.SSH_TTY) ~= nil
end

return M
