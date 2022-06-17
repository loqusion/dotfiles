local format = require('crows.utils').new_feat()
local lazy = require 'crows.lazy'

format.by_formatter = {}
format.by_lsp = {}

format.formatters = {
  goimports = function()
    return {
      exe = 'goimports',
      args = { '-w' },
      stdin = false,
    }
  end,
  prettier = lazy.fn 'formatter.defaults.prettier',
  python = lazy.fn('formatter.defaults.python', 'yapf'),
  rustfmt = function()
    return {
      exe = 'rustfmt',
      args = { '--emit=stdout' },
      stdin = true,
    }
  end,
  stylua = lazy.fn('formatter.filetypes.lua', 'stylua'),
}

format.use {
  -- 'mhartington/formatter.nvim',
  '~/Projects/formatter.nvim',
  config = function()
    local fmt = require 'plugins.format'
    require('formatter').setup {
      filetype = fmt.by_formatter,
    }
    local group = vim.api.nvim_create_augroup('FormatAutogroup', {})
    vim.api.nvim_create_autocmd('BufWritePost', {
      group = group,
      pattern = '*',
      command = 'FormatWrite',
    })
    if #fmt.by_lsp ~= 0 then
      vim.api.nvim_create_autocmd('BufWritePost', {
        group = group,
        pattern = table.concat(fmt.by_lsp, ','),
        callback = vim.lsp.buf.formatting_seq_sync,
      })
    end
  end,
}

return format
