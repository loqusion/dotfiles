-- https://github.com/nanozuki/tabby.nvim

local M = {
  safe_requires = {
    'tabby',
  },
}

function M.setup()
  M.register_global_keys()
end

function M.config()
  M.tabby.setup()
end

function M.register_global_keys()
  require('utils.api').key.maps {
    ['<leader>t'] = {
      c = { '<Cmd>$tabnew<CR>', 'Create new tab' },
      x = { '<Cmd>tabclose<CR>', 'Close current tab' },
      o = { '<Cmd>tabonly<CR>', 'Close other tabs' },
      n = { '<Cmd>tabnext<CR>', 'Goto next tab' },
      p = { '<Cmd>tabprev<CR>', 'Goto prev tab' },
      N = { '<Cmd>+tabmove<CR>', 'Move current tab to next position' },
      P = { '<Cmd>-tabmove<CR>', 'Move current tab to previous position' },
    },
  }
end

return M
