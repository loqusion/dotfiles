local terminal = require('utils.api').feat.new()

terminal.use {
  'akinsho/toggleterm.nvim',
  config = true,
}

terminal.use {
  'sychen52/smart-term-esc.nvim',
  config = true,
}

return terminal
