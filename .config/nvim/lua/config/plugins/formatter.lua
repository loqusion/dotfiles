-- https://github.com/mhartington/formatter.nvim

local M = {}

function M.setup()
  -- M.register_autocmds()
  M.register_global_keys()
end

function M.config()
  local formatters = M.load_formatters()

  require('formatter').setup {
    filetype = formatters,
  }
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

function M.register_global_keys()
  local key = require('crows').key
  key.map('FormatWrite', 'n', '<Leader>f', ':Format<CR>')
  key.map('FormatWrite', 'n', '<Leader>F', ':FormatWrite<CR>')
end

function M.register_autocmds()
  local function refresh_highlighting()
    local winview = vim.fn.winsaveview()
    vim.cmd [[edit | TSBufEnable highlight]]
    vim.fn.winrestview(winview)
  end

  local group = vim.api.nvim_create_augroup('FormatAutogroup', {})
  vim.api.nvim_create_autocmd('BufWritePost', {
    group = group,
    pattern = '*',
    command = 'FormatWrite',
    desc = 'Format on save',
  })
  -- https://github.com/nvim-treesitter/nvim-treesitter#i-experience-weird-highlighting-issues-similar-to-78
  vim.api.nvim_create_autocmd('User', {
    group = group,
    pattern = 'FormatterPost',
    callback = refresh_highlighting,
    desc = 'Fix bug that messes up syntax',
  })
end

return M
