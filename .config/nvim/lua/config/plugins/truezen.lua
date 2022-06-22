-- https://github.com/Pocco81/TrueZen.nvim

local M = {}

function M.setup() end

function M.config()
  local true_zen = require 'true-zen'

  true_zen.setup {
    integrations = {
      gitsigns = true,
      lualine = false,
      twilight = false,
    },
  }

  true_zen.after_mode_ataraxis_on = function()
    vim.wo.list = false
  end

  M.register_global_keys()
end

function M.register_global_keys()
  local key = require('crows').key
  for _, mode in ipairs { 'n', 'x' } do
    key.map('True Zen: Ataraxis', mode, '<localleader>z', '<cmd>TZAtaraxis<cr>')
  end
end

return M
