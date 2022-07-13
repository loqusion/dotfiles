-- https://gthub.com/mizlan/iswap.nvim

local M = {
  safe_requires = {
    'iswap'
  }
}

function M.setup()
  M.register_global_keys()
end

function M.config()
  M.iswap.setup()
end

function M.register_global_keys()
  require('crows').key.map('Swap two fields interactively', 'n', '<Leader>sp', '<Cmd>ISwap<CR>')
end

return M
