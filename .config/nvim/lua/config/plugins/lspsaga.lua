-- https://github.com/glepnir/lspsaga.nvim

local options = require 'core.options'

local M = {
  safe_requires = {
    'lspsaga',
  },
  has_v0_8 = vim.fn.has 'nvim-0.8' ~= 0,
}

function M.setup() end

function M.config()
  M.lspsaga.setup {
    finder_request_timeout = 99999,
    code_action_lightbulb = {
      sign = false,
    },
    symbol_in_winbar = {
      enable = M.has_v0_8,
    },
    border_style = options.border_style,
  }
  M.register_global_keys()
end

function M.register_global_keys()
  if options.prefer_lspsaga then
    local key = require 'crows.keymap'

    key.maps({
      gD = { vim.lsp.buf.declaration, 'Goto declaration' },
      gd = { vim.lsp.buf.definition, 'Goto definition' },
      gI = { vim.lsp.buf.implementation, 'Goto implementation' },
      ['<leader>D'] = { vim.lsp.buf.type_definition, 'Goto type definition' },
      gh = { '<Cmd>Lspsaga hover_doc<CR>', '[Lspsaga] Hover doc' },
      gr = { '<Cmd>Lspsaga lsp_finder<CR>', '[Lspsaga] Display hover information' },
      ['<Leader>r'] = { '<Cmd>Lspsaga rename<CR>', '[Lspsaga] Rename' },
      ['<Leader><Leader>'] = { '<Cmd>Lspsaga code_action<CR>', '[Lspsaga] Code action' },
      [']d'] = { '<Cmd>Lspsaga diagnostic_jump_next<CR>', '[Lspsaga] Go to next diagnostic' },
      ['[d'] = { '<Cmd>Lspsaga diagnostic_jump_prev<CR>', '[Lspsaga] Go to previous diagnostic' },
      ['<Leader>ld'] = { '<Cmd>Lspsaga show_line_diagnostics<CR>', '[Lspsaga] Show line diagnostics' },
      ['<Leader>cd'] = { '<Cmd>Lspsaga show_cursor_diagnostics<CR>', '[Lspsaga] Show cursor diagnostics' },
    }, { silent = true })
    key.maps({
      ['<Leader><Leader>'] = { '<Cmd>Lspsaga range_code_action<CR>', '[Lspsaga] Code action' },
    }, { silent = true, mode = 'v' })
  end
end

return M
