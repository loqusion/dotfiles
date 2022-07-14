-- https://github.com/lukas-reineke/indent-blankline.nvim

local M = {
  safe_requires = {
    'indent_blankline',
  },
}

function M.config()
  M.indent_blankline.setup {
    buftype_exclude = { 'help', 'nofile', 'nowrite', 'quickfix', 'terminal', 'prompt' },
    space_char_blankline = ' ',
    show_current_context = true,
    show_current_context_start = true,
    use_treesitter = false,
  }
end

return M
