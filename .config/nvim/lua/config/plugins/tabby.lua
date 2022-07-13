-- https://github.com/nanozuki/tabby.nvim

local M = {
  safe_requires = {
    'tabby',
  },
}

function M.setup() end

function M.config()
  M.register_global_keys()

  M.tabby.setup()
end

function M.register_global_keys()
  require('crows').key.maps {
    ['<leader>t'] = {
      c = { '<Cmd>$tabnew<CR>', 'Create new tab' },
      x = { '<Cmd>tabclose<CR>', 'Close current tab' },
      o = { '<Cmd>tabonly<CR>', 'Close other tabs' },
      n = { '<Cmd>tabnext<CR>', 'Goto next tab' },
      p = { '<Cmd>tabprev<CR>', 'Goto prev tab' },
      m = {
        p = { '<Cmd>-tabmove<CR>', 'Move current tab to previous position' },
        n = { '<Cmd>+tabmove<CR>', 'Move current tab to next position' },
      },
    },
  }
end

return M
