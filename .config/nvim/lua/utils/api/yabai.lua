local nvim_env = require 'utils.api.env'

local M = {}

local function should_toggle_yabai()
  return not (nvim_env.is_yabai_manually_disabled() or nvim_env.is_child_session() or nvim_env.is_ssh_session())
end

function M.float(action)
  if should_toggle_yabai() then
    vim.cmd([[silent !yabai-float ]] .. action)
  end
end

function M.float_on()
  M.float 'on'
end

function M.float_off()
  M.float 'off'
end

return M
