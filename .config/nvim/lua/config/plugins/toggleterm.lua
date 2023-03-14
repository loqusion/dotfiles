-- https://github.com/akinsho/toggleterm.nvim

local M = {
  safe_requires = {
    'toggleterm',
    { 'toggleterm.terminal', 'terminal' },
  },
}

function M.setup() end

function M.config()
  M.toggleterm.setup {
    direction = 'float',
    border = 'shadow',
    shell = vim.fn.getenv 'SHELL',
    open_mapping = [[<c-\>]],
  }

  local Terminal = M.terminal.Terminal
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
      M.register_buffer_keys(term.bufnr)
    end,
  }

  function _G._lazygit_toggle()
    lazygit:toggle()
  end

  vim.cmd [[autocmd! TermOpen term://* set nolist]]
  M.register_global_keys()
end

function M.register_global_keys()
  local key = require('utils.api').key
  key.map('Open lazygit', 'n', '<Space>g', '<cmd> lua _lazygit_toggle()<cr>', {
    silent = true,
  })
  local function term_map(num)
    return {
      string.format('<C-\\><C-n><Cmd>%sToggleTerm<CR>', num),
      string.format('Open terminal %s', num),
    }
  end

  key.maps({
    ['<M-\\>'] = term_map(1),
    ['<M-;>'] = term_map(2),
    ["<M-'>"] = term_map(3),
  }, { mode = { 'n', 't' } })
end

function M.register_buffer_keys(bufnr)
  require('utils.api').key.map('Close terminal', 'n', 'q', '<cmd>close<cr>', {
    buffer = bufnr,
    silent = true,
  })
end

return M
