-- https://github.com/nanozuki/tabby.nvim

local M = {}

function M.setup() end

function M.config()
  M.register_global_keys()

  local ok, m = pcall(require, 'tabby')
  if not ok then
    vim.notify(
      string.format('Failed to load config %s', require('utils.api.path').current_filename(true)),
      vim.log.levels.ERROR
    )
    return
  end

  M.tabby = m
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
