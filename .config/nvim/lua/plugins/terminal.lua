local terminal = require('crows.utils').new_feat()

terminal.pre = function()
  vim.g.terminal_scrollback_buffer_size = 3000
end

terminal.use {
  'akinsho/toggleterm.nvim',
  config = function()
    local key = require('crows').key

    require('toggleterm').setup {
      direction = 'float',
      border = 'shadow',
      shell = vim.fn.getenv 'SHELL',
      open_mapping = [[<c-\>]],
    }

    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new {
      cmd = 'lazygit',
      hidden = true,
      dir = 'git_dir',
      direction = 'float',
      float_opts = {
        border = 'double',
      },
      on_open = function(term)
        vim.cmd [[startinsert!]]
        key.map('Close terminal', 'n', 'q', '<cmd>close<cr>', {
          bufnr = term.bufnr,
          silent = true,
        })
      end,
    }

    function _G._lazygit_toggle()
      lazygit:toggle()
    end

    function _G.set_terminal_keymaps() end

    key.map('Open lazygit', 'n', '<localleader>g', '<cmd> lua _lazygit_toggle()<cr>', {
      silent = true,
    })
    vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])
    vim.cmd [[autocmd! TermOpen term://* lua set_terminal_keymaps()]]
    vim.cmd [[autocmd! TermOpen term://* set nolist]]
  end,
}

return terminal
