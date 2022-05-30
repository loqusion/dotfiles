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
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\fComment\frequire\0" },
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
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["accelerated-jk"] = {
    config = { "require('config.accelerated_jk')" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/accelerated-jk",
    url = "https://github.com/rhysd/accelerated-jk"
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
    config = { "require('cmp-npm').setup()" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/cmp-npm",
    url = "https://github.com/David-Kunz/cmp-npm"
  },
  ["cmp-nvim-lsp"] = {
    after_files = { "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
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
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/cmp-under-comparator",
    url = "https://github.com/lukas-reineke/cmp-under-comparator"
  },
  ["dash.vim"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/dash.vim",
    url = "https://github.com/rizzatti/dash.vim"
  },
  ["denops.vim"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/denops.vim",
    url = "https://github.com/vim-denops/denops.vim"
  },
  ["fuzzy-motion.vim"] = {
    config = { "require('config.fuzzy_motion')" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/fuzzy-motion.vim",
    url = "https://github.com/yuki-yano/fuzzy-motion.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "require('config.gitsigns')" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/gruvbox-material",
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
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["iron.nvim"] = {
    commands = { "IronRepl", "IronSend", "IronReplHere" },
    config = { "require('config.iron')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/iron.nvim",
    url = "https://github.com/hkupty/iron.nvim"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim",
    url = "https://github.com/folke/lsp-colors.nvim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/lsp-status.nvim",
    url = "https://github.com/nvim-lua/lsp-status.nvim"
  },
  ["lsp_signature.nvim"] = {
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
  neogen = {
    config = { "require('config.neogen')" },
    keys = { { "", "<localleader>d" }, { "", "<localleader>df" }, { "", "<localleader>dc" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/neogen",
    url = "https://github.com/danymat/neogen"
  },
  neogit = {
    commands = { "Neogit" },
    config = { "require('config.neogit')" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "require('config.autopairs')" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "cmp-cmdline", "cmp-nvim-lua", "cmp-path", "cmp-nvim-lsp-document-symbol", "cmp-nvim-lsp-signature-help", "cmp-npm", "cmp-buffer", "cmp-nvim-lsp" },
    config = { "require('config.cmp')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n≈\1\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\6\nnames\2\vhsl_fn\2\vrgb_fn\2\rRRGGBBAA\2\vRRGGBB\2\bRGB\2\1\v\0\0\bcss\thtml\15javascript\20javascriptreact\tsass\tscss\15typescript\20typescriptreact\bvim\bvue\nsetup\14colorizer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    after = { "nvim-dap-ui" },
    config = { "require('config.dap')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap",
    wants = { "one-small-step-for-vimkind" }
  },
  ["nvim-dap-python"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/nvim-dap-python",
    url = "https://github.com/mfussenegger/nvim-dap-python"
  },
  ["nvim-dap-ui"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ndapui\frequire\0" },
    load_after = {
      ["nvim-dap"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-lightbulb"] = {
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
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-endwise"] = {
    load_after = {},
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
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["one-small-step-for-vimkind"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/one-small-step-for-vimkind",
    url = "https://github.com/jbyuki/one-small-step-for-vimkind"
  },
  ["open-browser.vim"] = {
    config = { "require('config.open_browser')" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/open-browser.vim",
    url = "https://github.com/tyru/open-browser.vim"
  },
  ["package-info.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17package-info\frequire\0" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/package-info.nvim",
    url = "https://github.com/vuki656/package-info.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/packer.nvim",
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
  ["registers.nvim"] = {
    config = { "require('config.registers')" },
    keys = { { "n", '"' }, { "i", "<c-r>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/registers.nvim",
    url = "https://github.com/tversteeg/registers.nvim"
  },
  ["remote-viewer"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/remote-viewer",
    url = "https://github.com/bounceme/remote-viewer"
  },
  ["rust-tools.nvim"] = {
    config = { "require('rust-tools').setup({})" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["space-vim-theme"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/space-vim-theme",
    url = "https://github.com/liuchengxu/space-vim-theme"
  },
  ["splitjoin.vim"] = {
    config = { "require('config.splitjoin')" },
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
  ["targets.vim"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  ["telescope-dap.nvim"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim",
    url = "https://github.com/nvim-telescope/telescope-dap.nvim"
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
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    after = { "telescope-frecency.nvim" },
    commands = { "Telescope" },
    config = { "require('config.telescope')" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "/Users/rasnauf/Projects/telescope.nvim",
    wants = { "popup.nvim", "plenary.nvim", "telescope-frecency.nvim", "telescope-fzf-native.nvim" }
  },
  ["toggleterm.nvim"] = {
    config = { "require('config.toggleterm')" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  undotree = {
    commands = { "UndotreeToggle" },
    config = { "vim.g.undotree_SetFocusWhenToggle = 1" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-arpeggio"] = {
    config = { "require('config.arpeggio')" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-arpeggio",
    url = "https://github.com/kana/vim-arpeggio"
  },
  ["vim-cool"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-cool",
    url = "https://github.com/romainl/vim-cool"
  },
  ["vim-dirvish"] = {
    config = { "\27LJ\2\np\0\0\3\0\5\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\3\0'\2\4\0B\0\2\1K\0\1\0002autocmd FileType dirvish silent sort ,^.*[/],\bcmd\17dirvish_mode\6g\bvim\0" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-dirvish",
    url = "https://github.com/justinmk/vim-dirvish"
  },
  ["vim-dispatch"] = {
    commands = { "Dispatch", "Make", "Focus", "Start" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/vim-dispatch",
    url = "https://github.com/tpope/vim-dispatch"
  },
  ["vim-eft"] = {
    config = { "require('config.eft')" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-eft",
    url = "https://github.com/hrsh7th/vim-eft"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-eunuch",
    url = "https://github.com/tpope/vim-eunuch"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-grepper"] = {
    commands = { "Grepper" },
    keys = { { "", "<plug>(GrepperOperator)" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/vim-grepper",
    url = "https://github.com/mhinz/vim-grepper"
  },
  ["vim-jplus"] = {
    config = { "require('config.jplus')" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-jplus",
    url = "https://github.com/osyo-manga/vim-jplus"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-markdown",
    url = "https://github.com/preservim/vim-markdown"
  },
  ["vim-matchup"] = {
    config = { "require('config.matchup')" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-niceblock"] = {
    config = { "require('config.niceblock')" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-niceblock",
    url = "https://github.com/kana/vim-niceblock"
  },
  ["vim-obsession"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-obsession",
    url = "https://github.com/tpope/vim-obsession"
  },
  ["vim-prosession"] = {
    config = { "require('config.prosession')" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/vim-prosession",
    url = "https://github.com/dhruvasagar/vim-prosession"
  },
  ["vim-python-pep8-indent"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-python-pep8-indent",
    url = "https://github.com/Vimjas/vim-python-pep8-indent"
  },
  ["vim-qf"] = {
    config = { "require('config.qf')" },
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
    config = { "require('config.unimpaired')" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["vim-wordmotion"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-wordmotion",
    url = "https://github.com/chaoren/vim-wordmotion"
  },
  ["vimdoc-ja"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vimdoc-ja",
    url = "https://github.com/vim-jp/vimdoc-ja"
  },
  vimwiki = {
    keys = { { "", "<Plug>Vimwiki" } },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/vimwiki",
    url = "https://github.com/vimwiki/vimwiki"
  },
  ["vinarise.vim"] = {
    commands = { "Vinarise" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/vinarise.vim",
    url = "https://github.com/Shougo/vinarise.vim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^dap"] = "nvim-dap",
  ["^iron"] = "iron.nvim",
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

-- Setup for: iron.nvim
time([[Setup for iron.nvim]], true)
require('config.iron_setup')
time([[Setup for iron.nvim]], false)
-- Setup for: vim-grepper
time([[Setup for vim-grepper]], true)
require('config.grepper')
time([[Setup for vim-grepper]], false)
-- Setup for: telescope.nvim
time([[Setup for telescope.nvim]], true)
require('config.telescope_setup')
time([[Setup for telescope.nvim]], false)
-- Setup for: vinarise.vim
time([[Setup for vinarise.vim]], true)
vim.g.vinarise_enable_auto_detect = 1
time([[Setup for vinarise.vim]], false)
-- Setup for: nvim-dap
time([[Setup for nvim-dap]], true)
require('config.dap_setup')
time([[Setup for nvim-dap]], false)
-- Setup for: switch.vim
time([[Setup for switch.vim]], true)
vim.g.switch_mapping = '_'
time([[Setup for switch.vim]], false)
-- Setup for: vimwiki
time([[Setup for vimwiki]], true)
require('config.vimwiki')
time([[Setup for vimwiki]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
require('config.gitsigns')
time([[Config for gitsigns.nvim]], false)
-- Config for: vim-eft
time([[Config for vim-eft]], true)
require('config.eft')
time([[Config for vim-eft]], false)
-- Config for: vim-qf
time([[Config for vim-qf]], true)
require('config.qf')
time([[Config for vim-qf]], false)
-- Config for: accelerated-jk
time([[Config for accelerated-jk]], true)
require('config.accelerated_jk')
time([[Config for accelerated-jk]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
require('config.autopairs')
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Config for: vim-unimpaired
time([[Config for vim-unimpaired]], true)
require('config.unimpaired')
time([[Config for vim-unimpaired]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: vim-dirvish
time([[Config for vim-dirvish]], true)
try_loadstring("\27LJ\2\np\0\0\3\0\5\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\3\0'\2\4\0B\0\2\1K\0\1\0002autocmd FileType dirvish silent sort ,^.*[/],\bcmd\17dirvish_mode\6g\bvim\0", "config", "vim-dirvish")
time([[Config for vim-dirvish]], false)
-- Config for: open-browser.vim
time([[Config for open-browser.vim]], true)
require('config.open_browser')
time([[Config for open-browser.vim]], false)
-- Config for: vim-niceblock
time([[Config for vim-niceblock]], true)
require('config.niceblock')
time([[Config for vim-niceblock]], false)
-- Config for: vim-arpeggio
time([[Config for vim-arpeggio]], true)
require('config.arpeggio')
time([[Config for vim-arpeggio]], false)
-- Config for: vim-matchup
time([[Config for vim-matchup]], true)
require('config.matchup')
time([[Config for vim-matchup]], false)
-- Config for: splitjoin.vim
time([[Config for splitjoin.vim]], true)
require('config.splitjoin')
time([[Config for splitjoin.vim]], false)
-- Config for: vim-jplus
time([[Config for vim-jplus]], true)
require('config.jplus')
time([[Config for vim-jplus]], false)
-- Config for: rust-tools.nvim
time([[Config for rust-tools.nvim]], true)
require('rust-tools').setup({})
time([[Config for rust-tools.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
require('config.toggleterm')
time([[Config for toggleterm.nvim]], false)
-- Config for: fuzzy-motion.vim
time([[Config for fuzzy-motion.vim]], true)
require('config.fuzzy_motion')
time([[Config for fuzzy-motion.vim]], false)
-- Config for: package-info.nvim
time([[Config for package-info.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17package-info\frequire\0", "config", "package-info.nvim")
time([[Config for package-info.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-treesitter ]]
vim.cmd [[ packadd nvim-treesitter-textobjects ]]
vim.cmd [[ packadd vim-obsession ]]
vim.cmd [[ packadd vim-prosession ]]

-- Config for: vim-prosession
require('config.prosession')

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSPlaygroundToggle lua require("packer.load")({'playground'}, { cmd = "TSPlaygroundToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Vinarise lua require("packer.load")({'vinarise.vim'}, { cmd = "Vinarise", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file IronRepl lua require("packer.load")({'iron.nvim'}, { cmd = "IronRepl", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file IronSend lua require("packer.load")({'iron.nvim'}, { cmd = "IronSend", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file IronReplHere lua require("packer.load")({'iron.nvim'}, { cmd = "IronReplHere", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'vim-startuptime'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Dispatch lua require("packer.load")({'vim-dispatch'}, { cmd = "Dispatch", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Make lua require("packer.load")({'vim-dispatch'}, { cmd = "Make", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Focus lua require("packer.load")({'vim-dispatch'}, { cmd = "Focus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Start lua require("packer.load")({'vim-dispatch'}, { cmd = "Start", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Grepper lua require("packer.load")({'vim-grepper'}, { cmd = "Grepper", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HelpfulVersion lua require("packer.load")({'helpful.vim'}, { cmd = "HelpfulVersion", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Neogit lua require("packer.load")({'neogit'}, { cmd = "Neogit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Sayonara lua require("packer.load")({'vim-sayonara'}, { cmd = "Sayonara", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <localleader>d <cmd>lua require("packer.load")({'neogen'}, { keys = "<lt>localleader>d", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <localleader>dc <cmd>lua require("packer.load")({'neogen'}, { keys = "<lt>localleader>dc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[inoremap <silent> <c-r> <cmd>lua require("packer.load")({'registers.nvim'}, { keys = "<lt>c-r>" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>Vimwiki <cmd>lua require("packer.load")({'vimwiki'}, { keys = "<lt>Plug>Vimwiki", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <localleader>df <cmd>lua require("packer.load")({'neogen'}, { keys = "<lt>localleader>df", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <plug>(GrepperOperator) <cmd>lua require("packer.load")({'vim-grepper'}, { keys = "<lt>plug>(GrepperOperator)", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> _ <cmd>lua require("packer.load")({'switch.vim'}, { keys = "_", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> " <cmd>lua require("packer.load")({'registers.nvim'}, { keys = "\"", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType vue ++once lua require("packer.load")({'nvim-colorizer.lua', 'nvim-ts-autotag'}, { ft = "vue" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType scss ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "scss" }, _G.packer_plugins)]]
vim.cmd [[au FileType vim ++once lua require("packer.load")({'nvim-colorizer.lua', 'nvim-treesitter-endwise'}, { ft = "vim" }, _G.packer_plugins)]]
vim.cmd [[au FileType sass ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "sass" }, _G.packer_plugins)]]
vim.cmd [[au FileType css ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-colorizer.lua', 'nvim-ts-autotag'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType ruby ++once lua require("packer.load")({'nvim-treesitter-endwise'}, { ft = "ruby" }, _G.packer_plugins)]]
vim.cmd [[au FileType sh ++once lua require("packer.load")({'nvim-treesitter-endwise'}, { ft = "sh" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascriptreact ++once lua require("packer.load")({'nvim-colorizer.lua', 'nvim-ts-autotag'}, { ft = "javascriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'nvim-treesitter-endwise'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescriptreact ++once lua require("packer.load")({'nvim-colorizer.lua', 'nvim-ts-autotag'}, { ft = "typescriptreact" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au CursorHold * ++once lua require("packer.load")({'nvim-cmp'}, { event = "CursorHold *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-cmp'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
