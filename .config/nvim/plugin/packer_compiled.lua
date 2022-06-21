-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/rasnauf/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/rasnauf/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/rasnauf/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/rasnauf/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/rasnauf/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  LuaSnip = {
    config = { "require('config/plugins/luasnip').config()" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["SchemaStore.nvim"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/SchemaStore.nvim",
    url = "https://github.com/b0o/SchemaStore.nvim"
  },
  ["TrueZen.nvim"] = {
    config = { "require('config/plugins/truezen').config()" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/TrueZen.nvim",
    url = "https://github.com/Pocco81/TrueZen.nvim"
  },
  ["accelerated-jk"] = {
    config = { "require('config/plugins/accelerated-jk').config()" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/accelerated-jk",
    url = "https://github.com/rhysd/accelerated-jk"
  },
  ["auto-dark-mode.nvim"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/auto-dark-mode.nvim",
    url = "https://github.com/f-person/auto-dark-mode.nvim"
  },
  ["auto-session"] = {
    config = { "require('config/plugins/auto-session').config()" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/auto-session",
    url = "https://github.com/rmagatti/auto-session"
  },
  catppuccin = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-buffer"] = {
    after_files = { "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    after_files = { "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/cmp-cmdline/after/plugin/cmp_cmdline.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-npm"] = {
    config = { "require('config/plugins/cmp-npm').config()" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/cmp-npm",
    url = "https://github.com/David-Kunz/cmp-npm"
  },
  ["cmp-nvim-lsp"] = {
    config = { "require('config/plugins/cmp-nvim-lsp').config()" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-document-symbol"] = {
    after_files = { "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp-document-symbol/after/plugin/cmp_nvim_lsp_document_symbol.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp-document-symbol",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    after_files = { "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp-signature-help/after/plugin/cmp_nvim_lsp_signature_help.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-nvim-lua"] = {
    after_files = { "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    after_files = { "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-under-comparator"] = {
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/cmp-under-comparator",
    url = "https://github.com/lukas-reineke/cmp-under-comparator"
  },
  cmp_luasnip = {
    after_files = { "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["dash.vim"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/dash.vim",
    url = "https://github.com/rizzatti/dash.vim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["dracula.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/dracula.nvim",
    url = "https://github.com/Mofiqul/dracula.nvim"
  },
  ["dressing.nvim"] = {
    config = { "require('config/plugins/dressing').config()" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  edge = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/edge",
    url = "https://github.com/sainnhe/edge"
  },
  ["emmet-vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\nU\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\vwindow\1\0\0\1\0\1\nblend\3d\nsetup\vfidget\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\næ\3\0\0\n\0\25\1/6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\5\0009\4\4\0=\4\6\3B\1\2\0016\1\a\0009\1\b\0019\1\t\1'\3\n\0004\4\0\0B\1\3\0026\2\a\0009\2\b\0029\2\v\2'\4\f\0005\5\r\0=\1\14\5B\2\3\0019\2\15\0\21\2\2\0\b\2\0\0X\2\18Ä6\2\a\0009\2\b\0029\2\v\2'\4\f\0005\5\16\0=\1\14\0056\6\17\0009\6\18\0069\b\15\0'\t\19\0B\6\3\2=\6\20\0056\6\a\0009\6\21\0069\6\22\0069\6\23\6=\6\24\5B\2\3\1K\0\1\0\rcallback\24formatting_seq_sync\bbuf\blsp\fpattern\6,\vconcat\ntable\1\0\0\vby_lsp\ngroup\1\0\2\fpattern\6*\fcommand\16FormatWrite\17BufWritePost\24nvim_create_autocmd\20FormatAutogroup\24nvim_create_augroup\bapi\bvim\rfiletype\1\0\0\17by_formatter\nsetup\14formatter\19plugins.format\frequire\0\0" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/formatter.nvim",
    url = "/Users/rasnauf/Projects/formatter.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["git-conflict.nvim"] = {
    config = { "require('config/plugins/git-conflict').config()" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/git-conflict.nvim",
    url = "https://github.com/akinsho/git-conflict.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "require('config/plugins/gitsigns').config()" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["glow.nvim"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/glow.nvim",
    url = "https://github.com/ellisonleao/glow.nvim"
  },
  ["go.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ago\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/go.nvim",
    url = "https://github.com/ray-x/go.nvim"
  },
  ["gruvbox-baby"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/gruvbox-baby",
    url = "https://github.com/luisiacc/gruvbox-baby"
  },
  ["gruvbox-flat.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/gruvbox-flat.nvim",
    url = "https://github.com/eddyekofo94/gruvbox-flat.nvim"
  },
  ["gruvbox-material"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/gruvbox-material",
    url = "https://github.com/sainnhe/gruvbox-material"
  },
  ["helpful.vim"] = {
    commands = { "HelpfulVersion" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/helpful.vim",
    url = "https://github.com/tweekmonster/helpful.vim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "require('config/plugins/indent-blankline').config()" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["iron.nvim"] = {
    commands = { "IronRepl", "IronSend", "IronReplHere" },
    config = { "require('config/plugins/iron').config()" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/iron.nvim",
    url = "https://github.com/hkupty/iron.nvim"
  },
  ["kanagawa.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  ["lightspeed.nvim"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/lightspeed.nvim",
    url = "https://github.com/ggandor/lightspeed.nvim"
  },
  ["lsp-colors.nvim"] = {
    config = { "\27LJ\2\n~\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\4\16Information\f#0db9d7\tHint\f#10B981\fWarning\f#e0af68\nError\f#db4b4b\nsetup\15lsp-colors\frequire\0" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim",
    url = "https://github.com/folke/lsp-colors.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\np\0\2\6\0\6\0\t6\2\0\0'\4\1\0B\2\2\0029\2\2\0025\4\3\0005\5\4\0=\5\5\4B\2\2\1K\0\1\0\17handler_opts\1\0\1\vborder\tnone\1\0\1\tbind\2\14on_attach\18lsp_signature\frequireD\1\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0003\2\3\0B\0\2\1K\0\1\0\0\18add_on_attach\14crows.lsp\frequire\0" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind.nvim"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/lua-dev.nvim",
    url = "https://github.com/folke/lua-dev.nvim"
  },
  ["lualine.nvim"] = {
    config = { "require('config/plugins/lualine').config()" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["lush.nvim"] = {
    load_after = {
      ["zenbones.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/lush.nvim",
    url = "https://github.com/rktjmp/lush.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  neogen = {
    keys = { { "", "<localleader>d" }, { "", "<localleader>df" }, { "", "<localleader>dc" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/neogen",
    url = "https://github.com/danymat/neogen"
  },
  neogit = {
    commands = { "Neogit" },
    config = { "require('config/plugins/neogit').config()" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  neotest = {
    config = { "require('config/plugins/neotest').config()" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/neotest",
    url = "https://github.com/nvim-neotest/neotest"
  },
  ["neotest-go"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/neotest-go",
    url = "https://github.com/akinsho/neotest-go"
  },
  ["neotest-jest"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/neotest-jest",
    url = "https://github.com/haydenmeade/neotest-jest"
  },
  ["neotest-vim-test"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/neotest-vim-test",
    url = "https://github.com/nvim-neotest/neotest-vim-test"
  },
  ["neovim-ayu"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/neovim-ayu",
    url = "https://github.com/Shatur/neovim-ayu"
  },
  ["nightfox.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/nightfox.nvim",
    url = "https://github.com/EdenEast/nightfox.nvim"
  },
  ["nord.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/nord.nvim",
    url = "https://github.com/shaunsingh/nord.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "require('config/plugins/nvim-autopairs').config()" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "cmp-path", "cmp-nvim-lsp-document-symbol", "cmp-cmdline", "cmp_luasnip", "cmp-under-comparator", "cmp-buffer", "cmp-nvim-lua", "cmp-nvim-lsp-signature-help" },
    config = { "require('config/plugins/nvim-cmp').config()" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "require('config/plugins/nvim-colorizer').config()" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-coverage"] = {
    commands = { "Coverage", "CoverageLoad", "CoverageShow", "CoverageHide", "CoverageToggle", "CoverageClear", "CoverageSummary" },
    config = { "require('config/plugins/nvim-coverage').config()" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/nvim-coverage",
    url = "https://github.com/andythigpen/nvim-coverage"
  },
  ["nvim-dap"] = {
    after = { "nvim-dap-ui", "nvim-dap-virtual-text" },
    config = { "require('config/plugins/nvim-dap').config()" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap",
    wants = { "one-small-step-for-vimkind" }
  },
  ["nvim-dap-python"] = {
    config = { "require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/nvim-dap-python",
    url = "https://github.com/mfussenegger/nvim-dap-python"
  },
  ["nvim-dap-ui"] = {
    config = { "require('config/plugins/nvim-dap-ui').config()" },
    load_after = {
      ["nvim-dap"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    config = { "require('config/plugins/nvim-dap-virtual-text').config()" },
    load_after = {
      ["nvim-dap"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-lightbulb"] = {
    config = { "\27LJ\2\nâ\2\0\0\6\0\16\0\0226\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0006\1\0\0'\3\4\0B\1\2\0029\1\5\0015\3\a\0005\4\6\0=\4\b\0035\4\t\0=\0\n\4=\4\v\0035\4\f\0=\0\n\0045\5\r\0=\5\14\4=\4\15\3B\1\2\1K\0\1\0\nfloat\rwin_opts\1\0\2\rwinblend\3d\vanchor\aNE\1\0\1\fenabled\1\17virtual_text\ttext\1\0\1\fenabled\2\tsign\1\0\0\1\0\1\fenabled\1\21update_lightbulb\19nvim-lightbulb\vAction\14lsp_hover\16utils.icons\frequireœ\1\1\2\b\0\v\0\0176\2\0\0009\2\1\0029\2\2\2'\4\3\0004\5\0\0B\2\3\0026\3\0\0009\3\1\0039\3\4\0035\5\5\0005\6\6\0=\2\a\6=\1\b\0063\a\t\0=\a\n\6B\3\3\1K\0\1\0\rcallback\0\vbuffer\ngroup\1\0\1\tdesc\19Show lightbulb\1\3\0\0\15CursorHold\16CursorHoldI\24nvim_create_autocmd\15lsp_aucmds\24nvim_create_augroup\bapi\bvimD\1\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0003\2\3\0B\0\2\1K\0\1\0\0\18add_on_attach\14crows.lsp\frequire\0" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/nvim-lightbulb",
    url = "https://github.com/kosayoda/nvim-lightbulb"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-luadev"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/nvim-luadev",
    url = "https://github.com/bfredl/nvim-luadev"
  },
  ["nvim-pqf.git"] = {
    config = { "require('config/plugins/gitlab').config()" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/nvim-pqf.git",
    url = "https://gitlab.com/yorickpeterse/nvim-pqf"
  },
  ["nvim-treesitter"] = {
    after = { "playground", "nvim-treesitter-textobjects", "nvim-ts-autotag" },
    loaded = true,
    only_config = true
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-treesitter-endwise"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-endwise",
    url = "https://github.com/RRethy/nvim-treesitter-endwise"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["octo.nvim"] = {
    config = { "require('config/plugins/octo').config()" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/octo.nvim",
    url = "https://github.com/haydenmeade/octo.nvim"
  },
  ["one-small-step-for-vimkind"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/one-small-step-for-vimkind",
    url = "https://github.com/jbyuki/one-small-step-for-vimkind"
  },
  ["onedarkpro.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/onedarkpro.nvim",
    url = "https://github.com/olimorris/onedarkpro.nvim"
  },
  ["open-browser.vim"] = {
    config = { "require('config/plugins/open-browser').config()" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/open-browser.vim",
    url = "https://github.com/tyru/open-browser.vim"
  },
  ["package-info.nvim"] = {
    config = { "\27LJ\2\nÇ\5\0\0\v\0!\0D6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0026\1\0\0'\3\4\0B\1\2\0029\1\5\0019\2\6\0015\4\30\0005\5\n\0005\6\t\0009\a\a\0'\t\1\0'\n\b\0B\a\3\2>\a\1\6=\6\v\0055\6\r\0009\a\a\0'\t\1\0'\n\f\0B\a\3\2>\a\1\6=\6\14\0055\6\16\0009\a\a\0'\t\1\0'\n\15\0B\a\3\2>\a\1\6=\6\17\0055\6\19\0009\a\a\0'\t\1\0'\n\18\0B\a\3\2>\a\1\6=\6\20\0055\6\22\0009\a\a\0'\t\1\0'\n\21\0B\a\3\2>\a\1\6=\6\23\0055\6\25\0009\a\a\0'\t\1\0'\n\24\0B\a\3\2>\a\1\6=\6\26\0055\6\28\0009\a\a\0'\t\1\0'\n\27\0B\a\3\2>\a\1\6=\6\29\5=\5\31\0045\5 \0B\2\3\1K\0\1\0\1\0\1\vsilent\2\14<leader>n\1\0\0\6p\1\3\0\0\0\27Change package version\19change_version\6r\1\3\0\0\0\27Reinstall dependencies\14reinstall\6i\1\3\0\0\0\26Install a new package\finstall\6d\1\3\0\0\0#Delete package on current line\vdelete\6u\1\3\0\0\0#Update package on current line\vupdate\6c\1\3\0\0\0\26Hide package versions\thide\6s\1\0\0\1\3\0\0\0\26Show package versions\tshow\afn\tmaps\bkey\ncrows\15crows.lazy\nsetup\17package-info\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/package-info.nvim",
    url = "https://github.com/vuki656/package-info.nvim"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    commands = { "TSPlaygroundToggle" },
    load_after = {},
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["refactoring.nvim"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/refactoring.nvim",
    url = "https://github.com/ThePrimeagen/refactoring.nvim"
  },
  ["rose-pine"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/rose-pine",
    url = "https://github.com/rose-pine/neovim"
  },
  ["session-lens"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/session-lens",
    url = "https://github.com/rmagatti/session-lens"
  },
  ["space-vim-theme"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/space-vim-theme",
    url = "https://github.com/liuchengxu/space-vim-theme"
  },
  ["splitjoin.vim"] = {
    config = { "require('config/plugins/splitjoin').config()" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/splitjoin.vim",
    url = "https://github.com/AndrewRadev/splitjoin.vim"
  },
  ["sqlite.lua"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/sqlite.lua",
    url = "https://github.com/tami5/sqlite.lua"
  },
  ["switch.vim"] = {
    keys = { { "", "_" } },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/switch.vim",
    url = "https://github.com/AndrewRadev/switch.vim"
  },
  ["symbols-outline.nvim"] = {
    commands = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  ["telescope-dap.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/telescope-dap.nvim",
    url = "https://github.com/nvim-telescope/telescope-dap.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-frecency.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/telescope-frecency.nvim",
    url = "https://github.com/nvim-telescope/telescope-frecency.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-repo.nvim"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/telescope-repo.nvim",
    url = "https://github.com/cljoly/telescope-repo.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    after = { "telescope-ui-select.nvim", "telescope-dap.nvim", "telescope-frecency.nvim", "telescope-fzf-native.nvim" },
    config = { "require('config/plugins/telescope').config()" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim",
    wants = { "popup.nvim", "plenary.nvim", "telescope-frecency.nvim", "telescope-fzf-native.nvim" }
  },
  ["toggleterm.nvim"] = {
    config = { "require('config/plugins/toggleterm').config()" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["treesitter-unit"] = {
    config = { "\27LJ\2\n®\3\0\0\6\0\r\0)6\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0'\2\4\0'\3\5\0'\4\6\0'\5\a\0B\0\5\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0'\2\4\0'\3\5\0'\4\b\0'\5\t\0B\0\5\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0'\2\4\0'\3\n\0'\4\6\0'\5\v\0B\0\5\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0'\2\4\0'\3\n\0'\4\b\0'\5\f\0B\0\5\1K\0\1\0::<C-u>lua require(\"treesitter-unit\").select(true)<CR>6:<C-u>lua require(\"treesitter-unit\").select()<CR>\6o5:lua require(\"treesitter-unit\").select(true)<CR>\aau1:lua require(\"treesitter-unit\").select()<CR>\aiu\6x\27Select treesitter unit\bmap\bkey\ncrows\frequire\0" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/treesitter-unit",
    url = "https://github.com/David-Kunz/treesitter-unit"
  },
  ["trouble.nvim"] = {
    config = { "require('config/plugins/trouble').config()" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["twilight.nvim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/twilight.nvim",
    url = "https://github.com/loqusion/twilight.nvim"
  },
  undotree = {
    commands = { "UndotreeToggle" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-arpeggio"] = {
    config = { "require('config/plugins/vim-arpeggio').config()" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-arpeggio",
    url = "https://github.com/kana/vim-arpeggio"
  },
  ["vim-cool"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-cool",
    url = "https://github.com/romainl/vim-cool"
  },
  ["vim-dispatch"] = {
    commands = { "Dispatch", "Make", "Focus", "Start" },
    keys = { { "", "m<CR>" }, { "", "m<Space>" }, { "", "m!" }, { "", "m?" }, { "", "`<CR>" }, { "", "`<Space>" }, { "", "`!" }, { "", "`?" }, { "", "'<CR>" }, { "", "'<Space>" }, { "", "'!" }, { "", "'?" }, { "", "g'<CR>" }, { "", "g'<Space>" }, { "", "g'!" }, { "", "g'?" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/vim-dispatch",
    url = "https://github.com/tpope/vim-dispatch"
  },
  ["vim-enmasse"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-enmasse",
    url = "https://github.com/Olical/vim-enmasse"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-eunuch",
    url = "https://github.com/tpope/vim-eunuch"
  },
  ["vim-fish"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/vim-fish",
    url = "https://github.com/dag/vim-fish"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-illuminate"] = {
    config = { "\27LJ\2\n@\0\1\4\0\3\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\1\18\3\0\0B\1\2\1K\0\1\0\14on_attach\15illuminate\frequirek\1\0\3\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0003\2\3\0B\0\2\0016\0\4\0009\0\5\0)\1d\0=\1\6\0K\0\1\0\21Illuminate_delay\6g\bvim\0\18add_on_attach\14crows.lsp\frequire\0" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-log-highlighting"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-log-highlighting",
    url = "https://github.com/MTDL9/vim-log-highlighting"
  },
  ["vim-markdown"] = {
    config = { '\27LJ\2\nô\1\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\6\0\0\23js=javascriptreact\23ts=typescriptreact\24jsx=javascriptreact\24tsx=typescriptreact\fsh=bash"vim_markdown_fenced_languages\6g\bvim\0' },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-markdown",
    url = "https://github.com/preservim/vim-markdown"
  },
  ["vim-matchup"] = {
    config = { "require('config/plugins/vim-matchup').config()" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-niceblock"] = {
    config = { "require('config/plugins/vim-niceblock').config()" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-niceblock",
    url = "https://github.com/kana/vim-niceblock"
  },
  ["vim-python-pep8-indent"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-python-pep8-indent",
    url = "https://github.com/Vimjas/vim-python-pep8-indent"
  },
  ["vim-qf"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-qf",
    url = "https://github.com/romainl/vim-qf"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-sayonara"] = {
    commands = { "Sayonara" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/vim-sayonara",
    url = "https://github.com/mhinz/vim-sayonara"
  },
  ["vim-scriptease"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-scriptease",
    url = "https://github.com/tpope/vim-scriptease"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-sleuth",
    url = "https://github.com/tpope/vim-sleuth"
  },
  ["vim-startuptime"] = {
    commands = { "StartupTime" },
    config = { "vim.g.startuptime_tries = 10" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/vim-startuptime",
    url = "https://github.com/dstein64/vim-startuptime"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-test",
    url = "https://github.com/vim-test/vim-test"
  },
  ["vim-textobj-comment"] = {
    config = { "require('config/plugins/vim-textobj-comment').config()" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-textobj-comment",
    url = "https://github.com/glts/vim-textobj-comment"
  },
  ["vim-textobj-entire"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-textobj-entire",
    url = "https://github.com/kana/vim-textobj-entire"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-textobj-user",
    url = "https://github.com/kana/vim-textobj-user"
  },
  ["vim-unimpaired"] = {
    config = { "require('config/plugins/vim-unimpaired').config()" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["vim-wordmotion"] = {
    config = { "require('config/plugins/vim-wordmotion').config()" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-wordmotion",
    url = "https://github.com/chaoren/vim-wordmotion"
  },
  vimwiki = {
    commands = { "VimwikiIndex" },
    keys = { { "", "<Plug>Vimwiki" } },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/vimwiki",
    url = "https://github.com/vimwiki/vimwiki"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\nï\2\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\14operators\1\0\t\6!#Filter though external program\6y\16Yank (copy)\6d\vDelete\ag~\16Toggle case\agu\14Lowercase\agU\14Uppercase\azf\16Create fold\6v\26Visual Character Mode\6c\vChange\fplugins\1\0\0\fpresets\1\0\0\1\0\1\14operators\1\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["zenbones.nvim"] = {
    after = { "lush.nvim" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/zenbones.nvim",
    url = "https://github.com/mcchrish/zenbones.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^coverage"] = "nvim-coverage",
  ["^dap"] = "nvim-dap",
  ["^iron"] = "iron.nvim",
  ["^package%-info"] = "package-info.nvim",
  ["^telescope"] = "telescope.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Setup for: vimwiki
time([[Setup for vimwiki]], true)
require('config/plugins/vimwiki').setup()
time([[Setup for vimwiki]], false)
-- Setup for: iron.nvim
time([[Setup for iron.nvim]], true)
require('config/plugins/iron').setup()
time([[Setup for iron.nvim]], false)
-- Setup for: markdown-preview.nvim
time([[Setup for markdown-preview.nvim]], true)
try_loadstring("\27LJ\2\nQ\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\4\0\0\rmarkdown\20pandoc.markdown\brmd\19mkdp_filetypes\6g\bvim\0", "setup", "markdown-preview.nvim")
time([[Setup for markdown-preview.nvim]], false)
-- Setup for: telescope.nvim
time([[Setup for telescope.nvim]], true)
require('config/plugins/telescope').setup()
time([[Setup for telescope.nvim]], false)
-- Setup for: symbols-outline.nvim
time([[Setup for symbols-outline.nvim]], true)
require('config/plugins/symbols-outline').setup()
time([[Setup for symbols-outline.nvim]], false)
-- Setup for: twilight.nvim
time([[Setup for twilight.nvim]], true)
require('config/plugins/twilight').setup()
time([[Setup for twilight.nvim]], false)
time([[packadd for twilight.nvim]], true)
vim.cmd [[packadd twilight.nvim]]
time([[packadd for twilight.nvim]], false)
-- Setup for: switch.vim
time([[Setup for switch.vim]], true)
try_loadstring("\27LJ\2\n2\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\6_\19switch_mapping\6g\bvim\0", "setup", "switch.vim")
time([[Setup for switch.vim]], false)
-- Setup for: nvim-dap
time([[Setup for nvim-dap]], true)
require('config/plugins/nvim-dap').setup()
time([[Setup for nvim-dap]], false)
-- Setup for: vim-sayonara
time([[Setup for vim-sayonara]], true)
require('config/plugins/vim-sayonara').setup()
time([[Setup for vim-sayonara]], false)
-- Setup for: neogen
time([[Setup for neogen]], true)
require('config/plugins/neogen').setup()
time([[Setup for neogen]], false)
-- Setup for: undotree
time([[Setup for undotree]], true)
require('config/plugins/undotree').setup()
time([[Setup for undotree]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
require('config/plugins/nvim-autopairs').config()
time([[Config for nvim-autopairs]], false)
-- Config for: dressing.nvim
time([[Config for dressing.nvim]], true)
require('config/plugins/dressing').config()
time([[Config for dressing.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
require('config/plugins/lualine').config()
time([[Config for lualine.nvim]], false)
-- Config for: cmp-npm
time([[Config for cmp-npm]], true)
require('config/plugins/cmp-npm').config()
time([[Config for cmp-npm]], false)
-- Config for: vim-matchup
time([[Config for vim-matchup]], true)
require('config/plugins/vim-matchup').config()
time([[Config for vim-matchup]], false)
-- Config for: vim-markdown
time([[Config for vim-markdown]], true)
try_loadstring('\27LJ\2\nô\1\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\6\0\0\23js=javascriptreact\23ts=typescriptreact\24jsx=javascriptreact\24tsx=typescriptreact\fsh=bash"vim_markdown_fenced_languages\6g\bvim\0', "config", "vim-markdown")
time([[Config for vim-markdown]], false)
-- Config for: lsp_signature.nvim
time([[Config for lsp_signature.nvim]], true)
try_loadstring("\27LJ\2\np\0\2\6\0\6\0\t6\2\0\0'\4\1\0B\2\2\0029\2\2\0025\4\3\0005\5\4\0=\5\5\4B\2\2\1K\0\1\0\17handler_opts\1\0\1\vborder\tnone\1\0\1\tbind\2\14on_attach\18lsp_signature\frequireD\1\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0003\2\3\0B\0\2\1K\0\1\0\0\18add_on_attach\14crows.lsp\frequire\0", "config", "lsp_signature.nvim")
time([[Config for lsp_signature.nvim]], false)
-- Config for: nvim-lightbulb
time([[Config for nvim-lightbulb]], true)
try_loadstring("\27LJ\2\nâ\2\0\0\6\0\16\0\0226\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0006\1\0\0'\3\4\0B\1\2\0029\1\5\0015\3\a\0005\4\6\0=\4\b\0035\4\t\0=\0\n\4=\4\v\0035\4\f\0=\0\n\0045\5\r\0=\5\14\4=\4\15\3B\1\2\1K\0\1\0\nfloat\rwin_opts\1\0\2\rwinblend\3d\vanchor\aNE\1\0\1\fenabled\1\17virtual_text\ttext\1\0\1\fenabled\2\tsign\1\0\0\1\0\1\fenabled\1\21update_lightbulb\19nvim-lightbulb\vAction\14lsp_hover\16utils.icons\frequireœ\1\1\2\b\0\v\0\0176\2\0\0009\2\1\0029\2\2\2'\4\3\0004\5\0\0B\2\3\0026\3\0\0009\3\1\0039\3\4\0035\5\5\0005\6\6\0=\2\a\6=\1\b\0063\a\t\0=\a\n\6B\3\3\1K\0\1\0\rcallback\0\vbuffer\ngroup\1\0\1\tdesc\19Show lightbulb\1\3\0\0\15CursorHold\16CursorHoldI\24nvim_create_autocmd\15lsp_aucmds\24nvim_create_augroup\bapi\bvimD\1\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0003\2\3\0B\0\2\1K\0\1\0\0\18add_on_attach\14crows.lsp\frequire\0", "config", "nvim-lightbulb")
time([[Config for nvim-lightbulb]], false)
-- Config for: lsp-colors.nvim
time([[Config for lsp-colors.nvim]], true)
try_loadstring("\27LJ\2\n~\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\4\16Information\f#0db9d7\tHint\f#10B981\fWarning\f#e0af68\nError\f#db4b4b\nsetup\15lsp-colors\frequire\0", "config", "lsp-colors.nvim")
time([[Config for lsp-colors.nvim]], false)
-- Config for: vim-illuminate
time([[Config for vim-illuminate]], true)
try_loadstring("\27LJ\2\n@\0\1\4\0\3\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\1\18\3\0\0B\1\2\1K\0\1\0\14on_attach\15illuminate\frequirek\1\0\3\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0003\2\3\0B\0\2\0016\0\4\0009\0\5\0)\1d\0=\1\6\0K\0\1\0\21Illuminate_delay\6g\bvim\0\18add_on_attach\14crows.lsp\frequire\0", "config", "vim-illuminate")
time([[Config for vim-illuminate]], false)
-- Config for: neotest
time([[Config for neotest]], true)
require('config/plugins/neotest').config()
time([[Config for neotest]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
require('config/plugins/indent-blankline').config()
time([[Config for indent-blankline.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\nï\2\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\14operators\1\0\t\6!#Filter though external program\6y\16Yank (copy)\6d\vDelete\ag~\16Toggle case\agu\14Lowercase\agU\14Uppercase\azf\16Create fold\6v\26Visual Character Mode\6c\vChange\fplugins\1\0\0\fpresets\1\0\0\1\0\1\14operators\1\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: cmp-nvim-lsp
time([[Config for cmp-nvim-lsp]], true)
require('config/plugins/cmp-nvim-lsp').config()
time([[Config for cmp-nvim-lsp]], false)
-- Config for: vim-arpeggio
time([[Config for vim-arpeggio]], true)
require('config/plugins/vim-arpeggio').config()
time([[Config for vim-arpeggio]], false)
-- Config for: vim-wordmotion
time([[Config for vim-wordmotion]], true)
require('config/plugins/vim-wordmotion').config()
time([[Config for vim-wordmotion]], false)
-- Config for: vim-unimpaired
time([[Config for vim-unimpaired]], true)
require('config/plugins/vim-unimpaired').config()
time([[Config for vim-unimpaired]], false)
-- Config for: octo.nvim
time([[Config for octo.nvim]], true)
require('config/plugins/octo').config()
time([[Config for octo.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
require('config/plugins/trouble').config()
time([[Config for trouble.nvim]], false)
-- Config for: vim-textobj-comment
time([[Config for vim-textobj-comment]], true)
require('config/plugins/vim-textobj-comment').config()
time([[Config for vim-textobj-comment]], false)
-- Config for: glow.nvim
time([[Config for glow.nvim]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "glow.nvim")
time([[Config for glow.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
require('config/plugins/gitsigns').config()
time([[Config for gitsigns.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
require('config/plugins/toggleterm').config()
time([[Config for toggleterm.nvim]], false)
-- Config for: accelerated-jk
time([[Config for accelerated-jk]], true)
require('config/plugins/accelerated-jk').config()
time([[Config for accelerated-jk]], false)
-- Config for: git-conflict.nvim
time([[Config for git-conflict.nvim]], true)
require('config/plugins/git-conflict').config()
time([[Config for git-conflict.nvim]], false)
-- Config for: TrueZen.nvim
time([[Config for TrueZen.nvim]], true)
require('config/plugins/truezen').config()
time([[Config for TrueZen.nvim]], false)
-- Config for: open-browser.vim
time([[Config for open-browser.vim]], true)
require('config/plugins/open-browser').config()
time([[Config for open-browser.vim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require('config/plugins/nvim-treesitter').config()
time([[Config for nvim-treesitter]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
try_loadstring("\27LJ\2\næ\3\0\0\n\0\25\1/6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\5\0009\4\4\0=\4\6\3B\1\2\0016\1\a\0009\1\b\0019\1\t\1'\3\n\0004\4\0\0B\1\3\0026\2\a\0009\2\b\0029\2\v\2'\4\f\0005\5\r\0=\1\14\5B\2\3\0019\2\15\0\21\2\2\0\b\2\0\0X\2\18Ä6\2\a\0009\2\b\0029\2\v\2'\4\f\0005\5\16\0=\1\14\0056\6\17\0009\6\18\0069\b\15\0'\t\19\0B\6\3\2=\6\20\0056\6\a\0009\6\21\0069\6\22\0069\6\23\6=\6\24\5B\2\3\1K\0\1\0\rcallback\24formatting_seq_sync\bbuf\blsp\fpattern\6,\vconcat\ntable\1\0\0\vby_lsp\ngroup\1\0\2\fpattern\6*\fcommand\16FormatWrite\17BufWritePost\24nvim_create_autocmd\20FormatAutogroup\24nvim_create_augroup\bapi\bvim\rfiletype\1\0\0\17by_formatter\nsetup\14formatter\19plugins.format\frequire\0\0", "config", "formatter.nvim")
time([[Config for formatter.nvim]], false)
-- Config for: nvim-pqf.git
time([[Config for nvim-pqf.git]], true)
require('config/plugins/gitlab').config()
time([[Config for nvim-pqf.git]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
require('config/plugins/luasnip').config()
time([[Config for LuaSnip]], false)
-- Config for: vim-niceblock
time([[Config for vim-niceblock]], true)
require('config/plugins/vim-niceblock').config()
time([[Config for vim-niceblock]], false)
-- Config for: treesitter-unit
time([[Config for treesitter-unit]], true)
try_loadstring("\27LJ\2\n®\3\0\0\6\0\r\0)6\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0'\2\4\0'\3\5\0'\4\6\0'\5\a\0B\0\5\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0'\2\4\0'\3\5\0'\4\b\0'\5\t\0B\0\5\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0'\2\4\0'\3\n\0'\4\6\0'\5\v\0B\0\5\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0'\2\4\0'\3\n\0'\4\b\0'\5\f\0B\0\5\1K\0\1\0::<C-u>lua require(\"treesitter-unit\").select(true)<CR>6:<C-u>lua require(\"treesitter-unit\").select()<CR>\6o5:lua require(\"treesitter-unit\").select(true)<CR>\aau1:lua require(\"treesitter-unit\").select()<CR>\aiu\6x\27Select treesitter unit\bmap\bkey\ncrows\frequire\0", "config", "treesitter-unit")
time([[Config for treesitter-unit]], false)
-- Config for: splitjoin.vim
time([[Config for splitjoin.vim]], true)
require('config/plugins/splitjoin').config()
time([[Config for splitjoin.vim]], false)
-- Config for: auto-session
time([[Config for auto-session]], true)
require('config/plugins/auto-session').config()
time([[Config for auto-session]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-treesitter-textobjects ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSPlaygroundToggle lua require("packer.load")({'playground'}, { cmd = "TSPlaygroundToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SymbolsOutline lua require("packer.load")({'symbols-outline.nvim'}, { cmd = "SymbolsOutline", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SymbolsOutlineOpen lua require("packer.load")({'symbols-outline.nvim'}, { cmd = "SymbolsOutlineOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SymbolsOutlineClose lua require("packer.load")({'symbols-outline.nvim'}, { cmd = "SymbolsOutlineClose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Make lua require("packer.load")({'vim-dispatch'}, { cmd = "Make", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Focus lua require("packer.load")({'vim-dispatch'}, { cmd = "Focus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Start lua require("packer.load")({'vim-dispatch'}, { cmd = "Start", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CoverageShow lua require("packer.load")({'nvim-coverage'}, { cmd = "CoverageShow", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file IronRepl lua require("packer.load")({'iron.nvim'}, { cmd = "IronRepl", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file IronSend lua require("packer.load")({'iron.nvim'}, { cmd = "IronSend", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file IronReplHere lua require("packer.load")({'iron.nvim'}, { cmd = "IronReplHere", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CoverageSummary lua require("packer.load")({'nvim-coverage'}, { cmd = "CoverageSummary", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CoverageClear lua require("packer.load")({'nvim-coverage'}, { cmd = "CoverageClear", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'vim-startuptime'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CoverageToggle lua require("packer.load")({'nvim-coverage'}, { cmd = "CoverageToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CoverageHide lua require("packer.load")({'nvim-coverage'}, { cmd = "CoverageHide", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CoverageLoad lua require("packer.load")({'nvim-coverage'}, { cmd = "CoverageLoad", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file VimwikiIndex lua require("packer.load")({'vimwiki'}, { cmd = "VimwikiIndex", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Coverage lua require("packer.load")({'nvim-coverage'}, { cmd = "Coverage", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Neogit lua require("packer.load")({'neogit'}, { cmd = "Neogit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Dispatch lua require("packer.load")({'vim-dispatch'}, { cmd = "Dispatch", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HelpfulVersion lua require("packer.load")({'helpful.vim'}, { cmd = "HelpfulVersion", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Sayonara lua require("packer.load")({'vim-sayonara'}, { cmd = "Sayonara", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> `? <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "`?", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <localleader>dc <cmd>lua require("packer.load")({'neogen'}, { keys = "<lt>localleader>dc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <localleader>df <cmd>lua require("packer.load")({'neogen'}, { keys = "<lt>localleader>df", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <localleader>d <cmd>lua require("packer.load")({'neogen'}, { keys = "<lt>localleader>d", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> _ <cmd>lua require("packer.load")({'switch.vim'}, { keys = "_", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>Vimwiki <cmd>lua require("packer.load")({'vimwiki'}, { keys = "<lt>Plug>Vimwiki", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> `! <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "`!", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> `<Space> <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "`<lt>Space>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> g'? <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "g'?", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> `<CR> <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "`<lt>CR>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> m<Space> <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "m<lt>Space>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> m? <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "m?", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> '! <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "'!", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> m! <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "m!", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> '<CR> <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "'<lt>CR>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> '<Space> <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "'<lt>Space>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> m<CR> <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "m<lt>CR>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> '? <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "'?", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> g'<CR> <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "g'<lt>CR>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> g'<Space> <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "g'<lt>Space>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> g'! <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "g'!", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType vim ++once lua require("packer.load")({'nvim-treesitter-endwise', 'nvim-colorizer.lua'}, { ft = "vim" }, _G.packer_plugins)]]
vim.cmd [[au FileType ruby ++once lua require("packer.load")({'nvim-treesitter-endwise'}, { ft = "ruby" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascriptreact ++once lua require("packer.load")({'nvim-colorizer.lua', 'emmet-vim', 'nvim-ts-autotag'}, { ft = "javascriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescriptreact ++once lua require("packer.load")({'nvim-colorizer.lua', 'emmet-vim', 'nvim-ts-autotag'}, { ft = "typescriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-colorizer.lua', 'emmet-vim', 'nvim-ts-autotag'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript.jsx ++once lua require("packer.load")({'emmet-vim'}, { ft = "javascript.jsx" }, _G.packer_plugins)]]
vim.cmd [[au FileType css ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType sass ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "sass" }, _G.packer_plugins)]]
vim.cmd [[au FileType python ++once lua require("packer.load")({'nvim-dap-python'}, { ft = "python" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript.tsx ++once lua require("packer.load")({'emmet-vim'}, { ft = "typescript.tsx" }, _G.packer_plugins)]]
vim.cmd [[au FileType gomod ++once lua require("packer.load")({'go.nvim'}, { ft = "gomod" }, _G.packer_plugins)]]
vim.cmd [[au FileType rmd ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "rmd" }, _G.packer_plugins)]]
vim.cmd [[au FileType fish ++once lua require("packer.load")({'vim-fish'}, { ft = "fish" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'go.nvim'}, { ft = "go" }, _G.packer_plugins)]]
vim.cmd [[au FileType pandoc.markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "pandoc.markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType vue ++once lua require("packer.load")({'nvim-colorizer.lua', 'emmet-vim', 'nvim-ts-autotag'}, { ft = "vue" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'nvim-treesitter-endwise'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim', 'nvim-ts-autotag'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType scss ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "scss" }, _G.packer_plugins)]]
vim.cmd [[au FileType sh ++once lua require("packer.load")({'nvim-treesitter-endwise'}, { ft = "sh" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au CmdlineEnter * ++once lua require("packer.load")({'nvim-cmp'}, { event = "CmdlineEnter *" }, _G.packer_plugins)]]
vim.cmd [[au CmdwinEnter * ++once lua require("packer.load")({'nvim-cmp'}, { event = "CmdwinEnter *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'auto-dark-mode.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-cmp'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'fidget.nvim'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
vim.cmd [[au CursorHold * ++once lua require("packer.load")({'nvim-cmp'}, { event = "CursorHold *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/rasnauf/.local/share/nvim/site/pack/packer/opt/vim-fish/ftdetect/fish.vim]], true)
vim.cmd [[source /Users/rasnauf/.local/share/nvim/site/pack/packer/opt/vim-fish/ftdetect/fish.vim]]
time([[Sourcing ftdetect script at: /Users/rasnauf/.local/share/nvim/site/pack/packer/opt/vim-fish/ftdetect/fish.vim]], false)
time([[Sourcing ftdetect script at: /Users/rasnauf/.local/share/nvim/site/pack/packer/opt/go.nvim/ftdetect/go.vim]], true)
vim.cmd [[source /Users/rasnauf/.local/share/nvim/site/pack/packer/opt/go.nvim/ftdetect/go.vim]]
time([[Sourcing ftdetect script at: /Users/rasnauf/.local/share/nvim/site/pack/packer/opt/go.nvim/ftdetect/go.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
