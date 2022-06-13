local basic = require('crows.utils').new_feat()

local function disable_builtins()
  local disabled_builtins = {
    '2html_plugin',
    'getscriptPlugin',
    'gtags',
    'gtags_cscope',
    'gzip',
    'logiPat',
    'matchit',
    -- 'matchparen',
    'netrwFileHandlers',
    'netrwPlugin',
    'netrwSettings',
    -- 'node_provider',
    -- 'perl_provider',
    'python_provider',
    'rrhelper',
    -- 'ruby_provider',
    'shada_plugin',
    'spellfile_plugin',
    'tar',
    'tarPlugin',
    'tutor_mode_plugin',
    'vimballPlugin',
    'zip',
    'zipPlugin',
  }
  for _, builtin in ipairs(disabled_builtins) do
    vim.g['loaded_' .. builtin] = 1
  end
end

basic.pre = function()
  disable_builtins()
  vim.g.mapleader = ','
  vim.g.maplocalleader = ' '
  vim.g.makeleader = 'm'
  vim.opt.linebreak = true
  vim.opt.showbreak = '->'
  vim.opt.breakat = {
    [' '] = true,
    ['\t'] = true,
    [';'] = true,
    [':'] = true,
    [','] = true,
    ['!'] = true,
    ['?'] = true,
  }
  vim.opt.mouse = 'nvihr'
  vim.opt.guicursor = {
    'n-v-c:block-Cursor/lCursor-blinkon0',
    'i-ci-ve:ver25-Cursor/lCursor',
    'r-cr:hor20-Cursor/lCursor',
    'o:hor50',
  }
  vim.opt.number = true
  vim.opt.relativenumber = true
  vim.opt.textwidth = 120
  vim.opt.colorcolumn = '+1'
  vim.opt.conceallevel = 2
  vim.opt.concealcursor = 'nc'
  vim.opt.shada = { "'20", '<50', 's10', 'h', '/100' }
  vim.opt.updatetime = 100
  vim.opt.shortmess:append {
    a = true,
    c = true,
    I = true,
  }
  vim.opt.splitbelow = true
  vim.opt.splitright = true
  vim.opt.cmdwinheight = 5
  vim.opt.previewheight = 5
  vim.opt.helpheight = 12
  vim.opt.pumheight = 10
  vim.opt.pumwidth = 0
  vim.opt.pumblend = 10
  vim.opt.winblend = 20
  vim.opt.equalalways = false
  vim.opt.undofile = true
  vim.opt.synmaxcol = 500
  vim.opt.display = { 'msgsep', 'uhex' }
  vim.opt.modeline = false
  vim.opt.grepprg = 'grep -inH'
  vim.opt.isfname:remove { '=' }
  vim.opt.isfname:append { '@-@' }
  vim.opt.swapfile = false
  -- vim.opt.showfulltag = true
  vim.opt.cedit = '<C-q>'
  vim.opt.shell = 'bash'
  vim.opt.title = true
  vim.opt.titlelen = 95
  vim.opt.titlestring = [[%{expand('%:p:~:.')} %<(%{fnamemodify(getcwd(), ':~')})%(%m%r%w%)]]
end

basic.use 'lewis6991/impatient.nvim'

basic.use {
  'rmagatti/auto-session',
  config = function()
    vim.opt.sessionoptions = 'curdir,folds,help,tabpages,terminal,winsize'
    require('auto-session').setup {
      pre_save_cmds = { 'NvimTreeClose' },
      auto_session_suppress_dirs = { '~', '~/Projects', '~/vimwiki' },
    }
    require('crows').key.maps {
      ['<Leader>l'] = {
        r = { '<cmd>RestoreSession<cr>', 'Restore session' },
        s = { '<cmd>SaveSession<cr>', 'Save session' },
        d = { '<cmd>DeleteSession<cr>', 'Delete session' },
      },
    }
  end,
}

-- improve vim select/input UI
basic.use {
  'stevearc/dressing.nvim',
  config = function()
    require('dressing').setup {
      input = { winblend = 0 },
    }
  end,
}

return basic
