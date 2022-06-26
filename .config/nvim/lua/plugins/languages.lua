local languages = require('crows.utils').new_feat()

-- fish
languages.use {
  'dag/vim-fish',
  ft = { 'fish' },
}

-- go
languages.use {
  'ray-x/go.nvim',
  ft = { 'go', 'gomod' },
  config = function()
    require('go').setup()
  end,
}

-- markdown
languages.use {
  {
    'preservim/vim-markdown',
    config = function()
      vim.g.vim_markdown_fenced_languages = {
        'js=javascriptreact',
        'ts=typescriptreact',
        'jsx=javascriptreact',
        'tsx=typescriptreact',
        'sh=bash',
      }
    end,
  },
  {
    'ellisonleao/glow.nvim',
    config = function()
      -- local glow_path = vim.fn.system 'which glow'
      -- if glow_path ~= '' then
      --   vim.g.glow_binary_path = glow_path
      -- end
    end,
  },
  {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
    ft = { 'markdown', 'pandoc.markdown', 'rmd' },
    setup = function()
      vim.g.mkdp_filetypes = { 'markdown', 'pandoc.markdown', 'rmd' }
    end,
  },
}

-- python
languages.use {
  'Vimjas/vim-python-pep8-indent',
}

-- rust
languages.use {
  'simrat39/rust-tools.nvim',
  disable = true,
  ft = 'rust',
  config = function()
    require('rust-tools').setup {}
  end,
}

-- web dev (js, ts, react, html, etc)
languages.use {
  {
    'mattn/emmet-vim',
    ft = {
      'html',
      'javascript.jsx',
      'typescript.tsx',
      'javascriptreact',
      'typescriptreact',
      'vue',
    },
  },
  {
    'vuki656/package-info.nvim',
    requires = 'MunifTanjim/nui.nvim',
    module = 'package-info',
    setup = function()
      local lazy = require 'crows.lazy'
      local key = require('crows').key
      key.maps({
        ['<leader>n'] = {
          s = { lazy.fn('package-info', 'show'), 'Show package versions' },
          c = { lazy.fn('package-info', 'hide'), 'Hide package versions' },
          u = { lazy.fn('package-info', 'update'), 'Update package on current line' },
          d = { lazy.fn('package-info', 'delete'), 'Delete package on current line' },
          i = { lazy.fn('package-info', 'install'), 'Install a new package' },
          r = { lazy.fn('package-info', 'reinstall'), 'Reinstall dependencies' },
          p = { lazy.fn('package-info', 'change_version'), 'Change package version' },
        },
      }, { silent = true })
    end,
    config = function()
      require('package-info').setup()
    end,
  },
}

return languages
