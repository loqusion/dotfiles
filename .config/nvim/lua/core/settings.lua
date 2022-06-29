local path = require 'utils.api.path'

local settings = {
  g = {
    do_filetype_lua = 1,
    -- did_load_filetypes = 0,
    mapleader = ',',
    maplocalleader = ' ',
    makeleader = 'm',
  },
  opt = {
    syntax = 'ON',
    encoding = 'utf-8',
    fileencoding = 'utf-8',
    fileformat = 'unix',
    fileformats = { 'unix', 'dos', 'mac' },
    -- filetype = 'plugin',
    shell = 'bash',
    grepprg = 'grep -inH',
    backup = true,
    swapfile = false,
    undofile = true,
    shada = { "'20", '<50', 's10', 'h', '/100' },
    sessionoptions = 'buffers,curdir,folds,help,tabpages,winsize,globals',
    completeopt = 'menu,menuone,noselect',
    signcolumn = 'yes:1',
    textwidth = 120,
    colorcolumn = '+1',
    title = true,
    lazyredraw = true,
    synmaxcol = 500,
    redrawtime = 0,
    showmode = false,
    modeline = false,
    updatetime = 100,
    timeoutlen = 500,
    showcmd = false,
    termguicolors = true,
    cursorline = true,
    number = true,
    relativenumber = true,
    ruler = false,
    numberwidth = 2,
    scrolloff = 0,
    sidescrolloff = 0,
    splitbelow = true,
    splitright = true,
    equalalways = false,
    cedit = '<C-q>',
    mouse = 'ar',
    list = true,
    conceallevel = 2,
    concealcursor = 'nc',
    incsearch = true,
    hlsearch = true,
    wrapscan = true,
    showmatch = false,
    matchtime = 2,
    spell = false,
    spelllang = 'en_us,cjk',
    wildmenu = true,
    wildignorecase = true,
    cmdheight = 1,
    cmdwinheight = 5,
    previewheight = 5,
    helpheight = 12,
    pumheight = 10,
    pumwidth = 0,
    pumblend = 10,
    winblend = 10,
    ignorecase = true,
    smartcase = true,
    foldenable = true,
    foldmethod = 'indent',
    foldcolumn = '0',
    foldlevel = 100,
    foldlevelstart = 99,
    linebreak = true,
    showbreak = '⤷ ',
    breakat = {
      [' '] = true,
      ['\t'] = true,
      [';'] = true,
      [':'] = true,
      [','] = true,
      ['!'] = true,
      ['?'] = true,
    },
    clipboard = 'unnamedplus',
    autoread = true,
    autoindent = true,
    smartindent = true,
    expandtab = true,
    shiftround = true,
    tabstop = 8,
    shiftwidth = 4,
    softtabstop = 0,
    virtualedit = 'block',
    iskeyword = '@,48-57,_,192-255',
    laststatus = 3,
    fillchars = 'vert:┃,horiz:━,verthoriz:╋,horizup:┻,horizdown:┳,vertleft:┫,vertright:┣',
    listchars = {
      tab = ' ──',
      space = '⋅',
      nbsp = '␣',
      trail = '•',
      eol = '↵',
      precedes = '«',
      extends = '»',
    },
    display = { 'msgsep', 'uhex' },
    guicursor = {
      'n-v-c:block-Cursor/lCursor-blinkon0',
      'i-ci-ve:ver25-Cursor/lCursor',
      'r-cr:hor20-Cursor/lCursor',
      'o:hor50',
    },
    diffopt = { 'internal', 'algorithm:patience', 'indent-heuristic' },
  },
  disable_builtin_plugins = {
    '2html_plugin',
    'getscriptPlugin',
    'gtags',
    'gtags_cscope',
    'gzip',
    'logiPat',
    'matchit',
    -- 'matchparen',
    -- 'netrw',
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
  },
  env = {
    BASH_ENV = path.join(vim.env.HOME, '.bashenv.sh'),
  },
}

vim.opt.isfname:remove { '=' }
vim.opt.isfname:append { '@-@' }

vim.opt.wildignore:append {
  '*/.yarn/*',
  '*/.git/*',
  '*/node_modules/*',
  '*.swp',
  '*.pyc',
  '*/venv/*',
  '*/target/*',
  '.DS_Store',
}

vim.opt.backupdir:remove { '.' }

vim.opt.shortmess:append {
  a = true,
  c = true,
  I = true,
}

vim.opt.formatoptions:remove { 't' }
vim.opt.formatoptions:append {
  -- Auto-wrap comments
  c = true,
  -- Continue comments after <CR>
  r = true,
  -- Allow formatting comments with `gq`
  q = true,
  -- Long lines are not broken in insert mode
  l = true,
  -- Remove comment leader when joining lines
  j = true,
}

for prefix, tab in pairs(settings) do
  if prefix ~= 'disable_builtin_plugins' then
    for key, value in pairs(tab) do
      vim[prefix][key] = value
    end
  else
    for _, plugin in ipairs(tab) do
      vim.g['loaded_' .. plugin] = 1
    end
  end
end

return settings
