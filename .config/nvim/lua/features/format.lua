local format = require('crows.utils').new_feat()

format.by_formatter = {}
format.by_lsp = {}

format.formatters = {
  prettier = function()
    return {
      exe = 'prettier',
      args = { '--stdin-filepath', vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
      stdin = true,
    }
  end,
  rustfmt = function()
    return {
      exe = 'rustfmt',
      args = { '--emit=stdout' },
      stdin = true,
    }
  end,
  stylua = function()
    return {
      exe = 'stylua',
      args = { '-' },
      stdin = true,
    }
  end,
  goimports = function()
    return {
      exe = 'goimports',
      args = { '-w' },
      stdin = false,
    }
  end,
}

format.use {
  'mhartington/formatter.nvim',
  config = function()
    local fmt = require 'features.format'
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
