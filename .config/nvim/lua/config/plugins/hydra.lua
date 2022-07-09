-- https://github.com/anuvyklack/hydra.nvim

local M = {}

function M.setup() end

function M.config()
  local ok, m = pcall(require, 'hydra')
  if not ok then
    vim.notify(
      string.format('Failed to load config %s', require('utils.api.path').current_filename(true)),
      vim.log.levels.ERROR
    )
    return
  end

  M.hydra = m

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
      { '+', '5<C-w>+' },
      { '-', '5<C-w>-', { desc = '↑/↓' } },
      { '<', '5<C-w><lt>' },
      { '>', '5<C-w>>', { desc = '←/→' } },
    },
  }
end

return M
