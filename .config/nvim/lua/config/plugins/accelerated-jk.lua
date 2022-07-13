-- https://github.com/rhysd/accelerated-jk

local M = {}

function M.entrance()
  M.register_global_keys()
end

function M.register_global_keys()
  vim.keymap.set('n', 'j', '<Plug>(accelerated_jk_gj)', { silent = true })
  vim.keymap.set('n', 'k', '<Plug>(accelerated_jk_gk)', { silent = true })
end

return M
