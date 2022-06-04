---@type Feature
local editor = { plugins = {} }

local function set_filetype()
  vim.cmd [[filetype on]]
  vim.cmd [[filetype plugin on]]
  vim.g.do_filetype_lua = 1
  -- vim.g.did_load_filetypes = 1
  vim.g.did_load_filetypes = 0
  local filetypes = {
    ['*html'] = 'html',
    ['tsconfig.json'] = 'jsonc',
  }
  local ft_group = vim.api.nvim_create_augroup('filetypes', {})
  for pattern, filetype in pairs(filetypes) do
    vim.api.nvim_create_autocmd(
      { 'BufNewFile', 'BufRead' },
      { group = ft_group, pattern = pattern, command = 'setfiletype ' .. filetype, once = true }
    )
  end
end

editor.pre = function()
  vim.cmd [[syntax enable]]
  vim.opt.foldmethod = 'indent'
  vim.opt.foldlevelstart = 99
  vim.opt.wildignore:append {
    '*/.git/*',
    '*/node_modules/*',
    '*.swp',
    '*.pyc',
    '*/venv/*',
    '*/target/*',
    '.DS_Store',
  }

  set_filetype()

  -- setup indent
  vim.cmd [[filetype indent on]]
  vim.opt.cindent = true
  vim.opt.expandtab = true
  vim.opt.tabstop = 8
  vim.opt.shiftwidth = 4
  vim.opt.softtabstop = -1
  local fi_group = vim.api.nvim_create_augroup('fileindent', {})
  vim.api.nvim_create_autocmd('FileType', {
    group = fi_group,
    pattern = 'lua,javascript,typescript,javascriptreact,typescriptreact,html,css,scss,sass,xml,yaml,json',
    command = 'setlocal expandtab ts=2 sw=2 sts=-1',
  })
end

-- autopairs
editor.plugins[#editor.plugins + 1] = {
  'windwp/nvim-autopairs',
  requires = { 'hrsh7th/nvim-cmp' },
  config = function()
    require('nvim-autopairs').setup {
      fast_wrap = {},
      enable_check_bracket_line = true,
      check_ts = true,
    }
    -- If you want insert `(` after select function or method item
    local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
    local cmp = require 'cmp'
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done { map_char = { tex = '' } })
  end,
}

-- indent hint
editor.plugins[#editor.plugins + 1] = {
  'lukas-reineke/indent-blankline.nvim',
  config = function()
    require('indent_blankline').setup {
      buftype_exclude = { 'help', 'nofile', 'nowrite', 'quickfix', 'terminal', 'prompt' },
      show_current_context = true,
      show_current_context_start = true,
      use_treesitter = true,
    }
  end,
}

-- treesitter
editor.plugins[#editor.plugins + 1] = {
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = 'all',
      ignore_install = { 'php', 'phpdoc' },
      highlight = { enable = true },
    }
  end,
}

-- git management
editor.plugins[#editor.plugins + 1] = 'tpope/vim-fugitive'
editor.plugins[#editor.plugins + 1] = {
  'TimUntersberger/neogit',
  requires = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
  },
  config = function()
    require('neogit').setup {
      integrations = { diffview = true },
      disable_commit_confirmation = true,
      disable_signs = true,
    }
  end,
}

return editor
