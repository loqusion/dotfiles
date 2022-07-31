local terminal = require('crows.utils').new_feat()

terminal.use {
  'akinsho/toggleterm.nvim',
  config = true,
}

terminal.use {
  'sychen52/smart-term-esc.nvim',
  config = true,
}

return terminal
