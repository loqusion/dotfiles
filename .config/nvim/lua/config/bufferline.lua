local bufferline = require 'bufferline'
local map = vim.keymap.set

bufferline.setup {
  options = {
    always_show_bufferline = false,
    right_mouse_command = '',
    diagnostics = 'nvim_lsp',
    seperator_style = 'thin',
    show_buffer_close_icons = false,
    show_close_icon = false,
  },
}

map('n', 'gb', '<cmd>BufferLinePick<cr>', { silent = true, nowait = true })
