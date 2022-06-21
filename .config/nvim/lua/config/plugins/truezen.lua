-- https://github.com/Pocco81/TrueZen.nvim

local M = {}

function M.setup() end

function M.config()
  local key = require('crows').key
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

  for _, mode in ipairs { 'n', 'x' } do
    key.map('True Zen: Ataraxis', mode, '<localleader>z', '<cmd>TZAtaraxis<cr>')
  end
end

return M
