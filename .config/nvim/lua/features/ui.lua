local ui = require('crows.utils').new_feat()

ui.use {
  'Pocco81/TrueZen.nvim',
  config = function()
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
      key.map('thing', mode, '<localleader>z', '<cmd>TZAtaraxis<cr>')
    end
  end,
}

ui.use {
  -- 'folke/twilight.nvim',
  'loqusion/twilight.nvim', -- Use this one until https://github.com/folke/twilight.nvim/issues/15 is resolved
  setup = function()
    local key = require('crows').key
    for _, mode in ipairs { 'n', 'x' } do
      key.map('Toggle dim text', mode, '<localleader>t', '<cmd>Twilight<cr>')
    end
  end,
}

return ui
