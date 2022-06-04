local file_browser = require('crows.utils').new_feat()

file_browser.use {
  'kyazdani42/nvim-tree.lua',
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require('nvim-tree').setup {
      disable_netrw = false,
      update_cwd = true,
      diagnostics = { enable = true },
      view = { signcolumn = 'auto' },
      git = {
        ignore = false,
      },
    }
    -- TODO: mapping for NvimTreeToggle
    -- require('crows').key.map('Toggle filetree', 'n', '<leader>fl', '<cmd>NvimTreeToggle<cr>')
  end,
}

file_browser.use {
  {
    'justinmk/vim-dirvish',
    config = function()
      vim.g.dirvish_mode = 1
      -- show directories first
      vim.cmd [[autocmd FileType dirvish silent sort ,^.*[/],]]
    end,
  },
  'bounceme/remote-viewer',
}

return file_browser
