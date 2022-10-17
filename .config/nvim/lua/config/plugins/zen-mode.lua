-- https://github.com/folke/zen-mode.nvim

local M = {
  safe_requires = {
    { 'zen-mode', 'zen_mode' },
  },
  map_leader = '<LocalLeader>',
  saved_keymap_q = nil,
}

function M.setup()
  M.register_global_keys()
end

function M.config()
  M.zen_mode.setup {
    window = {
      options = {
        number = false,
        relativenumber = false,
        cursorline = true,
        list = false,
      }
    },
    plugins = {
      twilight = {
        enabled = false,
      },
    },
    on_open = M.save_and_replace_keymaps,
    on_close = M.restore_keymaps,
  }
end

function M.register_global_keys()
  require('crows').key.maps {
    [M.map_leader] = {
      z = { '<Cmd>silent ZenMode<CR>', 'Zen Mode' },
    },
  }
end

function M.register_buffer_keys(buffer)
  require('crows').key.maps({
    q = { '<Cmd>close<CR>', 'Close Zen window' },
  }, { buffer = buffer })
end

function M.save_and_replace_keymaps()
  M.saved_keymap_q = vim.fn.maparg('q', 'n', false, true)
  vim.api.nvim_set_keymap('n', 'q', '<Cmd>close<CR>', { silent = true })
end

function M.restore_keymaps()
  if M.saved_keymap_q then
    vim.fn.mapset('n', false, M.saved_keymap_q)
  end
end

return M
