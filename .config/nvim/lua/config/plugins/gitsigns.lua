-- https://github.com/lewis6991/gitsigns.nvim

local M = {
  safe_requires = {
    'gitsigns',
  },
}

function M.setup() end

function M.config()
  M.gitsigns.setup {
    on_attach = function(bufnr)
      M.register_buffer_keys(bufnr)
    end,
  }
end

function M.register_buffer_keys(bufnr)
  local gs = package.loaded.gitsigns
  local key = require('crows').key

  local function next_hunk()
    if vim.wo.diff then
      return ']c'
    end
    vim.schedule(function()
      gs.next_hunk()
    end)
    return '<Ignore>'
  end
  local function prev_hunk()
    if vim.wo.diff then
      return '[c'
    end
    vim.schedule(function()
      gs.prev_hunk()
    end)
    return '<Ignore>'
  end
  local function blame_line_full()
    gs.blame_line { full = true }
  end
  local function diffthis()
    gs.diffthis '~'
  end

  local opts = { buffer = bufnr }
  key.maps({
    [']c'] = { next_hunk, 'Goto next hunk' },
    ['[c'] = { prev_hunk, 'Goto prev hunk' },
    ['<leader>g'] = {
      name = 'Gitsigns',
      S = { gs.stage_buffer, 'Stage current buffer' },
      u = { gs.undo_stage_hunk, 'Undo last staged hunk' },
      R = { gs.reset_buffer, 'Reset current buffer' },
      p = { gs.preview_hunk, 'Preview hunk' },
      b = { blame_line_full, 'Blame current line' },
      tb = { gs.toggle_current_line_blame, 'Toggle blame current line' },
      d = { gs.diffthis, 'Git diff' },
      D = { diffthis, 'Git diff' },
      td = { gs.toggle_deleted, 'Toggle deleted' },
    },
  }, opts)
  for _, mode in ipairs { 'n', 'v' } do
    key.map('Stage hunk', mode, '<leader>gs', ':Gitsigns stage_hunk<cr>', opts)
    key.map('Reset hunk', mode, '<leader>gr', ':Gitsigns reset_hunk<cr>', opts)
  end
  for _, mode in ipairs { 'o', 'x' } do
    key.map('hunk', mode, 'ic', '<cmd>Gitsigns select_hunk<cr>', opts)
    key.map('hunk', mode, 'ac', '<cmd>Gitsigns select_hunk<cr>', opts)
  end
end

return M
