local ui = require('crows.utils').new_feat()

ui.use {
  'Pocco81/TrueZen.nvim',
  config = function()
    local key = require('crows').key
    local true_zen = require 'true-zen'

    true_zen.setup {
      integrations = {
        gitsigns = true,
        lualine = false,
        twilight = false,
      },
    }

    true_zen.after_mode_ataraxis_on = function()
      vim.wo.list = false
    end

    for _, mode in ipairs { 'n', 'x' } do
      key.map('True Zen: Ataraxis', mode, '<localleader>z', '<cmd>TZAtaraxis<cr>')
    end
  end,
}

ui.use {
  -- 'folke/twilight.nvim',
  'loqusion/twilight.nvim', -- Use this one until https://github.com/folke/twilight.nvim/issues/15 is resolved
  setup = function()
    local key = require('crows').key
    for _, mode in ipairs { 'n', 'x' } do
      key.map('Toggle dim text', mode, '<localleader>t', '<cmd>Twilight<cr>')
    end
  end,
}

ui.use {
  'kyazdani42/nvim-tree.lua',
  disable = true,
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    if not vim.g.did_load_nvim_tree_config then
      vim.g.did_load_nvim_tree_config = true
      require('nvim-tree').setup {
        disable_netrw = false,
        update_cwd = true,
        diagnostics = { enable = true },
        view = { signcolumn = 'auto' },
        filters = {
          custom = {
            '\\.git',
          },
        },
      }
      require('crows').key.map('Toggle filetree', 'n', '<localleader>f', '<cmd>NvimTreeToggle<cr>')
    end
  end,
}

-- show registers
ui.use {
  'tversteeg/registers.nvim',
  disable = true,
  keys = { { 'n', '"' }, { 'i', '<c-r>' } },
  config = function()
    vim.g.registers_paste_in_normal_mode = 1
    vim.g.registers_hide_only_whitespace = 1
    vim.g.registers_show_empty_registers = 0
  end,
}

-- undotree
ui.use {
  'mbbill/undotree',
  cmd = 'UndotreeToggle',
  config = function()
    vim.g.undotree_SetFocusWhenToggle = 1
  end,
}

-- symbols outline
ui.use {
  'simrat39/symbols-outline.nvim',
  cmd = { 'SymbolsOutline', 'SymbolsOutlineOpen', 'SymbolsOutlineClose' },
  setup = function()
    require('crows').key.map('Toggle symbols outline', 'n', '<localleader>o', '<cmd>SymbolsOutline<cr>')
  end,
}

return ui
