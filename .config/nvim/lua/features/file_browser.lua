---@type Feature
local file_browser = { plugins = {} }

file_browser.plugins[#file_browser.plugins + 1] = {
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

return file_browser
