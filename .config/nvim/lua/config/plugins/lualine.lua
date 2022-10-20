-- https://github.com/nvim-lualine/lualine.nvim

local settings = require 'core.settings'

local M = {
  safe_requires = {
    'lualine',
    'noice',
  },
}

function M.setup() end

function M.config()
  M.lualine.setup {
    options = {
      icons_enabled = true,
      -- theme = require('plugins.theme').lualine,
      --       
      component_separators = '',
      section_separators = { left = '', right = '' },
      -- section_separators = { left = '', right = '' },
      disabled_filetypes = {},
      always_divide_middle = true,
      globalstatus = settings.opt.laststatus == 3,
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
        {
          M.noice.api.statusline.mode.get,
          cond = M.noice.api.statusline.mode.has,
          color = { fg = '#ff9e64' },
        },
        {
          M.persisted_component,
          separator = '|',
          cond = function()
            return vim.g.persisting ~= nil
          end,
        },
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
    extensions = {
      'fugitive',
      'neo-tree',
      'nvim-dap-ui',
      'quickfix',
      'symbols-outline',
      'toggleterm',
    },
  }
end

function M.persisted_component()
  if vim.g.persisting then
    return ''
  elseif vim.g.persisting == false then
    return ''
  end
end

return M
