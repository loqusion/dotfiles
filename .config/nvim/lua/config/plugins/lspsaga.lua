-- https://github.com/glepnir/lspsaga.nvim

local options = require 'core.options'

local M = {
  safe_requires = {
    'lspsaga',
  },
}

function M.setup()
  M.register_global_keys()
end

function M.config()
  M.lspsaga.init_lsp_saga {
    finder_request_timeout = 99999,
    symbol_in_winbar = {
      enable = true,
    },
    border_style = options.border_style,
  }
end

function M.register_global_keys()
  if options.prefer_lspsaga then
    local lazy = require 'crows.lazy'
    local key = require 'crows.keymap'

    -- taken from core/mappings.lua
    local ctrl_f =
      [[<Cmd>exe 'normal! ' .. max([winheight(0) - 2, 1]) .. "\<C-e>" .. (line('w$') >= line('$') ? 'L' : 'M')<CR>]]
    local ctrl_b =
      [[<Cmd>exe 'normal! ' .. max([winheight(0) - 2, 1]) .. "\<C-y>" .. (line('w0') <= 1 ? 'H' : 'M')<CR>]]

    key.maps({
      gD = { vim.lsp.buf.declaration, 'Goto declaration' },
      gd = { vim.lsp.buf.definition, 'Goto definition' },
      gI = { vim.lsp.buf.implementation, 'Goto implementation' },
      ['<leader>D'] = { vim.lsp.buf.type_definition, 'Goto type definition' },
      ['<C-f>'] = { lazy.fn('lspsaga.action', 'smart_scroll_with_saga', 1, ctrl_f), 'Scroll down' },
      ['<C-b>'] = { lazy.fn('lspsaga.action', 'smart_scroll_with_saga', -1, ctrl_b), 'Scroll up' },
      gh = { '<Cmd>Lspsaga hover_doc<CR>', 'Hover doc' },
      gr = { '<Cmd>Lspsaga lsp_finder<CR>', 'Display hover information' },
      ['<Leader>r'] = { '<Cmd>Lspsaga rename<CR>', 'Rename' },
      ['<Leader><Leader>'] = { '<Cmd>Lspsaga code_action<CR>', 'Code action' },
      [']d'] = { '<Cmd>Lspsaga diagnostic_jump_next<CR>', 'Go to next diagnostic' },
      ['[d'] = { '<Cmd>Lspsaga diagnostic_jump_prev<CR>', 'Go to previous diagnostic' },
      ['<Leader>ld'] = { '<Cmd>Lspsaga show_line_diagnostics<CR>', 'Show line diagnostics' },
      ['<Leader>cd'] = { '<Cmd>Lspsaga show_cursor_diagnostics<CR>', 'Show cursor diagnostics' },
    }, { silent = true })
    key.maps({
      ['<Leader><Leader>'] = { '<Cmd>Lspsaga range_code_action<CR>', 'Code action' },
    }, { silent = true, mode = 'v' })
  end
end

return M
