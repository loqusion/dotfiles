local terminal = require('crows.utils').new_feat()

terminal.pre = function()
  vim.g.terminal_scrollback_buffer_size = 3000
end

terminal.use {
  'akinsho/toggleterm.nvim',
  config = true,
}

return terminal
