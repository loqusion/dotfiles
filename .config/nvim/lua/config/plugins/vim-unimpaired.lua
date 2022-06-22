-- https://github.com/tpope/vim-unimpaired

local M = {}

function M.config()
  if vim.v.vim_did_enter == 1 then
    M.unmap()
  else
    vim.api.nvim_create_autocmd('VimEnter', {
      pattern = '*',
      once = true,
      callback = function()
        M.unmap()
      end,
    })
  end

  M.register_global_keys()
end

function M.register_global_keys()
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

function M.unmap()
  if vim.fn.maparg('<s', 'n', false, false) ~= '' then
    local unmap = vim.keymap.del
    local keys = { '<s', '<s<Esc>', '<p', '<P', '>s', '>s<Esc>', '>p', '>P' }
    for _, key in ipairs(keys) do
      unmap('n', key)
    end
  end
end

return M
