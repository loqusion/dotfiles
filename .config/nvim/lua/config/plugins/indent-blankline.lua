-- https://github.com/lukas-reineke/indent-blankline.nvim

local M = {}

function M.setup() end

function M.config()
  require('indent_blankline').setup {
    buftype_exclude = { 'help', 'nofile', 'nowrite', 'quickfix', 'terminal', 'prompt' },
    show_current_context = true,
    show_current_context_start = true,
    use_treesitter = true,
  }
end

return M
