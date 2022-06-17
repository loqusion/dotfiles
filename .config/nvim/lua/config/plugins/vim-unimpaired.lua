-- https://github.com/tpope/vim-unimpaired

local M = {}

function _G._unmap_unimpaired()
  if vim.fn.maparg('<s', 'n', false, false) ~= '' then
    local unmap = vim.keymap.del
    unmap('n', '<s')
    unmap('n', '<s<Esc>')
    unmap('n', '<p')
    unmap('n', '<P')
    unmap('n', '>s')
    unmap('n', '>s<Esc>')
    unmap('n', '>p')
    unmap('n', '>P')
  end
end

function M.config()
  if vim.v.vim_did_enter == 1 then
    _unmap_unimpaired()
  else
    vim.cmd [[autocmd VimEnter * ++once lua _unmap_unimpaired()]]
  end

  local defaults = {
    conceallevel = vim.go.conceallevel ~= 0 and vim.go.conceallevel or 2,
    laststatus = vim.go.laststatus ~= 0 and vim.go.laststatus or 3,
  }
  require('crows').key.maps({
    ['<Plug>(unimpaired-enable)'] = {
      a = { ':<C-U>set conceallevel=' .. defaults.conceallevel .. '<CR>', 'Enable conceallevel' },
      g = { ':<C-U>set laststatus=' .. defaults.laststatus .. '<CR>', 'Enable laststatus' },
    },
    ['<Plug>(unimpaired-disable)'] = {
      a = { ':<C-U>set conceallevel=0' .. '<CR>', 'Disable conceallevel' },
      g = { ':<C-U>set laststatus=0' .. '<CR>', 'Disable laststatus' },
    },
    ['<Plug>(unimpaired-toggle)'] = {
      a = {
        ':<C-U>set conceallevel=<C-R>=&conceallevel == 0 ? ' .. defaults.conceallevel .. ' : 0<CR><CR>',
        'Toggle conceallevel',
      },
      g = {
        ':<C-U>set laststatus=<C-R>=&laststatus == 0 ? ' .. defaults.laststatus .. ' : 0<CR><CR>',
        'Toggle laststatus',
      },
    },
  }, { silent = false })
end

return M
