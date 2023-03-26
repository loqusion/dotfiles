-- https://github.com/RRethy/vim-illuminate

local M = {
  safe_requires = {
    'illuminate',
  },
}

function M.setup()
  M.register_global_keys()
end

function M.config()
  M.illuminate.configure {
    delay = 100,
    filetypes_denylist = {
      'NeogitStatus',
      'TelescopePrompt',
      'dashboard',
      'fugitive',
      'git',
      'gitcommit',
      'help',
      'man',
      'markdown',
      'neo-tree',
      'norg',
      'plugin',
      'sagahover',
      'toggleterm',
    },
  }
end

function M.register_global_keys()
  require('utils.api').key.maps {
    ['<F7>'] = {
      '<Cmd>lua require("illuminate").goto_next_reference()<CR>',
      'Goto next reference',
    },
    ['<F19>'] = { -- <S-F7> doesn't work; see https://github.com/neovim/neovim/issues/7384
      '<Cmd>lua require("illuminate").goto_prev_reference()<CR>',
      'Goto previous reference',
    },
  }
end

return M
