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
  local key = require('crows').key
  key.map('Open lazygit', 'n', '<Space>g', '<cmd> lua _lazygit_toggle()<cr>', {
    silent = true,
  })
  key.maps({
    ['<M-1>'] = { '<C-\\><C-n><Cmd>1ToggleTerm<CR>', 'Open terminal 1' },
    ['<M-2>'] = { '<C-\\><C-n><Cmd>2ToggleTerm<CR>', 'Open terminal 2' },
    ['<M-3>'] = { '<C-\\><C-n><Cmd>3ToggleTerm<CR>', 'Open terminal 3' },
    ['<M-4>'] = { '<C-\\><C-n><Cmd>4ToggleTerm<CR>', 'Open terminal 4' },
    ['<M-5>'] = { '<C-\\><C-n><Cmd>5ToggleTerm<CR>', 'Open terminal 5' },
    ['<M-6>'] = { '<C-\\><C-n><Cmd>6ToggleTerm<CR>', 'Open terminal 6' },
    ['<M-7>'] = { '<C-\\><C-n><Cmd>7ToggleTerm<CR>', 'Open terminal 7' },
    ['<M-8>'] = { '<C-\\><C-n><Cmd>8ToggleTerm<CR>', 'Open terminal 8' },
    ['<M-9>'] = { '<C-\\><C-n><Cmd>9ToggleTerm<CR>', 'Open terminal 9' },
  }, { mode = { 'n', 't' } })
  -- key.maps({
  --   ['<M-1>'] = { '<C-\\><C-n><Cmd>1ToggleTerm<CR>', 'Open terminal 1' },
  --   ['<M-2>'] = { '<C-\\><C-n><Cmd>2ToggleTerm<CR>', 'Open terminal 2' },
  --   ['<M-3>'] = { '<C-\\><C-n><Cmd>3ToggleTerm<CR>', 'Open terminal 3' },
  --   ['<M-4>'] = { '<C-\\><C-n><Cmd>4ToggleTerm<CR>', 'Open terminal 4' },
  --   ['<M-5>'] = { '<C-\\><C-n><Cmd>5ToggleTerm<CR>', 'Open terminal 5' },
  --   ['<M-6>'] = { '<C-\\><C-n><Cmd>6ToggleTerm<CR>', 'Open terminal 6' },
  --   ['<M-7>'] = { '<C-\\><C-n><Cmd>7ToggleTerm<CR>', 'Open terminal 7' },
  --   ['<M-8>'] = { '<C-\\><C-n><Cmd>8ToggleTerm<CR>', 'Open terminal 8' },
  --   ['<M-9>'] = { '<C-\\><C-n><Cmd>9ToggleTerm<CR>', 'Open terminal 9' },
  -- }, { mode = 't' })
end

function M.register_buffer_keys(bufnr)
  require('crows').key.map('Close terminal', 'n', 'q', '<cmd>close<cr>', {
    bufnr = bufnr,
    silent = true,
  })
end

return M
