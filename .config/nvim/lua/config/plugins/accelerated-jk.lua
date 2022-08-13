-- https://github.com/rhysd/accelerated-jk

local M = {}

function M.entrance()
  M.register_global_keys()
end

function M.register_global_keys()
  vim.keymap.set('n', 'j', '<Plug>(accelerated_jk_gj)', { silent = true })
  vim.keymap.set('n', 'k', '<Plug>(accelerated_jk_gk)', { silent = true })

  local group = vim.api.nvim_create_augroup('custom-accelerated-jk', {})
  vim.api.nvim_create_autocmd('SourcePre', {
    pattern = '*/autoload/accelerated/time_driven.vim',
    callback = function()
      vim.keymap.set(
        'n',
        '<Plug>(accelerated_jk_gj)',
        "<Cmd>call accelerated#time_driven#command('gj')<CR>",
        { silent = true, remap = true }
      )
      vim.keymap.set(
        'n',
        '<Plug>(accelerated_jk_gk)',
        "<Cmd>call accelerated#time_driven#command('gk')<CR>",
        { silent = true, remap = true }
      )
    end,
    once = true,
    group = group,
  })
end

return M
