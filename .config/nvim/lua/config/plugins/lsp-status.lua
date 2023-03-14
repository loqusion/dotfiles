-- https://github.com/nvim-lua/lsp-status.nvim

local M = {
  safe_requires = {
    { 'lsp-status', 'lsp_status' },
  },
}

function M.setup() end

function M.config()
  M.lsp_status.config {
    indicator_errors = 'E',
    indicator_warnings = 'W',
    indicator_info = 'i',
    indicator_hint = '?',
    indicator_ok = 'Ok',
    select_symbol = function(cursor_pos, symbol)
      if symbol.valueRange then
        local value_range = {
          ['start'] = { character = 0, line = vim.fn.byte2line(symbol.valueRange[1]) },
          ['end'] = { character = 0, line = vim.fn.byte2line(symbol.valueRange[2]) },
        }

        return require('lsp-status/util').in_range(cursor_pos, value_range)
      end
    end,
    current_function = false,
  }
  M.lsp_status.register_progress()
  require('utils.aux.lsp').add_on_attach(function(client, _)
    require('lsp_status').on_attach(client)
  end)
end

return M
