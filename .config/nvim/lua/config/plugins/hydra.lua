-- https://github.com/anuvyklack/hydra.nvim

local M = {
  safe_requires = {
    'hydra',
  },
}

function M.setup() end

function M.config()
  M.spawn_hydra_side_scroll()
  M.spawn_hydra_window_resize()
end

function M.spawn_hydra_side_scroll()
  M.hydra {
    name = 'Side scroll',
    mode = 'n',
    body = 'z',
    heads = {
      { 'h', '5zh' },
      { 'l', '5zl', { desc = '←/→' } },
      { 'H', 'zH' },
      { 'L', 'zL', { desc = 'half screen ←/→' } },
    },
  }
end

function M.spawn_hydra_window_resize()
  M.hydra {
    name = 'Resize window',
    mode = 'n',
    body = '<C-w>',
    heads = {
      -- { '+', '<Cmd>lua require("smart-splits").resize_up(5)<CR>' },
      -- { '-', '<Cmd>lua require("smart-splits").resize_down(5)<CR>', { desc = '↑/↓' } },
      { '+', '5<C-w>+' },
      { '-', '5<C-w>-', { desc = '↑/↓' } },
      { '<', '<Cmd>lua require("smart-splits").resize_left(5)<CR>' },
      { '>', '<Cmd>lua require("smart-splits").resize_right(5)<CR>', { desc = '←/→' } },
      -- { '<', '5<C-w><lt>' },
      -- { '>', '5<C-w>>', { desc = '←/→' } },
    },
  }
end

return M
