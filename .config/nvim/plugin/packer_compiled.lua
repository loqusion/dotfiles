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
    config = { "require('config/plugins/comment').config()" },
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
    after = { "cmp-under-comparator", "nvim-cmp", "lspkind.nvim" },
    config = { "require('config/plugins/luasnip').config()" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["SchemaStore.nvim"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/SchemaStore.nvim",
    url = "https://github.com/b0o/SchemaStore.nvim"
  },
  ["TrueZen.nvim"] = {
    commands = { "TZAtaraxis", "TZFocus", "TZMinimalist" },
    config = { "require('config/plugins/truezen').config()" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/TrueZen.nvim",
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
  ["clipboard-image.nvim"] = {
    commands = { "PasteImg" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/clipboard-image.nvim",
    url = "https://github.com/ekickx/clipboard-image.nvim"
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
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/cmp-npm",
    url = "https://github.com/David-Kunz/cmp-npm"
  },
  ["cmp-nvim-lsp"] = {
    after = { "nvim-lsp-installer" },
    after_files = { "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    config = { "require('config/plugins/cmp-nvim-lsp').config()" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
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
    after = { "nvim-cmp" },
    load_after = {
      LuaSnip = true
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
    commands = { "Dash", "DashKeywords" },
    keys = { { "", "<Plug>DashSearch" }, { "", "<Plug>DashGlobalSearch" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/dash.vim",
    url = "https://github.com/rizzatti/dash.vim"
  },
  ["detect-language.nvim"] = {
    config = { "require('config/plugins/detect-language').config()" },
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/detect-language.nvim",
    url = "https://github.com/spywhere/detect-language.nvim"
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
  ["fidget.nvim"] = {
    config = { "require('config/plugins/fidget').config()" },
    load_after = {
      ["nvim-lsp-installer"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["fugitive-gitlab.vim"] = {
    load_after = {
      ["vim-fugitive"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/fugitive-gitlab.vim",
    url = "https://github.com/shumphrey/fugitive-gitlab.vim"
  },
  ["git-conflict.nvim"] = {
    config = { "require('config/plugins/git-conflict').config()" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/git-conflict.nvim",
    url = "https://github.com/akinsho/git-conflict.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "require('config/plugins/gitsigns').config()" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["glow.nvim"] = {
    commands = { "Glow" },
    config = { "\27LJ\2\n`\0\0\3\0\a\0\v6\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\6\0\4\0X\1\3€6\1\0\0009\1\5\1=\0\6\1K\0\1\0\21glow_binary_path\6g\5\15which glow\vsystem\afn\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/glow.nvim",
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
  ["goto-preview"] = {
    config = { "require('config/plugins/goto-preview').config()" },
    keys = { { "", "gp" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/goto-preview",
    url = "https://github.com/rmagatti/goto-preview"
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
  ["hydra.nvim"] = {
    config = { "require('config/plugins/hydra').config()" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/hydra.nvim",
    url = "https://github.com/anuvyklack/hydra.nvim"
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
  ["iswap.nvim"] = {
    commands = { "ISwap", "ISwapWith" },
    config = { "require('config/plugins/iswap').config()" },
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/iswap.nvim",
    url = "https://github.com/mizlan/iswap.nvim"
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
    config = { "require('config/plugins/lsp-colors').config()" },
    load_after = {
      ["nvim-lsp-installer"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/lsp-colors.nvim",
    url = "https://github.com/folke/lsp-colors.nvim"
  },
  ["lsp-command"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/lsp-command",
    url = "https://github.com/ii14/lsp-command"
  },
  ["lsp_signature.nvim"] = {
    config = { "require('config/plugins/lsp_signature').config()" },
    load_after = {
      ["nvim-lsp-installer"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind.nvim"] = {
    after = { "nvim-cmp" },
    load_after = {
      LuaSnip = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["lua-dev.nvim"] = {
    after = { "nvim-lsp-installer" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/lua-dev.nvim",
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
  ["neo-tree.nvim"] = {
    commands = { "Neotree" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
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
  neorg = {
    after = { "neorg-telescope" },
    commands = { "NeorgStart" },
    config = { "require('config/plugins/neorg').config()" },
    load_after = {
      ["nvim-treesitter"] = true,
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/neorg",
    url = "https://github.com/nvim-neorg/neorg",
    wants = { "neorg-telescope" }
  },
  ["neorg-telescope"] = {
    load_after = {
      neorg = true,
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/neorg-telescope",
    url = "https://github.com/nvim-neorg/neorg-telescope"
  },
  neotest = {
    after = { "neotest-python", "neotest-go", "neotest-vim-test", "neotest-jest" },
    config = { "require('config/plugins/neotest').config()" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/neotest",
    url = "https://github.com/nvim-neotest/neotest",
    wants = { "neotest-jest", "neotest-python", "neotest-go", "neotest-vim-test" }
  },
  ["neotest-go"] = {
    load_after = {
      neotest = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/neotest-go",
    url = "https://github.com/akinsho/neotest-go"
  },
  ["neotest-jest"] = {
    load_after = {
      neotest = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/neotest-jest",
    url = "https://github.com/haydenmeade/neotest-jest"
  },
  ["neotest-python"] = {
    load_after = {
      neotest = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/neotest-python",
    url = "https://github.com/nvim-neotest/neotest-python"
  },
  ["neotest-vim-test"] = {
    load_after = {
      neotest = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/neotest-vim-test",
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
  ["null-ls.nvim"] = {
    after = { "nvim-lsp-installer" },
    config = { "require('config/plugins/null-ls').config()" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "require('config/plugins/nvim-autopairs').config()" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "cmp-cmdline", "cmp-nvim-lsp-document-symbol", "cmp-path", "cmp-nvim-lsp-signature-help", "cmp-nvim-lsp", "cmp_luasnip", "cmp-npm", "cmp-buffer", "cmp-nvim-lua" },
    config = { "require('config/plugins/nvim-cmp').config()" },
    load_after = {
      LuaSnip = true,
      ["cmp-under-comparator"] = true,
      ["lspkind.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
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
    after = { "nvim-dap-virtual-text", "nvim-dap-ui", "nvim-dap-python" },
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
    load_after = {
      ["nvim-dap"] = true
    },
    loaded = false,
    needs_bufread = false,
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
  ["nvim-hlslens"] = {
    config = { "require('config/plugins/nvim-hlslens').config()" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/nvim-hlslens",
    url = "https://github.com/kevinhwang91/nvim-hlslens"
  },
  ["nvim-lightbulb"] = {
    config = { "require('config/plugins/nvim-lightbulb').config()" },
    load_after = {
      ["nvim-lsp-installer"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/nvim-lightbulb",
    url = "https://github.com/kosayoda/nvim-lightbulb"
  },
  ["nvim-lsp-installer"] = {
    after = { "lsp_signature.nvim", "vim-illuminate", "nvim-lightbulb", "lsp-colors.nvim", "fidget.nvim" },
    config = { "require('config/plugins/nvim-lsp-installer').config()" },
    load_after = {
      ["cmp-nvim-lsp"] = true
    },
    loaded = false,
    needs_bufread = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/nvim-lsp-installer",
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
  ["nvim-notify"] = {
    config = { "require('config/plugins/nvim-notify').config()" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-pqf.git"] = {
    config = { "require('config/plugins/gitlab').config()" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/nvim-pqf.git",
    url = "https://gitlab.com/yorickpeterse/nvim-pqf"
  },
  ["nvim-scrollbar"] = {
    config = { "require('config/plugins/nvim-scrollbar').config()" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/nvim-scrollbar",
    url = "https://github.com/petertriho/nvim-scrollbar"
  },
  ["nvim-treesitter"] = {
    after = { "detect-language.nvim", "iswap.nvim", "nvim-treesitter-textsubjects", "treesitter-unit", "nvim-treesitter-textobjects", "neorg", "spellsitter.nvim", "nvim-treesitter-context", "nvim-treesitter-endwise", "nvim-ts-context-commentstring" },
    config = { "require('config/plugins/nvim-treesitter').config()" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-treesitter-endwise"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-endwise",
    url = "https://github.com/RRethy/nvim-treesitter-endwise",
    wants = { "nvim-treesitter" }
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-treesitter-textsubjects"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textsubjects",
    url = "https://github.com/RRethy/nvim-treesitter-textsubjects"
  },
  ["nvim-ts-autotag"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag",
    wants = { "nvim-treesitter" }
  },
  ["nvim-ts-context-commentstring"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["nvim-window-picker"] = {
    config = { "require('config/plugins/nvim-window-picker').config()" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/nvim-window-picker",
    url = "https://github.com/s1n7ax/nvim-window-picker"
  },
  ["octo.nvim"] = {
    commands = { "Octo" },
    config = { "require('config/plugins/octo').config()" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/octo.nvim",
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
    loaded = true,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/open-browser.vim",
    url = "https://github.com/tyru/open-browser.vim"
  },
  ["package-info.nvim"] = {
    config = { "require('config/plugins/package-info').config()" },
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
    commands = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/playground",
    url = "https://github.com/nvim-treesitter/playground",
    wants = { "nvim-treesitter" }
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
  ["presence.nvim"] = {
    config = { "require('config/plugins/presence').config()" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/presence.nvim",
    url = "https://github.com/andweeb/presence.nvim"
  },
  ["project.nvim"] = {
    config = { "require('config/plugins/project').config()" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  ["refactoring.nvim"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/refactoring.nvim",
    url = "https://github.com/ThePrimeagen/refactoring.nvim"
  },
  ["rest.nvim"] = {
    config = { "require('config/plugins/rest').config()" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/rest.nvim",
    url = "https://github.com/NTBBloodbath/rest.nvim"
  },
  ["rose-pine"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/rose-pine",
    url = "https://github.com/rose-pine/neovim"
  },
  ["session-lens"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/session-lens",
    url = "https://github.com/rmagatti/session-lens"
  },
  ["space-vim-theme"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/space-vim-theme",
    url = "https://github.com/liuchengxu/space-vim-theme"
  },
  ["spellsitter.nvim"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/spellsitter.nvim",
    url = "https://github.com/lewis6991/spellsitter.nvim"
  },
  ["splitjoin.vim"] = {
    loaded = true,
    needs_bufread = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/splitjoin.vim",
    url = "https://github.com/AndrewRadev/splitjoin.vim"
  },
  ["sqlite.lua"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/sqlite.lua",
    url = "https://github.com/tami5/sqlite.lua"
  },
  ["stabilize.nvim"] = {
    config = { "require('config/plugins/stabilize').config()" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/stabilize.nvim",
    url = "https://github.com/luukvbaal/stabilize.nvim"
  },
  ["switch.vim"] = {
    keys = { { "", "<Plug>(Switch)" } },
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
  ["tabby.nvim"] = {
    config = { "require('config/plugins/tabby').config()" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/tabby.nvim",
    url = "https://github.com/nanozuki/tabby.nvim"
  },
  ["targets.vim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/targets.vim",
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
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-frecency.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/telescope-frecency.nvim",
    url = "https://github.com/nvim-telescope/telescope-frecency.nvim",
    wants = { "sqlite.lua" }
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
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/telescope-repo.nvim",
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
    after = { "neorg", "neorg-telescope", "session-lens", "telescope-frecency.nvim", "telescope-fzf-native.nvim", "telescope-dap.nvim", "telescope-ui-select.nvim", "telescope-file-browser.nvim", "telescope-repo.nvim" },
    config = { "require('config/plugins/telescope').config()" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim",
    wants = { "popup.nvim", "plenary.nvim", "telescope-frecency.nvim", "telescope-fzf-native.nvim", "telescope-dap.nvim", "telescope-ui-select.nvim", "telescope-file-browser.nvim", "telescope-repo.nvim", "session-lens" }
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
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/treesitter-unit",
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
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-abolish",
    url = "https://github.com/tpope/vim-abolish"
  },
  ["vim-arpeggio"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/vim-arpeggio",
    url = "https://github.com/kana/vim-arpeggio"
  },
  ["vim-asterisk"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/vim-asterisk",
    url = "https://github.com/haya14busa/vim-asterisk"
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
    after = { "vim-rhubarb", "fugitive-gitlab.vim" },
    commands = { "G", "Git", "Ggrep", "Glgrep", "Gclog", "Gllog", "Gcd", "Glcd", "Gedit", "Gsplit", "Gvsplit", "Gtabedit", "Gpedit", "Gdrop", "Gread", "Gwrite", "Gwq", "Gdiffsplit", "Gvdiffsplit", "Ghdiffsplit", "GMove", "GRename", "GDelete", "GRemove", "GUnlink", "GBrowse" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-illuminate"] = {
    config = { "require('config/plugins/vim-illuminate').config()" },
    load_after = {
      ["nvim-lsp-installer"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-log-highlighting"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-log-highlighting",
    url = "https://github.com/MTDL9/vim-log-highlighting"
  },
  ["vim-matchup"] = {
    after_files = { "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-niceblock"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/vim-niceblock",
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
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-rhubarb"] = {
    load_after = {
      ["vim-fugitive"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/vim-rhubarb",
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
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-test",
    url = "https://github.com/vim-test/vim-test"
  },
  ["vim-textobj-comment"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/vim-textobj-comment",
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
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/vim-wordmotion",
    url = "https://github.com/chaoren/vim-wordmotion"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n•\2\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\14operators\1\0\t\6c\vChange\azf\16Create fold\6v\26Visual Character Mode\6y\16Yank (copy)\6!#Filter though external program\ag~\16Toggle case\agu\14Lowercase\agU\14Uppercase\6d\vDelete\fplugins\1\0\0\fpresets\1\0\0\1\0\1\14operators\1\nsetup\14which-key\frequire\0" },
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
  ["^goto%-preview"] = "goto-preview",
  ["^hlslens"] = "nvim-hlslens",
  ["^iron"] = "iron.nvim",
  ["^neogit"] = "neogit",
  ["^neotest"] = "neotest",
  ["^nvim%-treesitter"] = "nvim-treesitter",
  ["^octo"] = "octo.nvim",
  ["^package%-info"] = "package-info.nvim",
  ["^session%-lens"] = "session-lens",
  ["^telescope"] = "telescope.nvim",
  ["^window%-picker"] = "nvim-window-picker"
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

-- Setup for: nvim-hlslens
time([[Setup for nvim-hlslens]], true)
require('config/plugins/nvim-hlslens').setup()
time([[Setup for nvim-hlslens]], false)
-- Setup for: null-ls.nvim
time([[Setup for null-ls.nvim]], true)
require('config/plugins/null-ls').setup()
time([[Setup for null-ls.nvim]], false)
-- Setup for: dash.vim
time([[Setup for dash.vim]], true)
require('config/plugins/dash').setup()
time([[Setup for dash.vim]], false)
-- Setup for: vim-arpeggio
time([[Setup for vim-arpeggio]], true)
require("config/plugins/vim-arpeggio").entrance()
time([[Setup for vim-arpeggio]], false)
-- Setup for: vim-matchup
time([[Setup for vim-matchup]], true)
require("config/plugins/vim-matchup").entrance()
time([[Setup for vim-matchup]], false)
-- Setup for: vim-sayonara
time([[Setup for vim-sayonara]], true)
require("config/plugins/vim-sayonara").entrance()
time([[Setup for vim-sayonara]], false)
-- Setup for: nvim-dap
time([[Setup for nvim-dap]], true)
require('config/plugins/nvim-dap').setup()
time([[Setup for nvim-dap]], false)
-- Setup for: vim-textobj-comment
time([[Setup for vim-textobj-comment]], true)
require("config/plugins/vim-textobj-comment").entrance()
time([[Setup for vim-textobj-comment]], false)
-- Setup for: vim-niceblock
time([[Setup for vim-niceblock]], true)
require("config/plugins/vim-niceblock").entrance()
time([[Setup for vim-niceblock]], false)
-- Setup for: neotest
time([[Setup for neotest]], true)
require('config/plugins/neotest').setup()
time([[Setup for neotest]], false)
-- Setup for: nvim-treesitter
time([[Setup for nvim-treesitter]], true)
require('config/plugins/nvim-treesitter').setup()
time([[Setup for nvim-treesitter]], false)
-- Setup for: iron.nvim
time([[Setup for iron.nvim]], true)
require('config/plugins/iron').setup()
time([[Setup for iron.nvim]], false)
-- Setup for: splitjoin.vim
time([[Setup for splitjoin.vim]], true)
require("config/plugins/splitjoin").entrance()
time([[Setup for splitjoin.vim]], false)
time([[packadd for splitjoin.vim]], true)
vim.cmd [[packadd splitjoin.vim]]
time([[packadd for splitjoin.vim]], false)
-- Setup for: open-browser.vim
time([[Setup for open-browser.vim]], true)
require("config/plugins/open-browser").entrance()
time([[Setup for open-browser.vim]], false)
time([[packadd for open-browser.vim]], true)
vim.cmd [[packadd open-browser.vim]]
time([[packadd for open-browser.vim]], false)
-- Setup for: vim-asterisk
time([[Setup for vim-asterisk]], true)
require("config/plugins/vim-asterisk").entrance()
time([[Setup for vim-asterisk]], false)
-- Setup for: package-info.nvim
time([[Setup for package-info.nvim]], true)
require('config/plugins/package-info').setup()
time([[Setup for package-info.nvim]], false)
-- Setup for: goto-preview
time([[Setup for goto-preview]], true)
require('config/plugins/goto-preview').setup()
time([[Setup for goto-preview]], false)
-- Setup for: undotree
time([[Setup for undotree]], true)
require("config/plugins/undotree").entrance()
time([[Setup for undotree]], false)
-- Setup for: neorg
time([[Setup for neorg]], true)
require('config/plugins/neorg').setup()
time([[Setup for neorg]], false)
-- Setup for: targets.vim
time([[Setup for targets.vim]], true)
require("config/plugins/targets").entrance()
time([[Setup for targets.vim]], false)
time([[packadd for targets.vim]], true)
vim.cmd [[packadd targets.vim]]
time([[packadd for targets.vim]], false)
-- Setup for: twilight.nvim
time([[Setup for twilight.nvim]], true)
require('config/plugins/twilight').setup()
time([[Setup for twilight.nvim]], false)
time([[packadd for twilight.nvim]], true)
vim.cmd [[packadd twilight.nvim]]
time([[packadd for twilight.nvim]], false)
-- Setup for: neogen
time([[Setup for neogen]], true)
require('config/plugins/neogen').setup()
time([[Setup for neogen]], false)
-- Setup for: iswap.nvim
time([[Setup for iswap.nvim]], true)
require('config/plugins/iswap').setup()
time([[Setup for iswap.nvim]], false)
-- Setup for: telescope.nvim
time([[Setup for telescope.nvim]], true)
require('config/plugins/telescope').setup()
time([[Setup for telescope.nvim]], false)
-- Setup for: neo-tree.nvim
time([[Setup for neo-tree.nvim]], true)
require('config/plugins/neo-tree').setup()
time([[Setup for neo-tree.nvim]], false)
-- Setup for: vim-wordmotion
time([[Setup for vim-wordmotion]], true)
require("config/plugins/vim-wordmotion").entrance()
time([[Setup for vim-wordmotion]], false)
-- Setup for: symbols-outline.nvim
time([[Setup for symbols-outline.nvim]], true)
require('config/plugins/symbols-outline').setup()
time([[Setup for symbols-outline.nvim]], false)
-- Setup for: markdown-preview.nvim
time([[Setup for markdown-preview.nvim]], true)
try_loadstring("\27LJ\2\nY\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\5\0\0\rmarkdown\20pandoc.markdown\brmd\fvimwiki\19mkdp_filetypes\6g\bvim\0", "setup", "markdown-preview.nvim")
time([[Setup for markdown-preview.nvim]], false)
-- Setup for: TrueZen.nvim
time([[Setup for TrueZen.nvim]], true)
require('config/plugins/truezen').setup()
time([[Setup for TrueZen.nvim]], false)
-- Setup for: switch.vim
time([[Setup for switch.vim]], true)
require('config/plugins/switch').setup()
time([[Setup for switch.vim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
require('config/plugins/nvim-notify').config()
time([[Config for nvim-notify]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
require('config/plugins/toggleterm').config()
time([[Config for toggleterm.nvim]], false)
-- Config for: hydra.nvim
time([[Config for hydra.nvim]], true)
require('config/plugins/hydra').config()
time([[Config for hydra.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
require('config/plugins/comment').config()
time([[Config for Comment.nvim]], false)
-- Config for: auto-session
time([[Config for auto-session]], true)
require('config/plugins/auto-session').config()
time([[Config for auto-session]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
require('config/plugins/nvim-autopairs').config()
time([[Config for nvim-autopairs]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
require('config/plugins/lualine').config()
time([[Config for lualine.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n•\2\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\14operators\1\0\t\6c\vChange\azf\16Create fold\6v\26Visual Character Mode\6y\16Yank (copy)\6!#Filter though external program\ag~\16Toggle case\agu\14Lowercase\agU\14Uppercase\6d\vDelete\fplugins\1\0\0\fpresets\1\0\0\1\0\1\14operators\1\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: rest.nvim
time([[Config for rest.nvim]], true)
require('config/plugins/rest').config()
time([[Config for rest.nvim]], false)
-- Config for: vim-unimpaired
time([[Config for vim-unimpaired]], true)
require('config/plugins/vim-unimpaired').config()
time([[Config for vim-unimpaired]], false)
-- Config for: accelerated-jk
time([[Config for accelerated-jk]], true)
require('config/plugins/accelerated-jk').config()
time([[Config for accelerated-jk]], false)
-- Config for: tabby.nvim
time([[Config for tabby.nvim]], true)
require('config/plugins/tabby').config()
time([[Config for tabby.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
require('config/plugins/trouble').config()
time([[Config for trouble.nvim]], false)
-- Config for: nvim-scrollbar
time([[Config for nvim-scrollbar]], true)
require('config/plugins/nvim-scrollbar').config()
time([[Config for nvim-scrollbar]], false)
-- Config for: dressing.nvim
time([[Config for dressing.nvim]], true)
require('config/plugins/dressing').config()
time([[Config for dressing.nvim]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
require('config/plugins/project').config()
time([[Config for project.nvim]], false)
-- Config for: nvim-pqf.git
time([[Config for nvim-pqf.git]], true)
require('config/plugins/gitlab').config()
time([[Config for nvim-pqf.git]], false)
-- Config for: stabilize.nvim
time([[Config for stabilize.nvim]], true)
require('config/plugins/stabilize').config()
time([[Config for stabilize.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
require('config/plugins/indent-blankline').config()
time([[Config for indent-blankline.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd impatient.nvim ]]
vim.cmd [[ packadd sqlite.lua ]]
vim.cmd [[ packadd nvim-lspconfig ]]
vim.cmd [[ packadd null-ls.nvim ]]

-- Config for: null-ls.nvim
require('config/plugins/null-ls').config()

vim.cmd [[ packadd lua-dev.nvim ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file G lua require("packer.load")({'vim-fugitive'}, { cmd = "G", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Git lua require("packer.load")({'vim-fugitive'}, { cmd = "Git", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Ggrep lua require("packer.load")({'vim-fugitive'}, { cmd = "Ggrep", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ISwap lua require("packer.load")({'iswap.nvim'}, { cmd = "ISwap", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ISwapWith lua require("packer.load")({'iswap.nvim'}, { cmd = "ISwapWith", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file IronReplHere lua require("packer.load")({'iron.nvim'}, { cmd = "IronReplHere", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gcd lua require("packer.load")({'vim-fugitive'}, { cmd = "Gcd", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Glcd lua require("packer.load")({'vim-fugitive'}, { cmd = "Glcd", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Coverage lua require("packer.load")({'nvim-coverage'}, { cmd = "Coverage", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CoverageLoad lua require("packer.load")({'nvim-coverage'}, { cmd = "CoverageLoad", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CoverageShow lua require("packer.load")({'nvim-coverage'}, { cmd = "CoverageShow", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gtabedit lua require("packer.load")({'vim-fugitive'}, { cmd = "Gtabedit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gpedit lua require("packer.load")({'vim-fugitive'}, { cmd = "Gpedit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CoverageClear lua require("packer.load")({'nvim-coverage'}, { cmd = "CoverageClear", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CoverageSummary lua require("packer.load")({'nvim-coverage'}, { cmd = "CoverageSummary", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gwrite lua require("packer.load")({'vim-fugitive'}, { cmd = "Gwrite", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'vim-startuptime'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gdiffsplit lua require("packer.load")({'vim-fugitive'}, { cmd = "Gdiffsplit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gvdiffsplit lua require("packer.load")({'vim-fugitive'}, { cmd = "Gvdiffsplit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Ghdiffsplit lua require("packer.load")({'vim-fugitive'}, { cmd = "Ghdiffsplit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GMove lua require("packer.load")({'vim-fugitive'}, { cmd = "GMove", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GRename lua require("packer.load")({'vim-fugitive'}, { cmd = "GRename", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GDelete lua require("packer.load")({'vim-fugitive'}, { cmd = "GDelete", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GRemove lua require("packer.load")({'vim-fugitive'}, { cmd = "GRemove", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GUnlink lua require("packer.load")({'vim-fugitive'}, { cmd = "GUnlink", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GBrowse lua require("packer.load")({'vim-fugitive'}, { cmd = "GBrowse", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gedit lua require("packer.load")({'vim-fugitive'}, { cmd = "Gedit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Neotree lua require("packer.load")({'neo-tree.nvim'}, { cmd = "Neotree", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSPlaygroundToggle lua require("packer.load")({'playground'}, { cmd = "TSPlaygroundToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file PasteImg lua require("packer.load")({'clipboard-image.nvim'}, { cmd = "PasteImg", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Dash lua require("packer.load")({'dash.vim'}, { cmd = "Dash", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSHighlightCapturesUnderCursor lua require("packer.load")({'playground'}, { cmd = "TSHighlightCapturesUnderCursor", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gsplit lua require("packer.load")({'vim-fugitive'}, { cmd = "Gsplit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Glow lua require("packer.load")({'glow.nvim'}, { cmd = "Glow", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HelpfulVersion lua require("packer.load")({'helpful.vim'}, { cmd = "HelpfulVersion", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SymbolsOutlineClose lua require("packer.load")({'symbols-outline.nvim'}, { cmd = "SymbolsOutlineClose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SymbolsOutlineOpen lua require("packer.load")({'symbols-outline.nvim'}, { cmd = "SymbolsOutlineOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SymbolsOutline lua require("packer.load")({'symbols-outline.nvim'}, { cmd = "SymbolsOutline", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NeorgStart lua require("packer.load")({'neorg'}, { cmd = "NeorgStart", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gread lua require("packer.load")({'vim-fugitive'}, { cmd = "Gread", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gwq lua require("packer.load")({'vim-fugitive'}, { cmd = "Gwq", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Dispatch lua require("packer.load")({'vim-dispatch'}, { cmd = "Dispatch", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Make lua require("packer.load")({'vim-dispatch'}, { cmd = "Make", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Focus lua require("packer.load")({'vim-dispatch'}, { cmd = "Focus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Start lua require("packer.load")({'vim-dispatch'}, { cmd = "Start", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gdrop lua require("packer.load")({'vim-fugitive'}, { cmd = "Gdrop", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file IronRepl lua require("packer.load")({'iron.nvim'}, { cmd = "IronRepl", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file IronSend lua require("packer.load")({'iron.nvim'}, { cmd = "IronSend", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gvsplit lua require("packer.load")({'vim-fugitive'}, { cmd = "Gvsplit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TZAtaraxis lua require("packer.load")({'TrueZen.nvim'}, { cmd = "TZAtaraxis", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TZFocus lua require("packer.load")({'TrueZen.nvim'}, { cmd = "TZFocus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gllog lua require("packer.load")({'vim-fugitive'}, { cmd = "Gllog", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TZMinimalist lua require("packer.load")({'TrueZen.nvim'}, { cmd = "TZMinimalist", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Glgrep lua require("packer.load")({'vim-fugitive'}, { cmd = "Glgrep", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gclog lua require("packer.load")({'vim-fugitive'}, { cmd = "Gclog", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Octo lua require("packer.load")({'octo.nvim'}, { cmd = "Octo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DashKeywords lua require("packer.load")({'dash.vim'}, { cmd = "DashKeywords", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Sayonara lua require("packer.load")({'vim-sayonara'}, { cmd = "Sayonara", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Neogit lua require("packer.load")({'neogit'}, { cmd = "Neogit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CoverageToggle lua require("packer.load")({'nvim-coverage'}, { cmd = "CoverageToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CoverageHide lua require("packer.load")({'nvim-coverage'}, { cmd = "CoverageHide", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <Plug>(Switch) <cmd>lua require("packer.load")({'switch.vim'}, { keys = "<lt>Plug>(Switch)", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> `<CR> <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "`<lt>CR>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>DashSearch <cmd>lua require("packer.load")({'dash.vim'}, { keys = "<lt>Plug>DashSearch", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <localleader>d <cmd>lua require("packer.load")({'neogen'}, { keys = "<lt>localleader>d", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> g'! <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "g'!", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>DashGlobalSearch <cmd>lua require("packer.load")({'dash.vim'}, { keys = "<lt>Plug>DashGlobalSearch", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> g'<Space> <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "g'<lt>Space>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <localleader>dc <cmd>lua require("packer.load")({'neogen'}, { keys = "<lt>localleader>dc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <localleader>df <cmd>lua require("packer.load")({'neogen'}, { keys = "<lt>localleader>df", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gp <cmd>lua require("packer.load")({'goto-preview'}, { keys = "gp", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> `<Space> <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "`<lt>Space>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> `? <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "`?", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> g'<CR> <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "g'<lt>CR>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> m<Space> <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "m<lt>Space>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> g'? <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "g'?", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> m! <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "m!", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> m<CR> <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "m<lt>CR>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> m? <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "m?", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> '<CR> <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "'<lt>CR>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> '! <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "'!", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> `! <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "`!", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> '<Space> <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "'<lt>Space>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> '? <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "'?", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType vue ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "vue" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescriptreact ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "typescriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascriptreact ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "javascriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType json ++once lua require("packer.load")({'package-info.nvim'}, { ft = "json" }, _G.packer_plugins)]]
vim.cmd [[au FileType svelte ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "svelte" }, _G.packer_plugins)]]
vim.cmd [[au FileType pandoc.markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "pandoc.markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType rmd ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "rmd" }, _G.packer_plugins)]]
vim.cmd [[au FileType vimwiki ++once lua require("packer.load")({'clipboard-image.nvim', 'markdown-preview.nvim'}, { ft = "vimwiki" }, _G.packer_plugins)]]
vim.cmd [[au FileType fish ++once lua require("packer.load")({'vim-fish'}, { ft = "fish" }, _G.packer_plugins)]]
vim.cmd [[au FileType gomod ++once lua require("packer.load")({'go.nvim'}, { ft = "gomod" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'clipboard-image.nvim', 'markdown-preview.nvim', 'nvim-ts-autotag'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType norg ++once lua require("packer.load")({'neorg'}, { ft = "norg" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'go.nvim'}, { ft = "go" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au ColorScheme * ++once lua require("packer.load")({'presence.nvim'}, { event = "ColorScheme *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'LuaSnip', 'vim-arpeggio'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufNewFile * ++once lua require("packer.load")({'vim-textobj-comment', 'nvim-colorizer.lua', 'vim-asterisk', 'nvim-treesitter', 'vim-surround', 'vim-matchup', 'gitsigns.nvim', 'git-conflict.nvim'}, { event = "BufNewFile *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'vim-textobj-comment', 'nvim-colorizer.lua', 'vim-asterisk', 'nvim-treesitter', 'vim-surround', 'vim-matchup', 'gitsigns.nvim', 'git-conflict.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au CmdlineEnter * ++once lua require("packer.load")({'LuaSnip'}, { event = "CmdlineEnter *" }, _G.packer_plugins)]]
vim.cmd [[au CmdwinEnter * ++once lua require("packer.load")({'LuaSnip'}, { event = "CmdwinEnter *" }, _G.packer_plugins)]]
vim.cmd [[au CursorHold * ++once lua require("packer.load")({'LuaSnip'}, { event = "CursorHold *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'vim-wordmotion', 'auto-dark-mode.nvim', 'vim-niceblock', 'undotree'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
  -- Function lazy-loads
time([[Defining lazy-load function autocommands]], true)
vim.cmd[[au FuncUndefined repeat#set ++once lua require("packer.load")({'vim-repeat'}, {}, _G.packer_plugins)]]
time([[Defining lazy-load function autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/rasnauf/.local/share/nvim/site/pack/packer/opt/vim-fish/ftdetect/fish.vim]], true)
vim.cmd [[source /Users/rasnauf/.local/share/nvim/site/pack/packer/opt/vim-fish/ftdetect/fish.vim]]
time([[Sourcing ftdetect script at: /Users/rasnauf/.local/share/nvim/site/pack/packer/opt/vim-fish/ftdetect/fish.vim]], false)
time([[Sourcing ftdetect script at: /Users/rasnauf/.local/share/nvim/site/pack/packer/opt/neorg/ftdetect/norg.vim]], true)
vim.cmd [[source /Users/rasnauf/.local/share/nvim/site/pack/packer/opt/neorg/ftdetect/norg.vim]]
time([[Sourcing ftdetect script at: /Users/rasnauf/.local/share/nvim/site/pack/packer/opt/neorg/ftdetect/norg.vim]], false)
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
