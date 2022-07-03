-- https://gthub.com/mizlan/iswap.nvim

local M = {}

function M.setup()
  M.register_global_keys()
end

function M.config()
  local ok, m = pcall(require, 'iswap')
  if not ok then
    vim.notify(
      string.format('Failed to load config %s: %s', require('utils.api.path').current_filename(true), m),
      vim.log.levels.ERROR
    )
    return
  end

  M.iswap = m
  M.iswap.setup()
end

function M.register_global_keys()
  require('crows').key.map('Swap two fields interactively', 'n', '<Leader>sp', '<Cmd>ISwap<CR>')
end

return M
