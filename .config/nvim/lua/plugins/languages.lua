local languages = require('crows.utils').new_feat()

-- fish
languages.use { -- Fish
  'dag/vim-fish',
  ft = { 'fish' },
}

languages.use { -- Go
  'ray-x/go.nvim',
  ft = { 'go', 'gomod' },
  config = function()
    require('go').setup()
  end,
}

languages.use { -- Markdown
  {
    'preservim/vim-markdown',
    ft = { 'markdown', 'vimwiki' },
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
  { -- Preview markdown in a floating window
    'ellisonleao/glow.nvim',
    cmd = 'Glow',
    config = function()
      local glow_path = vim.fn.system 'which glow'
      if glow_path ~= '' then
        vim.g.glow_binary_path = glow_path
      end
    end,
  },
  { -- Preview markdown in browser
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
    ft = { 'markdown', 'pandoc.markdown', 'rmd', 'vimwiki' },
    setup = function()
      vim.g.mkdp_filetypes = { 'markdown', 'pandoc.markdown', 'rmd', 'vimwiki' }
    end,
  },
  { -- Paste image from clipboard
    'ekickx/clipboard-image.nvim',
    ft = { 'markdown', 'vimwiki' },
    cmd = 'PasteImg',
  },
}

languages.use { -- Python
  'Vimjas/vim-python-pep8-indent',
}

languages.use { -- Rust
  'simrat39/rust-tools.nvim',
  disable = true,
  ft = 'rust',
  config = function()
    require('rust-tools').setup {}
  end,
}

languages.use { -- Web development (JS, TS, React, HTML, CSS, etc)
  { -- All the npm commands I don't want to type
    'vuki656/package-info.nvim',
    requires = 'MunifTanjim/nui.nvim',
    ft = 'json',
    module = 'package-info',
    setup = true,
    config = true,
  },
}

return languages
