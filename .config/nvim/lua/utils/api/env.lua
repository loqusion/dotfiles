local M = {}

function M.is_child_session()
  return vim.env.NVIM_IS_CHILD_SESSION == 'true'
end

function M.is_ssh_session()
  local ssh_env = vim.env.SSH_CLIENT or vim.env.SSH_TTY or ''
  return #ssh_env ~= 0
end

function M.is_yabai_manually_disabled()
  return vim.env.NVIM_DISABLE_YABAI_TOGGLE
end

function M.init()
  if vim.env.NVIM_IS_PARENT_OPEN then
    vim.env.NVIM_IS_CHILD_SESSION = true
  else
    vim.env.NVIM_IS_PARENT_OPEN = true
    vim.env.NVIM_IS_CHILD_SESSION = false
  end
end

return M
