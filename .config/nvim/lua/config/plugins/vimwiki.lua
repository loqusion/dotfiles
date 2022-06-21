-- https://github.com/vimwiki/vimwiki

local M = {}

function M.setup()
  vim.keymap.set('n', '<leader>ww', '<plug>VimwikiIndex')
  vim.g.vimwiki_list = {
    {
      path = '~/vimwiki/',
      syntax = 'markdown',
      ext = '.md',
    },
  }
  vim.cmd [[autocmd MyAutoCmd FileType vimwiki setlocal nolist concealcursor=]]
end

return M
