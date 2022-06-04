local map = vim.keymap.set
local true_zen = require('true-zen')

true_zen.setup {
  integrations = {
    -- lualine = true,
    -- twilight = true,
    gitsigns = true,
  },
}

true_zen.after_mode_ataraxis_on = function()
  vim.wo.list = false
end

map({ 'n', 'x' }, '<localleader>z', '<cmd>TZAtaraxis<cr>')
