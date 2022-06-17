local git = require('crows.utils').new_feat()

git.use 'tpope/vim-fugitive'
git.use 'tpope/vim-rhubarb'

git.use {
  'akinsho/git-conflict.nvim',
  config = function()
    require('git-conflict').setup {}
  end,
}

git.use {
  'lewis6991/gitsigns.nvim',
  requires = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('gitsigns').setup {
      on_attach = function(_)
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

        key.maps {
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
        }
        for _, mode in ipairs { 'n', 'v' } do
          key.map('Stage hunk', mode, '<leader>gs', ':Gitsigns stage_hunk<cr>')
          key.map('Reset hunk', mode, '<leader>gr', ':Gitsigns reset_hunk<cr>')
        end
        for _, mode in ipairs { 'o', 'x' } do
          key.map('hunk', mode, 'ic', '<cmd>Gitsigns select_hunk<cr>')
          key.map('hunk', mode, 'ac', '<cmd>Gitsigns select_hunk<cr>')
        end
      end,
    }
  end,
}

git.use {
  'TimUntersberger/neogit',
  requires = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
  },
  cmd = 'Neogit',
  config = function()
    require('neogit').setup {
      integrations = { diffview = true },
      disable_commit_confirmation = true,
      disable_signs = true,
    }
  end,
}

git.use {
  'haydenmeade/octo.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'kyazdani42/nvim-web-devicons',
  },
  config = function()
    require('octo').setup()
  end,
}

return git
