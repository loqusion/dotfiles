-- https://github.com/mhartington/formatter.nvim

local M = {}

function M.setup() end

function M.config()
  local formatters = M.load_formatters()

  require('formatter').setup {
    filetype = formatters,
  }

  local group = vim.api.nvim_create_augroup('FormatAutogroup', {})
  vim.api.nvim_create_autocmd('BufWritePost', {
    group = group,
    pattern = '*',
    command = 'FormatWrite',
  })
end

function M.load_formatters()
  M.formatters = {}
  local languages = require 'config.languages'
  for _, language in pairs(languages) do
    if language.formatters then
      for filetype, formatter in pairs(language.formatters) do
        M.formatters[filetype] = formatter
      end
    end
  end
  return M.formatters
end

return M
