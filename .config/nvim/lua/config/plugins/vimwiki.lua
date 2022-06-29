-- https://github.com/vimwiki/vimwiki

local M = {}

function M.entrance()
  vim.g.vimwiki_list = {
    {
      path = '~/vimwiki/',
      syntax = 'markdown',
      ext = '.md',
    },
  }
  M.register_global_keys()
end

function M.register_global_keys()
  vim.keymap.set('n', '<leader>ww', '<Plug>VimwikiIndex')
end

return M
