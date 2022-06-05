local statusline = require('crows.utils').new_feat()

statusline.pre = function()
  vim.opt.showcmd = false
  vim.opt.showmode = false
  vim.opt.laststatus = 3
end

statusline.use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = require('features.theme').lualine,
        -- component_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
        component_separators = '',
        section_separators = '',
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = false,
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = {
          'branch',
          'diff',
          {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
          },
        },
        lualine_c = {
          { 'filename', path = 1 },
        },
        lualine_x = {
          { 'encoding', separator = '|' },
          { 'fileformat', icons_enabled = false, separator = '|' },
          { 'filetype', separator = '|' },
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {
        lualine_a = { 'buffers' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'tabs' },
      },
      extensions = {
        'fugitive',
        'quickfix',
        'symbols-outline',
        'toggleterm',
      },
    }
  end,
}

return statusline
