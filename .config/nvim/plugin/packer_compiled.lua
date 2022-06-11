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
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
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
  ["TrueZen.nvim"] = {
    config = { "\27LJ\2\n'\0\0\2\0\3\0\0056\0\0\0009\0\1\0+\1\1\0=\1\2\0K\0\1\0\tlist\awo\bvim•\2\1\0\r\0\16\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\2\4\0015\4\6\0005\5\5\0=\5\a\4B\2\2\0013\2\t\0=\2\b\0016\2\n\0005\4\v\0B\2\2\4X\5\6Ä9\a\f\0'\t\r\0\18\n\6\0'\v\14\0'\f\15\0B\a\5\1E\5\3\3R\5¯K\0\1\0\24<cmd>TZAtaraxis<cr>\19<localleader>z\23True Zen: Ataraxis\bmap\1\3\0\0\6n\6x\vipairs\0\27after_mode_ataraxis_on\17integrations\1\0\0\1\0\3\flualine\1\rtwilight\1\rgitsigns\2\nsetup\rtrue-zen\bkey\ncrows\frequire\0" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/TrueZen.nvim",
    url = "https://github.com/Pocco81/TrueZen.nvim"
  },
  ["accelerated-jk"] = {
    config = { "\27LJ\2\n™\1\0\0\6\0\n\0\0176\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\30<Plug>(accelerated_jk_gk)\6k\1\0\1\vsilent\2\30<Plug>(accelerated_jk_gj)\6j\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/accelerated-jk",
    url = "https://github.com/rhysd/accelerated-jk"
  },
  ["auto-session"] = {
    config = { "\27LJ\2\n◊\3\0\0\5\0\24\0\0306\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\b\0005\3\a\0=\3\t\0025\3\n\0=\3\v\2B\0\2\0016\0\4\0'\2\f\0B\0\2\0029\0\r\0009\0\14\0005\2\22\0005\3\16\0005\4\15\0=\4\17\0035\4\18\0=\4\19\0035\4\20\0=\4\21\3=\3\23\2B\0\2\1K\0\1\0\14<Leader>l\1\0\0\6d\1\3\0\0\27<cmd>DeleteSession<cr>\19Delete session\6s\1\3\0\0\25<cmd>SaveSession<cr>\17Save session\6r\1\0\0\1\3\0\0\28<cmd>RestoreSession<cr>\20Restore session\tmaps\bkey\ncrows\31auto_session_suppress_dirs\1\4\0\0\6~\15~/Projects\14~/vimwiki\18pre_save_cmds\1\0\0\1\2\0\0\18NvimTreeClose\nsetup\17auto-session\frequire0curdir,folds,help,tabpages,terminal,winsize\19sessionoptions\bopt\bvim\0" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/auto-session",
    url = "https://github.com/rmagatti/auto-session"
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
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fcmp-npm\frequire\0" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/cmp-npm",
    url = "https://github.com/David-Kunz/cmp-npm"
  },
  ["cmp-nvim-lsp"] = {
    config = { "\27LJ\2\nr\0\0\5\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0029\2\4\2B\0\2\1K\0\1\0\24update_capabilities\17cmp_nvim_lsp\20add_caps_setter\14crows.lsp\frequire\0" },
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
  ["dressing.nvim"] = {
    config = { "\27LJ\2\nY\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\ninput\1\0\0\1\0\1\rwinblend\3\0\nsetup\rdressing\frequire\0" },
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
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\nµ\3\0\0\n\0\25\0+6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\5\0009\4\4\0=\4\6\3B\1\2\0016\1\a\0009\1\b\0019\1\t\1'\3\n\0004\4\0\0B\1\3\0026\2\a\0009\2\b\0029\2\v\2'\4\f\0005\5\r\0=\1\14\5B\2\3\0016\2\a\0009\2\b\0029\2\v\2'\4\f\0005\5\15\0=\1\14\0056\6\16\0009\6\17\0069\b\18\0'\t\19\0B\6\3\2=\6\20\0056\6\a\0009\6\21\0069\6\22\0069\6\23\6=\6\24\5B\2\3\1K\0\1\0\rcallback\24formatting_seq_sync\bbuf\blsp\fpattern\6,\vby_lsp\vconcat\ntable\1\0\0\ngroup\1\0\2\fpattern\6*\fcommand\24silent! FormatWrite\17BufWritePost\24nvim_create_autocmd\19format_on_save\24nvim_create_augroup\bapi\bvim\rfiletype\1\0\0\17by_formatter\nsetup\14formatter\20features.format\frequire\0" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0\0\14next_hunkg\1\0\3\1\a\0\0156\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\2Ä'\0\3\0002\0\aÄ6\0\0\0009\0\4\0003\2\5\0B\0\2\1'\0\6\0002\0\0ÄL\0\2\0L\0\2\0\1¿\r<Ignore>\0\rschedule\a]c\tdiff\awo\bvim#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0\0\14prev_hunkg\1\0\3\1\a\0\0156\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\2Ä'\0\3\0002\0\aÄ6\0\0\0009\0\4\0003\2\5\0B\0\2\1'\0\6\0002\0\0ÄL\0\2\0L\0\2\0\1¿\r<Ignore>\0\rschedule\a[c\tdiff\awo\bvim1\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\1¿\1\0\1\tfull\2\15blame_line(\0\0\3\1\2\0\5-\0\0\0009\0\0\0'\2\1\0B\0\2\1K\0\1\0\1¿\6~\rdiffthisÂ\a\1\1\18\0009\0^6\1\0\0009\1\1\0019\1\2\0016\2\3\0'\4\4\0B\2\2\0029\2\5\0023\3\6\0003\4\a\0003\5\b\0003\6\t\0009\a\n\0025\t\f\0005\n\v\0>\3\1\n=\n\r\t5\n\14\0>\4\1\n=\n\15\t5\n\16\0005\v\18\0009\f\17\1>\f\1\v=\v\19\n5\v\21\0009\f\20\1>\f\1\v=\v\22\n5\v\24\0009\f\23\1>\f\1\v=\v\25\n5\v\27\0009\f\26\1>\f\1\v=\v\28\n5\v\29\0>\5\1\v=\v\30\n5\v \0009\f\31\1>\f\1\v=\v!\n5\v#\0009\f\"\1>\f\1\v=\v$\n5\v%\0>\6\1\v=\v&\n5\v(\0009\f'\1>\f\1\v=\v)\n=\n*\tB\a\2\0016\a+\0005\t,\0B\a\2\4X\n\fÄ9\f-\2'\14.\0\18\15\v\0'\16/\0'\0170\0B\f\5\0019\f-\2'\0141\0\18\15\v\0'\0162\0'\0173\0B\f\5\1E\n\3\3R\nÚ6\a+\0005\t4\0B\a\2\4X\n\fÄ9\f-\2'\0145\0\18\15\v\0'\0166\0'\0177\0B\f\5\0019\f-\2'\0145\0\18\15\v\0'\0168\0'\0177\0B\f\5\1E\n\3\3R\nÚ2\0\0ÄK\0\1\0\aac\"<cmd>Gitsigns select_hunk<cr>\aic\thunk\1\3\0\0\6o\6x\29:Gitsigns reset_hunk<cr>\15<leader>gr\15Reset hunk\29:Gitsigns stage_hunk<cr>\15<leader>gs\15Stage hunk\bmap\1\3\0\0\6n\6v\vipairs\14<leader>g\atd\1\3\0\0\0\19Toggle deleted\19toggle_deleted\6D\1\3\0\0\0\rGit diff\6d\1\3\0\0\0\rGit diff\rdiffthis\atb\1\3\0\0\0\30Toggle blame current line\30toggle_current_line_blame\6b\1\3\0\0\0\23Blame current line\6p\1\3\0\0\0\17Preview hunk\17preview_hunk\6R\1\3\0\0\0\25Reset current buffer\17reset_buffer\6u\1\3\0\0\0\26Undo last staged hunk\20undo_stage_hunk\6S\1\3\0\0\0\25Stage current buffer\17stage_buffer\1\0\1\tname\rGitsigns\a[c\1\3\0\0\0\19Goto prev hunk\a]c\1\0\0\1\3\0\0\0\19Goto next hunk\tmaps\0\0\0\0\bkey\ncrows\frequire\rgitsigns\vloaded\fpackageP\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\14on_attach\1\0\0\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["go.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ago\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/go.nvim",
    url = "https://github.com/ray-x/go.nvim"
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
    config = { "\27LJ\2\n–\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\20buftype_exclude\1\0\3\31show_current_context_start\2\25show_current_context\2\19use_treesitter\2\1\a\0\0\thelp\vnofile\fnowrite\rquickfix\rterminal\vprompt\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["iron.nvim"] = {
    commands = { "IronRepl", "IronSend", "IronReplHere" },
    config = { "\27LJ\2\nÍ\1\0\0\a\0\15\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\r\0005\3\3\0005\4\a\0005\5\5\0005\6\4\0=\6\6\5=\5\b\0045\5\n\0005\6\t\0=\6\6\5=\5\v\4=\4\f\3=\3\14\2B\0\2\1K\0\1\0\vconfig\1\0\0\20repl_definition\vpython\1\0\0\1\2\0\0\14ptipython\blua\1\0\0\fcommand\1\0\0\1\2\0\0\14croissant\1\0\3\20should_map_plug\1\14buflisted\1\17scratch_repl\2\nsetup\14iron.core\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/iron.nvim",
    url = "https://github.com/hkupty/iron.nvim"
  },
  ["lightspeed.nvim"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/lightspeed.nvim",
    url = "https://github.com/ggandor/lightspeed.nvim"
  },
  ["lsp-colors.nvim"] = {
    config = { "\27LJ\2\n~\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\4\16Information\f#0db9d7\fWarning\f#e0af68\nError\f#db4b4b\tHint\f#10B981\nsetup\15lsp-colors\frequire\0" },
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
    config = { "\27LJ\2\nÚ\6\0\0\a\0&\0H6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0005\3\3\0006\4\0\0'\6\4\0B\4\2\0029\4\1\4=\4\5\0034\4\0\0=\4\6\3=\3\b\0025\3\n\0005\4\t\0=\4\v\0035\4\f\0005\5\r\0005\6\14\0=\6\15\5>\5\3\4=\4\16\0034\4\3\0005\5\17\0>\5\1\4=\4\18\0034\4\4\0005\5\19\0>\5\1\0045\5\20\0>\5\2\0045\5\21\0>\5\3\4=\4\22\0035\4\23\0=\4\24\0035\4\25\0=\4\26\3=\3\27\0025\3\28\0004\4\0\0=\4\v\0034\4\0\0=\4\16\0035\4\29\0=\4\18\0035\4\30\0=\4\22\0034\4\0\0=\4\24\0034\4\0\0=\4\26\3=\3\31\0025\3!\0005\4 \0=\4\v\0034\4\0\0=\4\16\0034\4\0\0=\4\18\0034\4\0\0=\4\22\0034\4\0\0=\4\24\0035\4\"\0=\4\26\3=\3#\0025\3$\0=\3%\2B\0\2\1K\0\1\0\15extensions\1\5\0\0\rfugitive\rquickfix\20symbols-outline\15toggleterm\ftabline\1\2\0\0\ttabs\1\0\0\1\2\0\0\fbuffers\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\2\1\0\rfiletype\14separator\6|\1\2\2\0\15fileformat\18icons_enabled\1\14separator\6|\1\2\1\0\rencoding\14separator\6|\14lualine_c\1\2\1\0\rfilename\tpath\3\1\14lualine_b\fsources\1\2\0\0\20nvim_diagnostic\1\2\0\0\16diagnostics\1\3\0\0\vbranch\tdiff\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\ntheme\19features.theme\1\0\5\25always_divide_middle\2\25component_separators\5\23section_separators\5\18icons_enabled\2\17globalstatus\1\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
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
    config = { "\27LJ\2\nâ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\17integrations\1\0\2 disable_commit_confirmation\2\18disable_signs\2\1\0\1\rdiffview\2\nsetup\vneogit\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/neogit",
    url = "https://github.com/TimUntersberger/neogit"
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
    config = { "\27LJ\2\nñ\2\0\0\n\0\14\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\2B\0\2\0016\0\0\0'\2\5\0B\0\2\0026\1\0\0'\3\6\0B\1\2\0029\2\a\1\18\4\2\0009\2\b\2'\5\t\0009\6\n\0005\b\f\0005\t\v\0=\t\r\bB\6\2\0A\2\2\1K\0\1\0\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\bcmp\"nvim-autopairs.completion.cmp\14fast_wrap\1\0\2\rcheck_ts\2\30enable_check_bracket_line\2\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "cmp-nvim-lsp-signature-help", "cmp-nvim-lua", "cmp-nvim-lsp-document-symbol", "cmp-cmdline", "cmp-path", "cmp_luasnip", "cmp-under-comparator", "cmp-buffer" },
    config = { "\27LJ\2\nö\1\0\1\3\2\4\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\vÄ-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\3\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\1¿\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleé\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\rÄ-\1\1\0009\1\2\1)\3ˇˇB\1\2\2\15\0\1\0X\2\5Ä-\1\1\0009\1\3\1)\3ˇˇB\1\2\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\1¿\tjump\rjumpable\21select_prev_item\fvisible-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\1¿\tbody\15lsp_expand\19\0\1\3\0\0\0\3\18\1\0\0B\1\1\1K\0\1\0√\f\1\0\19\0V\0–\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\0\0'\5\4\0B\3\2\0029\3\5\0033\4\6\0003\5\a\0009\6\b\0005\b\n\0005\t\t\0=\t\v\b5\t\23\0004\n\t\0009\v\f\0009\v\r\v9\v\14\v>\v\1\n9\v\f\0009\v\r\v9\v\15\v>\v\2\n9\v\f\0009\v\r\v9\v\16\v>\v\3\n\18\v\3\0'\r\17\0'\14\18\0B\v\3\2>\v\4\n9\v\f\0009\v\r\v9\v\19\v>\v\5\n9\v\f\0009\v\r\v9\v\20\v>\v\6\n9\v\f\0009\v\r\v9\v\21\v>\v\a\n9\v\f\0009\v\r\v9\v\22\v>\v\b\n=\n\24\t=\t\25\b5\t\27\0003\n\26\0=\n\28\t=\t\29\b5\t \0009\n\30\0025\f\31\0B\n\2\2=\n!\t=\t\"\b9\t#\0009\t$\t9\t%\t5\v'\0009\f#\0009\f&\f)\14¸ˇB\f\2\2=\f(\v9\f#\0009\f&\f)\14\4\0B\f\2\2=\f)\v9\f#\0009\f*\f4\14\0\0B\f\2\2=\f+\v9\f#\0005\14-\0009\15#\0009\15,\15B\15\1\2=\15.\0149\15#\0009\15/\15B\15\1\2=\0150\14B\f\2\2=\f1\v9\f#\0005\0144\0009\15#\0009\0152\0155\0173\0B\15\2\2=\0150\14B\f\2\2=\f5\v9\f#\0005\14:\0009\15#\0009\0152\0155\0178\0009\0186\0009\0187\18=\0189\17B\15\2\2=\15.\0143\15;\0=\0150\14B\f\2\2=\f<\v9\f#\0\18\14\4\0005\15=\0B\f\3\2=\f>\v9\f#\0\18\14\5\0005\15?\0B\f\3\2=\f@\vB\t\2\2=\t#\b9\t\f\0009\tA\t4\v\5\0005\fB\0>\f\1\v5\fC\0>\f\2\v5\fD\0>\f\3\v5\fE\0>\f\4\v4\f\3\0005\rF\0>\r\1\f5\rG\0>\r\2\fB\t\3\2=\tA\bB\6\2\0019\6\b\0009\6H\6'\bI\0005\tL\0009\n\f\0009\nA\n4\f\3\0005\rJ\0>\r\1\f4\r\3\0005\14K\0>\14\1\rB\n\3\2=\nA\tB\6\3\0019\6\b\0009\6M\6'\bN\0005\tO\0009\n#\0009\n$\n9\nM\nB\n\1\2=\n#\t9\n\f\0009\nA\n4\f\3\0005\rP\0>\r\1\f4\r\3\0005\14Q\0>\14\1\rB\n\3\2=\nA\tB\6\3\0019\6\b\0009\6M\6'\bR\0005\tS\0009\n#\0009\n$\n9\nM\nB\n\1\2=\n#\t9\n\f\0009\nA\n4\f\3\0005\rT\0>\r\1\f4\r\3\0005\14U\0>\14\1\rB\n\3\2=\nA\tB\6\3\0012\0\0ÄK\0\1\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\1\0\0\6:\1\0\1\tname\vbuffer\1\0\1\tname\29nvim_lsp_document_symbol\1\0\0\6/\fcmdline\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\fcmp_git\14gitcommit\rfiletype\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\rnvim_lua\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\1\0\2\19keyword_length\3\4\tname\bnpm\fsources\f<S-Tab>\1\3\0\0\6i\6s\n<Tab>\1\3\0\0\6i\6s\t<CR>\0\1\0\0\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\n<C-y>\1\0\0\1\0\1\vselect\2\fconfirm\n<C-e>\6c\nclose\6i\1\0\0\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-d>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\15formatting\vformat\1\0\0\1\0\2\tmode\vsymbol\rmaxwidth\0032\15cmp_format\fsnippet\vexpand\1\0\0\0\fsorting\16comparators\1\0\0\norder\vlength\14sort_text\tkind\nunder\25cmp-under-comparator\nscore\nexact\voffset\fcompare\vconfig\15completion\1\0\0\1\0\1\16completeopt\21menuone,noselect\nsetup\0\0\17lazy_require\16crows.utils\flspkind\fluasnip\bcmp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    after = { "nvim-dap-ui" },
    config = { "\27LJ\2\n@\0\2\6\0\3\0\b\18\2\0\0005\4\0\0009\5\1\1=\5\1\0049\5\2\1=\5\2\4B\2\2\1K\0\1\0\tport\thost\1\0\1\ttype\vserverZ\0\0\3\0\6\0\n6\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\6\0\4\0X\1\1ÄL\0\2\0'\1\5\0L\1\2\0\014127.0.0.1\5\23Host [127.0.0.1]: \ninput\afn\bvimx\0\0\5\0\a\0\f6\0\0\0006\2\1\0009\2\2\0029\2\3\2'\4\4\0B\2\2\0A\0\0\0026\1\5\0\18\3\0\0'\4\6\0B\1\3\1L\0\2\0!Please provide a port number\vassert\vPort: \ninput\afn\bvim\rtonumberg\0\0\5\0\a\0\f6\0\0\0009\0\1\0009\0\2\0'\2\3\0006\3\0\0009\3\1\0039\3\4\3B\3\1\2'\4\5\0&\3\4\3'\4\6\0D\0\4\0\tfile\6/\vgetcwd\25Path to executable: \ninput\afn\bvim«\3\1\0\5\0\21\0$6\0\0\0'\2\1\0B\0\2\0029\1\2\0003\2\4\0=\2\3\0019\1\5\0004\2\3\0005\3\a\0003\4\b\0=\4\t\0033\4\n\0=\4\v\3>\3\1\2=\2\6\0019\1\2\0005\2\r\0=\2\f\0019\1\5\0004\2\3\0005\3\15\0003\4\16\0=\4\17\0034\4\0\0=\4\18\3>\3\1\2=\2\14\0019\1\5\0009\2\5\0009\2\14\2=\2\19\0019\1\5\0009\2\5\0009\2\14\2=\2\20\1K\0\1\0\trust\6c\targs\fprogram\0\1\0\6\bcwd\23${workspaceFolder}\tname\vLaunch\frequest\vlaunch\18runInTerminal\1\16stopOnEntry\1\ttype\tlldb\bcpp\1\0\3\tname\tlldb\ttype\15executable\fcommand\25/usr/bin/lldb-vscode\tlldb\tport\0\thost\0\1\0\3\frequest\vattach\tname&Attach to running Neovim instance\ttype\tnlua\blua\19configurations\0\tnlua\radapters\bdap\frequire\0" },
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
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n≥\2\0\0\6\0\19\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\t\0005\4\b\0=\4\n\3=\3\v\2B\0\2\0016\0\0\0'\2\f\0B\0\2\0029\0\r\0009\0\14\0'\2\15\0'\3\16\0'\4\17\0'\5\18\0B\0\5\1K\0\1\0\28<cmd>NvimTreeToggle<cr>\19<localleader>f\6n\20Toggle filetree\bmap\bkey\ncrows\ffilters\vcustom\1\0\0\1\2\0\0\n\\.git\tview\1\0\1\15signcolumn\tauto\16diagnostics\1\0\1\venable\2\1\0\2\18disable_netrw\1\15update_cwd\2\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-treesitter-textobjects", "nvim-ts-autotag", "playground", "nvim-treesitter-endwise" },
    loaded = true,
    only_config = true
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
    config = { "\27LJ\2\nŒ\1\0\0\14\0\v\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\3\0005\3\4\0B\1\2\4X\4\nÄ9\6\5\0'\b\6\0\18\t\5\0'\n\a\0'\v\b\0\18\f\5\0'\r\t\0&\v\r\v5\f\n\0B\6\6\1E\4\3\3R\4ÙK\0\1\0\1\0\1\vsilent\2\v')<cr>-<cmd>call vimrc#github_or_open_browser('\agx\20Open in browser\bmap\1\3\0\0\6n\6x\vipairs\bkey\ncrows\frequire\0" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/open-browser.vim",
    url = "https://github.com/tyru/open-browser.vim"
  },
  ["package-info.nvim"] = {
    config = { "\27LJ\2\në\5\0\0\v\0!\0E6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0006\1\0\0'\3\5\0B\1\2\0029\1\6\0019\2\a\0015\4\30\0005\5\n\0005\6\t\0\18\a\0\0'\t\1\0'\n\b\0B\a\3\2>\a\1\6=\6\v\0055\6\r\0\18\a\0\0'\t\1\0'\n\f\0B\a\3\2>\a\1\6=\6\14\0055\6\16\0\18\a\0\0'\t\1\0'\n\15\0B\a\3\2>\a\1\6=\6\17\0055\6\19\0\18\a\0\0'\t\1\0'\n\18\0B\a\3\2>\a\1\6=\6\20\0055\6\22\0\18\a\0\0'\t\1\0'\n\21\0B\a\3\2>\a\1\6=\6\23\0055\6\25\0\18\a\0\0'\t\1\0'\n\24\0B\a\3\2>\a\1\6=\6\26\0055\6\28\0\18\a\0\0'\t\1\0'\n\27\0B\a\3\2>\a\1\6=\6\29\5=\5\31\0045\5 \0B\2\3\1K\0\1\0\1\0\1\vsilent\2\14<leader>n\1\0\0\6p\1\3\0\0\0\27Change package version\19change_version\6r\1\3\0\0\0\27Reinstall dependencies\14reinstall\6i\1\3\0\0\0\26Install a new package\finstall\6d\1\3\0\0\0#Delete package on current line\vdelete\6u\1\3\0\0\0#Update package on current line\vupdate\6c\1\3\0\0\0\26Hide package versions\thide\6s\1\0\0\1\3\0\0\0\26Show package versions\tshow\tmaps\bkey\ncrows\17lazy_require\16crows.utils\nsetup\17package-info\frequire\0" },
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
  ["remote-viewer"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/remote-viewer",
    url = "https://github.com/bounceme/remote-viewer"
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
    config = { "\27LJ\2\nö\2\0\0\5\0\17\0\0236\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\3\0=\1\4\0006\0\5\0'\2\6\0B\0\2\0029\0\a\0009\0\b\0005\2\14\0005\3\n\0005\4\t\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0B\0\3\1K\0\1\0\1\0\1\vsilent\2\r<Leader>\1\0\0\6k\1\3\0\0\27<cmd>SplitjoinJoin<cr>\14Join line\6j\1\0\0\1\3\0\0\28<cmd>SplitjoinSplit<cr>\15Split line\tmaps\bkey\ncrows\frequire\27splitjoin_join_mapping\5\28splitjoin_split_mapping\6g\bvim\0" },
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
    after = { "telescope-ui-select.nvim", "telescope-frecency.nvim", "telescope-fzf-native.nvim", "telescope-dap.nvim" },
    config = { "\27LJ\2\n«\6\0\0\n\0*\1B6\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0B\1\2\0019\1\2\0'\3\4\0B\1\2\0019\1\2\0'\3\5\0B\1\2\0019\1\2\0'\3\6\0B\1\2\0019\1\a\0005\3\26\0005\4\b\0005\5\23\0005\6\t\0006\a\0\0'\t\n\0B\a\2\0029\a\v\a=\a\f\0066\a\0\0'\t\n\0B\a\2\0029\a\r\a=\a\14\0065\a\15\0=\a\16\0065\a\17\0=\a\18\0065\a\19\0=\a\20\0065\a\21\0=\a\22\6=\6\24\5=\5\25\4=\4\27\0035\4\31\0005\5\29\0005\6\28\0=\6\30\5=\5 \4=\4!\0035\4%\0005\5#\0005\6\"\0=\6$\5=\5\3\0045\5&\0=\5\4\0044\5\3\0006\6\0\0'\b'\0B\6\2\0029\6(\0064\b\0\0B\6\2\0?\6\0\0=\5\5\4=\4)\3B\1\2\1K\0\1\0\15extensions\17get_dropdown\21telescope.themes\1\0\4\25override_file_sorter\2\nfuzzy\2\14case_mode\15smart_case\28override_generic_sorter\2\1\0\0\15workspaces\1\0\0\1\0\1\14clientele&/Users/rasnauf/Projects/clientele\fpickers\15find_files\1\0\0\25file_ignore_patterns\1\0\0\1\2\0\0\t.git\rdefaults\1\0\0\rmappings\6i\1\0\0\n<C-e>\1\2\1\0\n<End>\ttype\fcommand\n<C-a>\1\2\1\0\v<Home>\ttype\fcommand\n<M-b>\1\2\1\0\r<S-Left>\ttype\fcommand\n<M-f>\1\2\1\0\14<S-Right>\ttype\fcommand\n<C-d>\25preview_scrolling_up\n<C-f>\27preview_scrolling_down\22telescope.actions\1\0\1\n<C-u>\1\1\0\1\20layout_strategy\tflex\nsetup\bdap\14ui-select\bfzf\rfrecency\19load_extension\14telescope\frequire\3ÄÄ¿ô\4\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim",
    wants = { "popup.nvim", "plenary.nvim", "telescope-frecency.nvim", "telescope-fzf-native.nvim" }
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\në\1\0\1\t\1\n\0\0156\1\0\0009\1\1\1'\3\2\0B\1\2\1-\1\0\0009\1\3\1'\3\4\0'\4\5\0'\5\6\0'\6\a\0005\a\t\0009\b\b\0=\b\b\aB\1\6\1K\0\1\0\0¿\1\0\1\vsilent\2\nbufnr\19<cmd>close<cr>\6q\6n\19Close terminal\bmap\17startinsert!\bcmd\bvim$\0\0\3\1\1\0\5-\0\0\0\18\2\0\0009\0\0\0B\0\2\1K\0\1\0\2¿\vtoggle\v\0\0\1\0\0\0\1K\0\1\0—\5\1\0\n\0%\00096\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\5\0006\4\6\0009\4\a\0049\4\b\4'\6\t\0B\4\2\2=\4\n\3B\1\2\0016\1\0\0'\3\v\0B\1\2\0029\1\f\1\18\4\1\0009\2\r\0015\5\14\0005\6\15\0=\6\16\0053\6\17\0=\6\18\5B\2\3\0026\3\19\0003\4\21\0=\4\20\0036\3\19\0003\4\23\0=\4\22\0039\3\24\0'\5\25\0'\6\26\0'\a\27\0'\b\28\0005\t\29\0B\3\6\0019\3\24\0'\5\30\0'\6\31\0'\a \0'\b!\0B\3\5\0016\3\6\0009\3\"\3'\5#\0B\3\2\0016\3\6\0009\3\"\3'\5$\0B\3\2\0012\0\0ÄK\0\1\0*autocmd! TermOpen term://* set nolist:autocmd! TermOpen term://* lua set_terminal_keymaps()\bcmd\15<C-\\><C-n>\n<Esc>\6t\22Enter normal mode\1\0\1\vsilent\2$<cmd> lua _lazygit_toggle()<cr>\19<localleader>g\6n\17Open lazygit\bmap\0\25set_terminal_keymaps\0\20_lazygit_toggle\a_G\fon_open\0\15float_opts\1\0\1\vborder\vdouble\1\0\4\bdir\fgit_dir\vhidden\2\bcmd\flazygit\14direction\nfloat\bnew\rTerminal\24toggleterm.terminal\nshell\nSHELL\vgetenv\afn\bvim\1\0\3\17open_mapping\n<c-\\>\14direction\nfloat\vborder\vshadow\nsetup\15toggleterm\bkey\ncrows\frequire\0" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n¶\4\0\0\5\0\22\0\0286\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\0\0'\2\6\0B\0\2\0029\0\a\0009\0\b\0005\2\20\0005\3\t\0005\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\0035\4\18\0=\4\19\3=\3\21\2B\0\2\1K\0\1\0\14<leader>x\1\0\0\6q\1\3\0\0\30<cmd>Trouble quickfix<cr>\19Quickfix items\6l\1\3\0\0\29<cmd>Trouble loclist<cr>*Items from the window's location list\6d\1\3\0\0*<cmd>Trouble document_diagnostics<cr>\25Document diagnostics\6w\1\3\0\0+<cmd>Trouble workspace_diagnostics<cr>\26Workspace diagnostics\6x\1\3\0\0\27<cmd>TroubleToggle<cr>\19Toggle Trouble\1\0\1\tname\16lsp trouble\tmaps\bkey\ncrows\nsigns\1\0\0\1\0\5\nother\bÔ´†\fwarning\bÔî©\thint\bÔ†µ\16information\bÔëâ\nerror\bÔôô\nsetup\ftrouble\frequire\0" },
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
    config = { "\27LJ\2\n=\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0 undotree_SetFocusWhenToggle\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-arpeggio"] = {
    config = { "\27LJ\2\nu\0\0\a\0\t\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0)\4\0\0'\5\5\0'\6\6\0B\0\6\0016\0\0\0009\0\a\0)\1<\0=\1\b\0K\0\1\0\24arpeggio_timeoutlen\6g\n<Esc>\ajk\5\6i\17arpeggio#map\afn\bvim\0" },
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
  ["vim-markdown"] = {
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-markdown",
    url = "https://github.com/preservim/vim-markdown"
  },
  ["vim-matchup"] = {
    config = { "\27LJ\2\n”\1\0\0\2\0\6\0\0176\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1d\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0006\0\0\0009\0\1\0)\1\1\0=\1\5\0K\0\1\0\29matchup_surround_enabled*matchup_matchparen_hi_surround_always+matchup_matchparen_deferred_show_delay matchup_matchparen_deferred\6g\bvim\0" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-niceblock"] = {
    config = { "\27LJ\2\nƒ\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0005\2\5\0005\3\4\0=\3\6\0025\3\a\0=\3\b\0025\3\t\0B\0\3\1K\0\1\0\1\0\1\tmode\6x\6A\1\3\0\0\24<Plug>(niceblock-A)\28Append visual selection\6I\1\0\0\1\3\0\0\24<Plug>(niceblock-I)\29Prepend visual selection\tmaps\bkey\ncrows\frequire\0" },
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
    config = { "\27LJ\2\n \1\0\0\5\0\f\0$6\0\0\0009\0\1\0009\0\2\0\18\1\0\0'\3\3\0'\4\4\0B\1\3\1\18\1\0\0'\3\3\0'\4\5\0B\1\3\1\18\1\0\0'\3\3\0'\4\6\0B\1\3\1\18\1\0\0'\3\3\0'\4\a\0B\1\3\1\18\1\0\0'\3\3\0'\4\b\0B\1\3\1\18\1\0\0'\3\3\0'\4\t\0B\1\3\1\18\1\0\0'\3\3\0'\4\n\0B\1\3\1\18\1\0\0'\3\3\0'\4\v\0B\1\3\1K\0\1\0\a>P\a>p\f>s<Esc>\a>s\a<P\a<p\f<s<Esc>\a<s\6n\bdel\vkeymap\bvimË\a\1\0\t\0(\2_6\0\0\0003\1\2\0=\1\1\0006\0\3\0009\0\4\0009\0\5\0\t\0\0\0X\0\3Ä6\0\1\0B\0\1\1X\0\4Ä6\0\3\0009\0\6\0'\2\a\0B\0\2\0015\0\n\0006\1\3\0009\1\b\0019\1\t\1\b\1\1\0X\1\5Ä6\1\3\0009\1\b\0019\1\t\1\14\0\1\0X\2\1Ä)\1\2\0=\1\t\0006\1\3\0009\1\b\0019\1\v\1\b\1\1\0X\1\5Ä6\1\3\0009\1\b\0019\1\v\1\14\0\1\0X\2\1Ä)\1\3\0=\1\v\0006\1\f\0'\3\r\0B\1\2\0029\1\14\0019\1\15\0015\3\24\0005\4\19\0005\5\18\0'\6\16\0009\a\t\0'\b\17\0&\6\b\6>\6\1\5=\5\20\0045\5\22\0'\6\21\0009\a\v\0'\b\17\0&\6\b\6>\6\1\5=\5\23\4=\4\25\0035\4\28\0005\5\27\0'\6\26\0'\a\17\0&\6\a\6>\6\1\5=\5\20\0045\5\30\0'\6\29\0'\a\17\0&\6\a\6>\6\1\5=\5\23\4=\4\31\0035\4#\0005\5\"\0'\6 \0009\a\t\0'\b!\0&\6\b\6>\6\1\5=\5\20\0045\5%\0'\6$\0009\a\v\0'\b!\0&\6\b\6>\6\1\5=\5\23\4=\4&\0035\4'\0B\1\3\1K\0\1\0\1\0\1\vsilent\1\30<Plug>(unimpaired-toggle)\1\3\0\0\0\22Toggle laststatus3:<C-U>set laststatus=<C-R>=&laststatus == 0 ? \1\0\0\1\3\0\0\0\24Toggle conceallevel\17 : 0<CR><CR>7:<C-U>set conceallevel=<C-R>=&conceallevel == 0 ? \31<Plug>(unimpaired-disable)\1\3\0\0\0\23Disable laststatus\27:<C-U>set laststatus=0\1\0\0\1\3\0\0\0\25Disable conceallevel\29:<C-U>set conceallevel=0\30<Plug>(unimpaired-enable)\1\0\0\6g\1\3\0\0\0\22Enable laststatus\26:<C-U>set laststatus=\6a\1\0\0\1\3\0\0\0\24Enable conceallevel\t<CR>\28:<C-U>set conceallevel=\tmaps\bkey\ncrows\frequire\15laststatus\1\0\0\17conceallevel\ago6autocmd VimEnter * ++once lua _unmap_unimpaired()\bcmd\18vim_did_enter\6v\bvim\0\22_unmap_unimpaired\a_G\2\0\0" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["vim-wordmotion"] = {
    config = { "\27LJ\2\nD\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\2\aiw\aiv\aaw\aav\24wordmotion_mappings\6g\bvim\0" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/vim-wordmotion",
    url = "https://github.com/chaoren/vim-wordmotion"
  },
  vimwiki = {
    keys = { { "", "<Plug>Vimwiki" } },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/opt/vimwiki",
    url = "https://github.com/vimwiki/vimwiki"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\nï\2\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\14operators\1\0\t\ag~\16Toggle case\6!#Filter though external program\agu\14Lowercase\azf\16Create fold\agU\14Uppercase\6v\26Visual Character Mode\6c\vChange\6d\vDelete\6y\16Yank (copy)\fplugins\1\0\0\fpresets\1\0\0\1\0\1\14operators\1\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/rasnauf/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
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

-- Setup for: markdown-preview.nvim
time([[Setup for markdown-preview.nvim]], true)
try_loadstring("\27LJ\2\nQ\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\4\0\0\rmarkdown\20pandoc.markdown\brmd\19mkdp_filetypes\6g\bvim\0", "setup", "markdown-preview.nvim")
time([[Setup for markdown-preview.nvim]], false)
-- Setup for: telescope.nvim
time([[Setup for telescope.nvim]], true)
try_loadstring("\27LJ\2\nê\t\0\0\16\0<\0{6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\1\3\0006\2\0\0'\4\4\0B\2\2\0029\2\5\0029\2\6\0025\4:\0005\0053\0005\6\a\0005\a\n\0\18\b\0\0\18\n\1\0'\v\b\0005\f\t\0B\b\4\2>\b\1\a=\a\v\0065\a\18\0\18\b\0\0\18\n\1\0'\v\b\0005\f\16\0006\r\f\0009\r\r\r9\r\14\r'\15\15\0B\r\2\2=\r\17\fB\b\4\2>\b\1\a=\a\19\0065\a\21\0\18\b\0\0\18\n\1\0'\v\20\0B\b\3\2>\b\1\a=\a\22\0065\a\24\0\18\b\0\0\18\n\1\0'\v\23\0B\b\3\2>\b\1\a=\a\25\0065\a\27\0\18\b\0\0\18\n\1\0'\v\26\0B\b\3\2>\b\1\a=\a\28\0065\a\30\0\18\b\0\0\18\n\1\0'\v\29\0B\b\3\2>\b\1\a=\a\31\0065\a!\0\18\b\0\0\18\n\1\0'\v \0B\b\3\2>\b\1\a=\a\"\0065\a$\0\18\b\0\0\18\n\1\0'\v#\0B\b\3\2>\b\1\a=\a%\0065\a'\0\18\b\0\0\18\n\1\0'\v&\0B\b\3\2>\b\1\a=\a(\0065\a*\0\18\b\0\0\18\n\1\0'\v)\0B\b\3\2>\b\1\a=\a+\0065\a.\0006\b\0\0'\n,\0B\b\2\0029\b-\b>\b\1\a=\a/\0065\a1\0\18\b\0\0\18\n\1\0'\v0\0B\b\3\2>\b\1\a=\a2\6=\6/\0055\0065\0\18\a\0\0\18\t\1\0'\n4\0B\a\3\2>\a\1\6=\0066\0055\0068\0\18\a\0\0\18\t\1\0'\n7\0B\a\3\2>\a\1\6=\0069\5=\5;\4B\2\2\1K\0\1\0\r<leader>\1\0\0\6?\1\3\0\0\0\18Find oldfiles\roldfiles\f<space>\1\3\0\0\0\fBuffers\fbuffers\1\0\0\6'\1\3\0\0\0\17Search marks\nmarks\6s\1\3\0\0\0\19Search Session\19search_session\17session-lens\6o\1\3\0\0\0$Search current document symbols\25lsp_document_symbols\6r\1\3\0\0\0'Search LSP references in workspace\19lsp_references\6p\1\3\0\0\0\18Grep in files\14live_grep\6d\1\3\0\0\0\27Grep word under cursor\16grep_string\6T\1\3\0\0\0\23Select colorscheme\16colorscheme\6t\1\3\0\0\0\14Find tags\ttags\6h\1\3\0\0\0\14Find help\14help_tags\6b\1\3\0\0\0\27Find in current buffer\30current_buffer_fuzzy_find\6v\1\3\0\0\0\23Find in Vim config\bcwd\1\0\0\vconfig\fstdpath\afn\bvim\6f\1\3\0\0\0\15Find files\1\0\1\vhidden\2\15find_files\1\0\1\tname\21telescope search\tmaps\bkey\ncrows\22telescope.builtin\17lazy_require\16crows.utils\frequire\0", "setup", "telescope.nvim")
time([[Setup for telescope.nvim]], false)
-- Setup for: neogen
time([[Setup for neogen]], true)
try_loadstring("\27LJ\2\nø\2\0\0\5\0\v\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0005\2\t\0005\3\4\0005\4\5\0=\4\6\0035\4\a\0=\4\b\3=\3\n\2B\0\2\1K\0\1\0\19<localleader>d\1\0\0\6c\1\3\0\0@<cmd>lua require(\"neogen\").generate({ type = \"class\" })<cr>\31Generate class annotations\6f\1\3\0\0?<cmd>lua require(\"neogen\").generate({ type = \"func\" })<cr>\"Generate function annotations\1\0\1\tname\23Neogen annotations\tmaps\bkey\ncrows\frequire\0", "setup", "neogen")
time([[Setup for neogen]], false)
-- Setup for: twilight.nvim
time([[Setup for twilight.nvim]], true)
try_loadstring("\27LJ\2\n°\1\0\0\f\0\t\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\3\0005\3\4\0B\1\2\4X\4\6Ä9\6\5\0'\b\6\0\18\t\5\0'\n\a\0'\v\b\0B\6\5\1E\4\3\3R\4¯K\0\1\0\22<cmd>Twilight<cr>\19<localleader>t\20Toggle dim text\bmap\1\3\0\0\6n\6x\vipairs\bkey\ncrows\frequire\0", "setup", "twilight.nvim")
time([[Setup for twilight.nvim]], false)
time([[packadd for twilight.nvim]], true)
vim.cmd [[packadd twilight.nvim]]
time([[packadd for twilight.nvim]], false)
-- Setup for: nvim-dap
time([[Setup for nvim-dap]], true)
try_loadstring("\27LJ\2\n–\4\0\0\5\0\22\0%6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0004\4\0\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0'\2\5\0'\3\6\0004\4\0\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0'\3\b\0004\4\0\0B\0\4\0016\0\t\0'\2\n\0B\0\2\0029\0\v\0009\0\f\0005\2\14\0005\3\r\0=\3\15\0025\3\16\0=\3\17\0025\3\18\0=\3\19\0025\3\20\0=\3\21\2B\0\2\1K\0\1\0\n<F12>\1\3\0\0'<cmd>lua require(\"dap\").step_out()\20Debug: Step out\n<F11>\1\3\0\0(<cmd>lua require(\"dap\").step_into()\21Debug: Step into\n<F10>\1\3\0\0(<cmd>lua require(\"dap\").step_over()\21Debug: Step over\t<F5>\1\0\0\1\3\0\0'<cmd>lua require(\"dap\").continue()\20Debug: Continue\tmaps\bkey\ncrows\frequire#lua require(\"dap\").repl.open()\fDapREPL\"lua require(\"dap\").continue()\nDebug+lua require(\"dap\").toggle_breakpoint()\21BreakpointToggle\29nvim_create_user_command\bapi\bvim\0", "setup", "nvim-dap")
time([[Setup for nvim-dap]], false)
-- Setup for: symbols-outline.nvim
time([[Setup for symbols-outline.nvim]], true)
try_loadstring("\27LJ\2\nâ\1\0\0\6\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0'\2\4\0'\3\5\0'\4\6\0'\5\a\0B\0\5\1K\0\1\0\28<cmd>SymbolsOutline<cr>\19<localleader>o\6n\27Toggle symbols outline\bmap\bkey\ncrows\frequire\0", "setup", "symbols-outline.nvim")
time([[Setup for symbols-outline.nvim]], false)
-- Setup for: iron.nvim
time([[Setup for iron.nvim]], true)
try_loadstring("\27LJ\2\n√\5\0\0\17\0&\0\\6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\1\4\1\18\2\0\0'\4\5\0'\5\6\0'\6\a\0B\2\4\0029\3\b\0015\5\30\0005\6\26\0005\a\t\0005\b\v\0\18\t\0\0'\v\5\0'\f\n\0B\t\3\2>\t\1\b=\b\f\a5\b\14\0\18\t\0\0'\v\5\0'\f\r\0B\t\3\2>\t\1\b=\b\15\a5\b\19\0\18\t\0\0'\v\5\0'\f\16\0+\r\0\0006\14\17\0009\14\18\14)\16\r\0B\14\2\0A\t\3\2>\t\1\b=\b\20\a5\b\21\0\18\t\0\0'\v\5\0'\f\16\0+\r\0\0006\14\17\0009\14\18\14)\16\3\0B\14\2\0A\t\3\2>\t\1\b=\b\22\a5\b\24\0\18\t\0\0'\v\5\0'\f\23\0B\t\3\2>\t\1\b=\b\25\a=\a\27\0065\a\28\0\18\b\0\0'\n\5\0'\v\16\0+\f\0\0006\r\17\0009\r\18\r)\15\f\0B\r\2\0A\b\3\2>\b\1\a=\a\29\6=\6\22\0055\6\31\0B\3\3\0016\3 \0005\5!\0B\3\2\4X\6\aÄ9\b\"\1'\n#\0\18\v\a\0'\f$\0\18\r\2\0005\14%\0B\b\6\1E\6\3\3R\6˜K\0\1\0\1\0\1\vsilent\2\14<Space>sc\16Send motion\bmap\1\3\0\0\6n\6x\vipairs\1\0\1\vsilent\2\1\0\0\acl\1\3\0\0\0\nClear\6s\1\0\0\6q\1\3\0\0\0\tExit\15close_repl\f<Space>\1\3\0\0\0\19Send interrupt\t<CR>\1\3\0\0\0\15Send <EOL>\tchar\vstring\tsend\6.\1\3\0\0\0\19Repeat command\15repeat_cmd\6l\1\3\0\0\0\14Send line\14send_line\1\0\1\tname\rIronRepl\tmaps\16send_motion\15run_motion\14iron.core\bkey\ncrows\17lazy_require\16crows.utils\frequire\0", "setup", "iron.nvim")
time([[Setup for iron.nvim]], false)
-- Setup for: switch.vim
time([[Setup for switch.vim]], true)
try_loadstring("\27LJ\2\n2\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\6_\19switch_mapping\6g\bvim\0", "setup", "switch.vim")
time([[Setup for switch.vim]], false)
-- Setup for: vimwiki
time([[Setup for vimwiki]], true)
try_loadstring("\27LJ\2\n¨\1\0\0\5\0\b\0\f6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0B\0\4\0016\0\0\0009\0\6\0'\2\a\0B\0\2\1K\0\1\0Fautocmd MyAutoCmd FileType vimwiki setlocal nolist concealcursor=\bcmd\23<plug>VimwikiIndex\15<leader>ww\6n\bset\vkeymap\bvim\0", "setup", "vimwiki")
time([[Setup for vimwiki]], false)
-- Config for: cmp-npm
time([[Config for cmp-npm]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fcmp-npm\frequire\0", "config", "cmp-npm")
time([[Config for cmp-npm]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n≥\2\0\0\6\0\19\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\t\0005\4\b\0=\4\n\3=\3\v\2B\0\2\0016\0\0\0'\2\f\0B\0\2\0029\0\r\0009\0\14\0'\2\15\0'\3\16\0'\4\17\0'\5\18\0B\0\5\1K\0\1\0\28<cmd>NvimTreeToggle<cr>\19<localleader>f\6n\20Toggle filetree\bmap\bkey\ncrows\ffilters\vcustom\1\0\0\1\2\0\0\n\\.git\tview\1\0\1\15signcolumn\tauto\16diagnostics\1\0\1\venable\2\1\0\2\18disable_netrw\1\15update_cwd\2\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: splitjoin.vim
time([[Config for splitjoin.vim]], true)
try_loadstring("\27LJ\2\nö\2\0\0\5\0\17\0\0236\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\3\0=\1\4\0006\0\5\0'\2\6\0B\0\2\0029\0\a\0009\0\b\0005\2\14\0005\3\n\0005\4\t\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0B\0\3\1K\0\1\0\1\0\1\vsilent\2\r<Leader>\1\0\0\6k\1\3\0\0\27<cmd>SplitjoinJoin<cr>\14Join line\6j\1\0\0\1\3\0\0\28<cmd>SplitjoinSplit<cr>\15Split line\tmaps\bkey\ncrows\frequire\27splitjoin_join_mapping\5\28splitjoin_split_mapping\6g\bvim\0", "config", "splitjoin.vim")
time([[Config for splitjoin.vim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nÚ\6\0\0\a\0&\0H6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0005\3\3\0006\4\0\0'\6\4\0B\4\2\0029\4\1\4=\4\5\0034\4\0\0=\4\6\3=\3\b\0025\3\n\0005\4\t\0=\4\v\0035\4\f\0005\5\r\0005\6\14\0=\6\15\5>\5\3\4=\4\16\0034\4\3\0005\5\17\0>\5\1\4=\4\18\0034\4\4\0005\5\19\0>\5\1\0045\5\20\0>\5\2\0045\5\21\0>\5\3\4=\4\22\0035\4\23\0=\4\24\0035\4\25\0=\4\26\3=\3\27\0025\3\28\0004\4\0\0=\4\v\0034\4\0\0=\4\16\0035\4\29\0=\4\18\0035\4\30\0=\4\22\0034\4\0\0=\4\24\0034\4\0\0=\4\26\3=\3\31\0025\3!\0005\4 \0=\4\v\0034\4\0\0=\4\16\0034\4\0\0=\4\18\0034\4\0\0=\4\22\0034\4\0\0=\4\24\0035\4\"\0=\4\26\3=\3#\0025\3$\0=\3%\2B\0\2\1K\0\1\0\15extensions\1\5\0\0\rfugitive\rquickfix\20symbols-outline\15toggleterm\ftabline\1\2\0\0\ttabs\1\0\0\1\2\0\0\fbuffers\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\2\1\0\rfiletype\14separator\6|\1\2\2\0\15fileformat\18icons_enabled\1\14separator\6|\1\2\1\0\rencoding\14separator\6|\14lualine_c\1\2\1\0\rfilename\tpath\3\1\14lualine_b\fsources\1\2\0\0\20nvim_diagnostic\1\2\0\0\16diagnostics\1\3\0\0\vbranch\tdiff\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\ntheme\19features.theme\1\0\5\25always_divide_middle\2\25component_separators\5\23section_separators\5\18icons_enabled\2\17globalstatus\1\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: vim-unimpaired
time([[Config for vim-unimpaired]], true)
try_loadstring("\27LJ\2\n \1\0\0\5\0\f\0$6\0\0\0009\0\1\0009\0\2\0\18\1\0\0'\3\3\0'\4\4\0B\1\3\1\18\1\0\0'\3\3\0'\4\5\0B\1\3\1\18\1\0\0'\3\3\0'\4\6\0B\1\3\1\18\1\0\0'\3\3\0'\4\a\0B\1\3\1\18\1\0\0'\3\3\0'\4\b\0B\1\3\1\18\1\0\0'\3\3\0'\4\t\0B\1\3\1\18\1\0\0'\3\3\0'\4\n\0B\1\3\1\18\1\0\0'\3\3\0'\4\v\0B\1\3\1K\0\1\0\a>P\a>p\f>s<Esc>\a>s\a<P\a<p\f<s<Esc>\a<s\6n\bdel\vkeymap\bvimË\a\1\0\t\0(\2_6\0\0\0003\1\2\0=\1\1\0006\0\3\0009\0\4\0009\0\5\0\t\0\0\0X\0\3Ä6\0\1\0B\0\1\1X\0\4Ä6\0\3\0009\0\6\0'\2\a\0B\0\2\0015\0\n\0006\1\3\0009\1\b\0019\1\t\1\b\1\1\0X\1\5Ä6\1\3\0009\1\b\0019\1\t\1\14\0\1\0X\2\1Ä)\1\2\0=\1\t\0006\1\3\0009\1\b\0019\1\v\1\b\1\1\0X\1\5Ä6\1\3\0009\1\b\0019\1\v\1\14\0\1\0X\2\1Ä)\1\3\0=\1\v\0006\1\f\0'\3\r\0B\1\2\0029\1\14\0019\1\15\0015\3\24\0005\4\19\0005\5\18\0'\6\16\0009\a\t\0'\b\17\0&\6\b\6>\6\1\5=\5\20\0045\5\22\0'\6\21\0009\a\v\0'\b\17\0&\6\b\6>\6\1\5=\5\23\4=\4\25\0035\4\28\0005\5\27\0'\6\26\0'\a\17\0&\6\a\6>\6\1\5=\5\20\0045\5\30\0'\6\29\0'\a\17\0&\6\a\6>\6\1\5=\5\23\4=\4\31\0035\4#\0005\5\"\0'\6 \0009\a\t\0'\b!\0&\6\b\6>\6\1\5=\5\20\0045\5%\0'\6$\0009\a\v\0'\b!\0&\6\b\6>\6\1\5=\5\23\4=\4&\0035\4'\0B\1\3\1K\0\1\0\1\0\1\vsilent\1\30<Plug>(unimpaired-toggle)\1\3\0\0\0\22Toggle laststatus3:<C-U>set laststatus=<C-R>=&laststatus == 0 ? \1\0\0\1\3\0\0\0\24Toggle conceallevel\17 : 0<CR><CR>7:<C-U>set conceallevel=<C-R>=&conceallevel == 0 ? \31<Plug>(unimpaired-disable)\1\3\0\0\0\23Disable laststatus\27:<C-U>set laststatus=0\1\0\0\1\3\0\0\0\25Disable conceallevel\29:<C-U>set conceallevel=0\30<Plug>(unimpaired-enable)\1\0\0\6g\1\3\0\0\0\22Enable laststatus\26:<C-U>set laststatus=\6a\1\0\0\1\3\0\0\0\24Enable conceallevel\t<CR>\28:<C-U>set conceallevel=\tmaps\bkey\ncrows\frequire\15laststatus\1\0\0\17conceallevel\ago6autocmd VimEnter * ++once lua _unmap_unimpaired()\bcmd\18vim_did_enter\6v\bvim\0\22_unmap_unimpaired\a_G\2\0\0", "config", "vim-unimpaired")
time([[Config for vim-unimpaired]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0\0\14next_hunkg\1\0\3\1\a\0\0156\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\2Ä'\0\3\0002\0\aÄ6\0\0\0009\0\4\0003\2\5\0B\0\2\1'\0\6\0002\0\0ÄL\0\2\0L\0\2\0\1¿\r<Ignore>\0\rschedule\a]c\tdiff\awo\bvim#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0\0\14prev_hunkg\1\0\3\1\a\0\0156\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\2Ä'\0\3\0002\0\aÄ6\0\0\0009\0\4\0003\2\5\0B\0\2\1'\0\6\0002\0\0ÄL\0\2\0L\0\2\0\1¿\r<Ignore>\0\rschedule\a[c\tdiff\awo\bvim1\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\1¿\1\0\1\tfull\2\15blame_line(\0\0\3\1\2\0\5-\0\0\0009\0\0\0'\2\1\0B\0\2\1K\0\1\0\1¿\6~\rdiffthisÂ\a\1\1\18\0009\0^6\1\0\0009\1\1\0019\1\2\0016\2\3\0'\4\4\0B\2\2\0029\2\5\0023\3\6\0003\4\a\0003\5\b\0003\6\t\0009\a\n\0025\t\f\0005\n\v\0>\3\1\n=\n\r\t5\n\14\0>\4\1\n=\n\15\t5\n\16\0005\v\18\0009\f\17\1>\f\1\v=\v\19\n5\v\21\0009\f\20\1>\f\1\v=\v\22\n5\v\24\0009\f\23\1>\f\1\v=\v\25\n5\v\27\0009\f\26\1>\f\1\v=\v\28\n5\v\29\0>\5\1\v=\v\30\n5\v \0009\f\31\1>\f\1\v=\v!\n5\v#\0009\f\"\1>\f\1\v=\v$\n5\v%\0>\6\1\v=\v&\n5\v(\0009\f'\1>\f\1\v=\v)\n=\n*\tB\a\2\0016\a+\0005\t,\0B\a\2\4X\n\fÄ9\f-\2'\14.\0\18\15\v\0'\16/\0'\0170\0B\f\5\0019\f-\2'\0141\0\18\15\v\0'\0162\0'\0173\0B\f\5\1E\n\3\3R\nÚ6\a+\0005\t4\0B\a\2\4X\n\fÄ9\f-\2'\0145\0\18\15\v\0'\0166\0'\0177\0B\f\5\0019\f-\2'\0145\0\18\15\v\0'\0168\0'\0177\0B\f\5\1E\n\3\3R\nÚ2\0\0ÄK\0\1\0\aac\"<cmd>Gitsigns select_hunk<cr>\aic\thunk\1\3\0\0\6o\6x\29:Gitsigns reset_hunk<cr>\15<leader>gr\15Reset hunk\29:Gitsigns stage_hunk<cr>\15<leader>gs\15Stage hunk\bmap\1\3\0\0\6n\6v\vipairs\14<leader>g\atd\1\3\0\0\0\19Toggle deleted\19toggle_deleted\6D\1\3\0\0\0\rGit diff\6d\1\3\0\0\0\rGit diff\rdiffthis\atb\1\3\0\0\0\30Toggle blame current line\30toggle_current_line_blame\6b\1\3\0\0\0\23Blame current line\6p\1\3\0\0\0\17Preview hunk\17preview_hunk\6R\1\3\0\0\0\25Reset current buffer\17reset_buffer\6u\1\3\0\0\0\26Undo last staged hunk\20undo_stage_hunk\6S\1\3\0\0\0\25Stage current buffer\17stage_buffer\1\0\1\tname\rGitsigns\a[c\1\3\0\0\0\19Goto prev hunk\a]c\1\0\0\1\3\0\0\0\19Goto next hunk\tmaps\0\0\0\0\bkey\ncrows\frequire\rgitsigns\vloaded\fpackageP\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\14on_attach\1\0\0\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\në\1\0\1\t\1\n\0\0156\1\0\0009\1\1\1'\3\2\0B\1\2\1-\1\0\0009\1\3\1'\3\4\0'\4\5\0'\5\6\0'\6\a\0005\a\t\0009\b\b\0=\b\b\aB\1\6\1K\0\1\0\0¿\1\0\1\vsilent\2\nbufnr\19<cmd>close<cr>\6q\6n\19Close terminal\bmap\17startinsert!\bcmd\bvim$\0\0\3\1\1\0\5-\0\0\0\18\2\0\0009\0\0\0B\0\2\1K\0\1\0\2¿\vtoggle\v\0\0\1\0\0\0\1K\0\1\0—\5\1\0\n\0%\00096\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\5\0006\4\6\0009\4\a\0049\4\b\4'\6\t\0B\4\2\2=\4\n\3B\1\2\0016\1\0\0'\3\v\0B\1\2\0029\1\f\1\18\4\1\0009\2\r\0015\5\14\0005\6\15\0=\6\16\0053\6\17\0=\6\18\5B\2\3\0026\3\19\0003\4\21\0=\4\20\0036\3\19\0003\4\23\0=\4\22\0039\3\24\0'\5\25\0'\6\26\0'\a\27\0'\b\28\0005\t\29\0B\3\6\0019\3\24\0'\5\30\0'\6\31\0'\a \0'\b!\0B\3\5\0016\3\6\0009\3\"\3'\5#\0B\3\2\0016\3\6\0009\3\"\3'\5$\0B\3\2\0012\0\0ÄK\0\1\0*autocmd! TermOpen term://* set nolist:autocmd! TermOpen term://* lua set_terminal_keymaps()\bcmd\15<C-\\><C-n>\n<Esc>\6t\22Enter normal mode\1\0\1\vsilent\2$<cmd> lua _lazygit_toggle()<cr>\19<localleader>g\6n\17Open lazygit\bmap\0\25set_terminal_keymaps\0\20_lazygit_toggle\a_G\fon_open\0\15float_opts\1\0\1\vborder\vdouble\1\0\4\bdir\fgit_dir\vhidden\2\bcmd\flazygit\14direction\nfloat\bnew\rTerminal\24toggleterm.terminal\nshell\nSHELL\vgetenv\afn\bvim\1\0\3\17open_mapping\n<c-\\>\14direction\nfloat\vborder\vshadow\nsetup\15toggleterm\bkey\ncrows\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: auto-session
time([[Config for auto-session]], true)
try_loadstring("\27LJ\2\n◊\3\0\0\5\0\24\0\0306\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\b\0005\3\a\0=\3\t\0025\3\n\0=\3\v\2B\0\2\0016\0\4\0'\2\f\0B\0\2\0029\0\r\0009\0\14\0005\2\22\0005\3\16\0005\4\15\0=\4\17\0035\4\18\0=\4\19\0035\4\20\0=\4\21\3=\3\23\2B\0\2\1K\0\1\0\14<Leader>l\1\0\0\6d\1\3\0\0\27<cmd>DeleteSession<cr>\19Delete session\6s\1\3\0\0\25<cmd>SaveSession<cr>\17Save session\6r\1\0\0\1\3\0\0\28<cmd>RestoreSession<cr>\20Restore session\tmaps\bkey\ncrows\31auto_session_suppress_dirs\1\4\0\0\6~\15~/Projects\14~/vimwiki\18pre_save_cmds\1\0\0\1\2\0\0\18NvimTreeClose\nsetup\17auto-session\frequire0curdir,folds,help,tabpages,terminal,winsize\19sessionoptions\bopt\bvim\0", "config", "auto-session")
time([[Config for auto-session]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
try_loadstring("\27LJ\2\nU\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\vwindow\1\0\0\1\0\1\nblend\3d\nsetup\vfidget\frequire\0", "config", "fidget.nvim")
time([[Config for fidget.nvim]], false)
-- Config for: vim-matchup
time([[Config for vim-matchup]], true)
try_loadstring("\27LJ\2\n”\1\0\0\2\0\6\0\0176\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1d\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0006\0\0\0009\0\1\0)\1\1\0=\1\5\0K\0\1\0\29matchup_surround_enabled*matchup_matchparen_hi_surround_always+matchup_matchparen_deferred_show_delay matchup_matchparen_deferred\6g\bvim\0", "config", "vim-matchup")
time([[Config for vim-matchup]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nÜ\a\0\0\6\0%\0)6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0005\4\a\0=\4\b\3=\3\t\0025\3\n\0=\3\v\0025\3\f\0005\4\r\0=\4\14\3=\3\15\0025\3\18\0005\4\16\0005\5\17\0=\5\14\4=\4\19\0035\4\20\0005\5\21\0=\5\22\0045\5\23\0=\5\24\0045\5\25\0=\5\26\0045\5\27\0=\5\28\4=\4\29\3=\3\30\0025\3\31\0=\3 \0025\3!\0=\3\"\0025\3#\0=\3$\2B\0\2\1K\0\1\0\fmatchup\1\0\1\venable\2\fautotag\1\0\1\venable\2\fendwise\1\0\1\venable\2\16textobjects\tmove\22goto_previous_end\1\0\2\a[M\20@function.outer\a[]\17@class.outer\24goto_previous_start\1\0\2\a[m\20@function.outer\a[[\17@class.outer\18goto_next_end\1\0\2\a]M\20@function.outer\a][\17@class.outer\20goto_next_start\1\0\2\a]]\17@class.outer\a]m\20@function.outer\1\0\2\14set_jumps\2\venable\2\vselect\1\0\0\1\0\4\aif\20@function.inner\aaf\20@function.outer\aiC\17@class.inner\aaC\17@class.outer\1\0\2\14lookahead\2\venable\2\26incremental_selection\fkeymaps\1\0\4\21node_decremental\bgrm\19init_selection\bgnn\22scope_incremental\bgrc\21node_incremental\bgrn\1\0\1\venable\2\vindent\1\0\1\venable\1\14highlight\fdisable\1\2\0\0\thelp\1\0\1\venable\2\19ignore_install\1\3\0\0\bphp\vphpdoc\1\0\2&additional_vim_regex_highlighting\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n¶\4\0\0\5\0\22\0\0286\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\0\0'\2\6\0B\0\2\0029\0\a\0009\0\b\0005\2\20\0005\3\t\0005\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\0035\4\18\0=\4\19\3=\3\21\2B\0\2\1K\0\1\0\14<leader>x\1\0\0\6q\1\3\0\0\30<cmd>Trouble quickfix<cr>\19Quickfix items\6l\1\3\0\0\29<cmd>Trouble loclist<cr>*Items from the window's location list\6d\1\3\0\0*<cmd>Trouble document_diagnostics<cr>\25Document diagnostics\6w\1\3\0\0+<cmd>Trouble workspace_diagnostics<cr>\26Workspace diagnostics\6x\1\3\0\0\27<cmd>TroubleToggle<cr>\19Toggle Trouble\1\0\1\tname\16lsp trouble\tmaps\bkey\ncrows\nsigns\1\0\0\1\0\5\nother\bÔ´†\fwarning\bÔî©\thint\bÔ†µ\16information\bÔëâ\nerror\bÔôô\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: lsp_signature.nvim
time([[Config for lsp_signature.nvim]], true)
try_loadstring("\27LJ\2\np\0\2\6\0\6\0\t6\2\0\0'\4\1\0B\2\2\0029\2\2\0025\4\3\0005\5\4\0=\5\5\4B\2\2\1K\0\1\0\17handler_opts\1\0\1\vborder\tnone\1\0\1\tbind\2\14on_attach\18lsp_signature\frequireD\1\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0003\2\3\0B\0\2\1K\0\1\0\0\18add_on_attach\14crows.lsp\frequire\0", "config", "lsp_signature.nvim")
time([[Config for lsp_signature.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\nñ\2\0\0\n\0\14\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\2B\0\2\0016\0\0\0'\2\5\0B\0\2\0026\1\0\0'\3\6\0B\1\2\0029\2\a\1\18\4\2\0009\2\b\2'\5\t\0009\6\n\0005\b\f\0005\t\v\0=\t\r\bB\6\2\0A\2\2\1K\0\1\0\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\bcmp\"nvim-autopairs.completion.cmp\14fast_wrap\1\0\2\rcheck_ts\2\30enable_check_bracket_line\2\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: lsp-colors.nvim
time([[Config for lsp-colors.nvim]], true)
try_loadstring("\27LJ\2\n~\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\4\16Information\f#0db9d7\fWarning\f#e0af68\nError\f#db4b4b\tHint\f#10B981\nsetup\15lsp-colors\frequire\0", "config", "lsp-colors.nvim")
time([[Config for lsp-colors.nvim]], false)
-- Config for: vim-niceblock
time([[Config for vim-niceblock]], true)
try_loadstring("\27LJ\2\nƒ\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0005\2\5\0005\3\4\0=\3\6\0025\3\a\0=\3\b\0025\3\t\0B\0\3\1K\0\1\0\1\0\1\tmode\6x\6A\1\3\0\0\24<Plug>(niceblock-A)\28Append visual selection\6I\1\0\0\1\3\0\0\24<Plug>(niceblock-I)\29Prepend visual selection\tmaps\bkey\ncrows\frequire\0", "config", "vim-niceblock")
time([[Config for vim-niceblock]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
try_loadstring("\27LJ\2\nµ\3\0\0\n\0\25\0+6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\5\0009\4\4\0=\4\6\3B\1\2\0016\1\a\0009\1\b\0019\1\t\1'\3\n\0004\4\0\0B\1\3\0026\2\a\0009\2\b\0029\2\v\2'\4\f\0005\5\r\0=\1\14\5B\2\3\0016\2\a\0009\2\b\0029\2\v\2'\4\f\0005\5\15\0=\1\14\0056\6\16\0009\6\17\0069\b\18\0'\t\19\0B\6\3\2=\6\20\0056\6\a\0009\6\21\0069\6\22\0069\6\23\6=\6\24\5B\2\3\1K\0\1\0\rcallback\24formatting_seq_sync\bbuf\blsp\fpattern\6,\vby_lsp\vconcat\ntable\1\0\0\ngroup\1\0\2\fpattern\6*\fcommand\24silent! FormatWrite\17BufWritePost\24nvim_create_autocmd\19format_on_save\24nvim_create_augroup\bapi\bvim\rfiletype\1\0\0\17by_formatter\nsetup\14formatter\20features.format\frequire\0", "config", "formatter.nvim")
time([[Config for formatter.nvim]], false)
-- Config for: accelerated-jk
time([[Config for accelerated-jk]], true)
try_loadstring("\27LJ\2\n™\1\0\0\6\0\n\0\0176\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\30<Plug>(accelerated_jk_gk)\6k\1\0\1\vsilent\2\30<Plug>(accelerated_jk_gj)\6j\6n\bset\vkeymap\bvim\0", "config", "accelerated-jk")
time([[Config for accelerated-jk]], false)
-- Config for: open-browser.vim
time([[Config for open-browser.vim]], true)
try_loadstring("\27LJ\2\nŒ\1\0\0\14\0\v\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\3\0005\3\4\0B\1\2\4X\4\nÄ9\6\5\0'\b\6\0\18\t\5\0'\n\a\0'\v\b\0\18\f\5\0'\r\t\0&\v\r\v5\f\n\0B\6\6\1E\4\3\3R\4ÙK\0\1\0\1\0\1\vsilent\2\v')<cr>-<cmd>call vimrc#github_or_open_browser('\agx\20Open in browser\bmap\1\3\0\0\6n\6x\vipairs\bkey\ncrows\frequire\0", "config", "open-browser.vim")
time([[Config for open-browser.vim]], false)
-- Config for: TrueZen.nvim
time([[Config for TrueZen.nvim]], true)
try_loadstring("\27LJ\2\n'\0\0\2\0\3\0\0056\0\0\0009\0\1\0+\1\1\0=\1\2\0K\0\1\0\tlist\awo\bvim•\2\1\0\r\0\16\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\2\4\0015\4\6\0005\5\5\0=\5\a\4B\2\2\0013\2\t\0=\2\b\0016\2\n\0005\4\v\0B\2\2\4X\5\6Ä9\a\f\0'\t\r\0\18\n\6\0'\v\14\0'\f\15\0B\a\5\1E\5\3\3R\5¯K\0\1\0\24<cmd>TZAtaraxis<cr>\19<localleader>z\23True Zen: Ataraxis\bmap\1\3\0\0\6n\6x\vipairs\0\27after_mode_ataraxis_on\17integrations\1\0\0\1\0\3\flualine\1\rtwilight\1\rgitsigns\2\nsetup\rtrue-zen\bkey\ncrows\frequire\0", "config", "TrueZen.nvim")
time([[Config for TrueZen.nvim]], false)
-- Config for: dressing.nvim
time([[Config for dressing.nvim]], true)
try_loadstring("\27LJ\2\nY\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\ninput\1\0\0\1\0\1\rwinblend\3\0\nsetup\rdressing\frequire\0", "config", "dressing.nvim")
time([[Config for dressing.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n–\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\20buftype_exclude\1\0\3\31show_current_context_start\2\25show_current_context\2\19use_treesitter\2\1\a\0\0\thelp\vnofile\fnowrite\rquickfix\rterminal\vprompt\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: vim-wordmotion
time([[Config for vim-wordmotion]], true)
try_loadstring("\27LJ\2\nD\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\2\aiw\aiv\aaw\aav\24wordmotion_mappings\6g\bvim\0", "config", "vim-wordmotion")
time([[Config for vim-wordmotion]], false)
-- Config for: cmp-nvim-lsp
time([[Config for cmp-nvim-lsp]], true)
try_loadstring("\27LJ\2\nr\0\0\5\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0029\2\4\2B\0\2\1K\0\1\0\24update_capabilities\17cmp_nvim_lsp\20add_caps_setter\14crows.lsp\frequire\0", "config", "cmp-nvim-lsp")
time([[Config for cmp-nvim-lsp]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\nï\2\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\14operators\1\0\t\ag~\16Toggle case\6!#Filter though external program\agu\14Lowercase\azf\16Create fold\agU\14Uppercase\6v\26Visual Character Mode\6c\vChange\6d\vDelete\6y\16Yank (copy)\fplugins\1\0\0\fpresets\1\0\0\1\0\1\14operators\1\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: vim-arpeggio
time([[Config for vim-arpeggio]], true)
try_loadstring("\27LJ\2\nu\0\0\a\0\t\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0)\4\0\0'\5\5\0'\6\6\0B\0\6\0016\0\0\0009\0\a\0)\1<\0=\1\b\0K\0\1\0\24arpeggio_timeoutlen\6g\n<Esc>\ajk\5\6i\17arpeggio#map\afn\bvim\0", "config", "vim-arpeggio")
time([[Config for vim-arpeggio]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-treesitter-textobjects ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file IronRepl lua require("packer.load")({'iron.nvim'}, { cmd = "IronRepl", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSPlaygroundToggle lua require("packer.load")({'playground'}, { cmd = "TSPlaygroundToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HelpfulVersion lua require("packer.load")({'helpful.vim'}, { cmd = "HelpfulVersion", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Focus lua require("packer.load")({'vim-dispatch'}, { cmd = "Focus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Sayonara lua require("packer.load")({'vim-sayonara'}, { cmd = "Sayonara", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Dispatch lua require("packer.load")({'vim-dispatch'}, { cmd = "Dispatch", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SymbolsOutline lua require("packer.load")({'symbols-outline.nvim'}, { cmd = "SymbolsOutline", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Neogit lua require("packer.load")({'neogit'}, { cmd = "Neogit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SymbolsOutlineClose lua require("packer.load")({'symbols-outline.nvim'}, { cmd = "SymbolsOutlineClose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'vim-startuptime'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Make lua require("packer.load")({'vim-dispatch'}, { cmd = "Make", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Start lua require("packer.load")({'vim-dispatch'}, { cmd = "Start", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SymbolsOutlineOpen lua require("packer.load")({'symbols-outline.nvim'}, { cmd = "SymbolsOutlineOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file IronSend lua require("packer.load")({'iron.nvim'}, { cmd = "IronSend", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file IronReplHere lua require("packer.load")({'iron.nvim'}, { cmd = "IronReplHere", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> g'! <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "g'!", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> `! <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "`!", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> `<CR> <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "`<lt>CR>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> '<CR> <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "'<lt>CR>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> m<Space> <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "m<lt>Space>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> g'? <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "g'?", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> g'<Space> <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "g'<lt>Space>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> g'<CR> <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "g'<lt>CR>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> '? <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "'?", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> '! <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "'!", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <localleader>d <cmd>lua require("packer.load")({'neogen'}, { keys = "<lt>localleader>d", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> m! <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "m!", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> `<Space> <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "`<lt>Space>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <localleader>df <cmd>lua require("packer.load")({'neogen'}, { keys = "<lt>localleader>df", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> _ <cmd>lua require("packer.load")({'switch.vim'}, { keys = "_", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>Vimwiki <cmd>lua require("packer.load")({'vimwiki'}, { keys = "<lt>Plug>Vimwiki", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> m<CR> <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "m<lt>CR>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> '<Space> <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "'<lt>Space>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> `? <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "`?", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <localleader>dc <cmd>lua require("packer.load")({'neogen'}, { keys = "<lt>localleader>dc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> m? <cmd>lua require("packer.load")({'vim-dispatch'}, { keys = "m?", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType fish ++once lua require("packer.load")({'vim-fish'}, { ft = "fish" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'go.nvim'}, { ft = "go" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-ts-autotag', 'emmet-vim'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascriptreact ++once lua require("packer.load")({'nvim-ts-autotag', 'emmet-vim'}, { ft = "javascriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescriptreact ++once lua require("packer.load")({'nvim-ts-autotag', 'emmet-vim'}, { ft = "typescriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType vue ++once lua require("packer.load")({'nvim-ts-autotag', 'emmet-vim'}, { ft = "vue" }, _G.packer_plugins)]]
vim.cmd [[au FileType pandoc.markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "pandoc.markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType rmd ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "rmd" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript.jsx ++once lua require("packer.load")({'emmet-vim'}, { ft = "javascript.jsx" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript.tsx ++once lua require("packer.load")({'emmet-vim'}, { ft = "typescript.tsx" }, _G.packer_plugins)]]
vim.cmd [[au FileType vim ++once lua require("packer.load")({'nvim-treesitter-endwise'}, { ft = "vim" }, _G.packer_plugins)]]
vim.cmd [[au FileType python ++once lua require("packer.load")({'nvim-dap-python'}, { ft = "python" }, _G.packer_plugins)]]
vim.cmd [[au FileType ruby ++once lua require("packer.load")({'nvim-treesitter-endwise'}, { ft = "ruby" }, _G.packer_plugins)]]
vim.cmd [[au FileType sh ++once lua require("packer.load")({'nvim-treesitter-endwise'}, { ft = "sh" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'nvim-treesitter-endwise'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType gomod ++once lua require("packer.load")({'go.nvim'}, { ft = "gomod" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'nvim-ts-autotag', 'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au CmdlineEnter * ++once lua require("packer.load")({'nvim-cmp'}, { event = "CmdlineEnter *" }, _G.packer_plugins)]]
vim.cmd [[au CmdwinEnter * ++once lua require("packer.load")({'nvim-cmp'}, { event = "CmdwinEnter *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-cmp'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au CursorHold * ++once lua require("packer.load")({'nvim-cmp'}, { event = "CursorHold *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/rasnauf/.local/share/nvim/site/pack/packer/opt/go.nvim/ftdetect/go.vim]], true)
vim.cmd [[source /Users/rasnauf/.local/share/nvim/site/pack/packer/opt/go.nvim/ftdetect/go.vim]]
time([[Sourcing ftdetect script at: /Users/rasnauf/.local/share/nvim/site/pack/packer/opt/go.nvim/ftdetect/go.vim]], false)
time([[Sourcing ftdetect script at: /Users/rasnauf/.local/share/nvim/site/pack/packer/opt/vim-fish/ftdetect/fish.vim]], true)
vim.cmd [[source /Users/rasnauf/.local/share/nvim/site/pack/packer/opt/vim-fish/ftdetect/fish.vim]]
time([[Sourcing ftdetect script at: /Users/rasnauf/.local/share/nvim/site/pack/packer/opt/vim-fish/ftdetect/fish.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
