local lazy = require 'utils.api.lazy'
local nvim_env = lazy.require 'utils.api.env'
local options = lazy.require 'core.options'

local M = {}

local function number_of_windows()
  return tonumber(vim.fn.system 'yabai -m query --windows --space | jq length')
end

local function should_toggle_yabai()
  return not (
      options.disable_yabai_toggle
      or nvim_env.is_yabai_manually_disabled()
      or nvim_env.is_child_session()
      or nvim_env.is_ssh_session()
      or number_of_windows() > 1
    )
end

function M.float(action)
  if should_toggle_yabai() then
    vim.cmd([[silent !~/.config/yabai/scripts/float.sh ]] .. action)
  end
end

function M.float_on()
  M.float 'on'
end

function M.float_off()
  M.float 'off'
end

return M
