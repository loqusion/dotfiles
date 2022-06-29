-- https://github.com/rhysd/accelerated-jk

local M = {}

function M.setup() end

function M.config()
  M.register_global_keys()
  -- default man ftplugin maps j and k
  vim.g.no_man_maps = 1
end

function M.register_global_keys()
  vim.keymap.set('n', 'j', '<Plug>(accelerated_jk_gj)', { silent = true })
  vim.keymap.set('n', 'k', '<Plug>(accelerated_jk_gk)', { silent = true })
end

return M
