---@module 'lazy'

local Utils = require("utils")
local style = require("config.style")

---@type LazySpec[]
return {
  {
    "folke/which-key.nvim",
    opts_extend = { "spec", "icons.rules" },
    opts = function(_, opts)
      local wk = require("which-key")

      local unfiltered_spec = {
        { "<leader>n", group = "notes" },
        { "<leader>o", group = "open" },
        { "<leader>r", group = "run" },
        { "<localleader>e", group = "evaluate" },
        { "<localleader>ec", group = "comment" },
        { "<localleader>l", group = "log" },
      }
      local required_plugins = {
        notes = { "neorg" },
        open = { "peek.nvim" },
        run = { "overseer.nvim" },
        evaluate = { "conjure" },
        comment = { "conjure" },
        log = { "conjure" },
        preview = { "goto-preview" },
      }
      local spec = vim
        .iter(unfiltered_spec)
        :filter(function(item)
          local plugins = required_plugins[item.group]
          return vim.iter(plugins):any(LazyVim.has)
        end)
        :totable()

      wk.add(spec)

      return vim.tbl_deep_extend("force", opts, {
        show_help = false,
        icons = {
          rules = {
            { plugin = "colortils.nvim", icon = "󰏘", color = "orange" },
            { plugin = "detour.nvim", icon = "", color = "blue" },
            { plugin = "git-messenger.vim", icon = "󰊢", color = "orange" },
            { plugin = "goto-preview", icon = "", color = "cyan" },
            { plugin = "iswap.nvim", icon = "󰣁", color = "cyan" },
            { plugin = "neogen", icon = "󰈙", color = "green" },
            { plugin = "overseer.nvim", icon = "󱓞", color = "red" },
            { plugin = "ssr.nvim", icon = "󰛔", color = "blue" },
            { pattern = "^notes$", icon = "", color = "yellow" },
            { pattern = "^preview$", icon = "", color = "cyan" },
            { pattern = "^run$", icon = "󱓞", color = "red" },
            { pattern = "copy link to repo", icon = "󰆏", color = "yellow" },
            { pattern = "copy permalink", icon = "󰆏", color = "yellow" },
            { pattern = "coverage", icon = "󰱑", color = "red" },
            { pattern = "diffview", icon = "", color = "green" },
            { pattern = "join block", icon = "󰡍", color = "cyan" },
            { pattern = "split block", icon = "󰡏", color = "cyan" },
            { pattern = "swap current with next", icon = "󰓡", color = "blue" },
          },
        },
      })
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    keys = {
      { "<leader>fe", false },
      { "<leader>fE", false },
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
        end,
        desc = "Explorer NeoTree (root dir)",
      },
      {
        "<leader>E",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
    },
    opts = {
      filesystem = {
        window = {
          mappings = {
            -- FIXME: conflicts with new mappings
            -- ["o"] = "open_in_external_program",
            ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = LazyVim.has("image.nvim") } },
          },
        },
        commands = {
          open_in_external_program = function(state)
            local node = state.tree:get_node()
            if node.type == "file" then
              local cmdname = jit.os == "Linux" and "xdg-open" or "open"
              local cmd = ("%s %s"):format(cmdname, vim.fn.shellescape(node.path))
              vim.fn.jobstart(cmd, { detach = true })
            end
          end,
        },
        find_by_full_path_words = true,
      },
    },
  },
  -- window picker for neo-tree
  {
    "s1n7ax/nvim-window-picker",
    version = "2.*",
    keys = {
      {
        "<leader>wp",
        function()
          local window = require("window-picker").pick_window()
          if window then
            vim.api.nvim_set_current_win(window)
          end
        end,
        desc = "Pick window",
      },
    },
    opts = function()
      local palette = require("utils.palette")
      return {
        highlights = {
          statusline = {
            focused = { fg = palette.incline0, bg = palette.incline1 },
            unfocused = { fg = palette.incline0, bg = palette.incline1 },
          },
          winbar = {
            focused = { fg = palette.incline0, bg = palette.incline1 },
            unfocused = { fg = palette.incline0, bg = palette.incline1 },
          },
        },
      }
    end,
  },

  -- navigate code with search labels, enhanced character motions, and Treesitter integration
  {
    "folke/flash.nvim",
    keys = function()
      -- stylua: ignore
      return {
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        -- disable S for visual mode
        { "S", mode = { "n", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
      }
    end,
    opts = {
      modes = {
        -- My problem with search is that flash.nvim will interpret part of a word
        -- I type as a jump label when the word is not found in the document and exit
        -- search, and then the rest of the word I type is interpreted as vim
        -- commands, resulting in who-knows-what.
        search = { enabled = false },
      },
    },
  },

  -- motions respect camelCase, snake_case, etc (using for inner word textobjects)
  {
    "chaoren/vim-wordmotion",
    event = "VeryLazy",
    keys = {
      { "av", "<Plug>WordMotion_aw", mode = { "x", "o" }, desc = "a word (within variable)" },
      { "iv", "<Plug>WordMotion_iw", mode = { "x", "o" }, desc = "inner word (within variable)" },
    },
    init = function()
      vim.g.wordmotion_nomap = true
    end,
  },

  -- motions respect camelCase, snake_case, etc
  {
    "chrisgrieser/nvim-spider",
    event = "VeryLazy",
    keys = function()
      -- stylua: ignore
      return {
        { "w", function() require("spider").motion("w") end, mode = { "n", "o", "x" }, desc = "Next word" },
        { "e", function() require("spider").motion("e") end, mode = { "n", "o", "x" }, desc = "Previous word" },
        { "b", function() require("spider").motion("b") end, mode = { "n", "o", "x" }, desc = "End of word" },
        { "ge", function() require("spider").motion("ge") end, mode = { "n", "o", "x" }, desc = "Previous end of word" },
      }
    end,
    opts = {},
  },

  {
    "echasnovski/mini.bracketed",
    event = "BufReadPost",
    opts = {
      comment = { suffix = "" },
      window = { suffix = "" },
      quickfix = { suffix = "" },
      treesitter = { suffix = "n" },
    },
    config = function(_, opts)
      local bracketed = require("mini.bracketed")

      local function mappings_put()
        local function put(cmd, regtype)
          local body = vim.fn.getreg(vim.v.register)
          local type = vim.fn.getregtype(vim.v.register)
          vim.fn.setreg(vim.v.register, body, regtype or "l")
          bracketed.register_put_region(cmd)
          vim.cmd(('normal! "%s%s'):format(vim.v.register, cmd:lower()))
          ---@diagnostic disable-next-line: param-type-mismatch
          vim.fn.setreg(vim.v.register, body, type)
        end

        for cmd, desc in pairs({ ["]p"] = "Put forward", ["[p"] = "Put backward" }) do
          vim.keymap.set("n", cmd, function()
            put(cmd)
          end, { desc = desc })
        end
        for cmd, desc in pairs({ ["]P"] = "Put forward", ["[P"] = "Put backward" }) do
          vim.keymap.set("n", cmd, function()
            put(cmd, "c")
          end, { desc = desc })
        end

        for lhs, desc in pairs({ p = "Put forward", P = "Put backward" }) do
          vim.keymap.set({ "n", "x" }, lhs, function()
            return bracketed.register_put_region(lhs)
          end, { expr = true, desc = desc })
        end
      end

      if not LazyVim.has("yanky.nvim") then
        mappings_put()
      end

      bracketed.setup(opts)
    end,
  },

  -- display test coverage
  {
    "andythigpen/nvim-coverage",
    keys = {
      { "<leader>tcC", "<Cmd>Coverage<CR>", desc = "Load" },
      { "<leader>tcc", "<Cmd>CoverageToggle<CR>", desc = "Toggle" },
      { "<leader>tcs", "<Cmd>CoverageSummary<CR>", desc = "Summary" },
    },
    cmd = {
      "Coverage",
      "CoverageClear",
      "CoverageHide",
      "CoverageLoad",
      "CoverageLoadLcov",
      "CoverageShow",
      "CoverageSummary",
      "CoverageToggle",
    },
    opts = {
      commands = true,
    },
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>tc", group = "coverage" },
      },
    },
  },

  -- indent detection
  {
    "NMAC427/guess-indent.nvim",
    event = "LazyFile",
    cmd = "GuessIndent",
    opts = {},
  },

  -- better macros
  {
    "ecthelionvi/NeoComposer.nvim",
    dependencies = { "kkharji/sqlite.lua" },
    keys = {
      { "q", mode = { "n", "x" } },
      { "Q", mode = { "n", "x" } },
      "<m-q>",
      "<c-p>",
      "<c-n>",
    },
    opts = {
      queue_most_recent = true,
      keymaps = {
        play_macro = "q",
        toggle_record = "Q",
      },
    },
  },

  -- strip trailing whitespace on save
  {
    "mcauley-penney/tidy.nvim",
    enabled = false,
    event = "BufWritePre",
    opts = {
      filetype_exclude = { "markdown", "diff" },
    },
  },

  -- switch input method automatically depending on mode
  {
    "keaising/im-select.nvim",
    cond = jit.os == "Linux",
    event = "VeryLazy",
    opts = {},
  },

  -- image preview from neo-tree
  {
    "adelarsq/image_preview.nvim",
    config = true,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts, {
        filesystem = {
          window = {
            mappings = { ["<leader>p"] = "image_wezterm" },
          },
          commands = {
            image_wezterm = function(state)
              local node = state.tree:get_node()
              if node.type == "file" then
                require("image_preview").PreviewImage(node.path)
              end
            end,
          },
        },
      })
    end,
  },

  -- open files from a terminal buffer in current neovim instance
  {
    "willothy/flatten.nvim",
    enabled = false,
    commit = "d92c93959e9ac52a00002d6fd64c2d2ca5dd7192",
    dependencies = {
      { "willothy/wezterm.nvim", config = true },
    },
    lazy = false,
    priority = 1001,
    -- https://github.com/willothy/flatten.nvim#advanced-configuration-examples
    opts = function()
      ---@type Terminal?
      local saved_terminal

      return {
        window = { open = "alternate" },
        callbacks = {
          should_block = function(argv)
            return vim.tbl_contains(argv, "-b")
          end,
          one_per = {
            kitty = false,
            wezterm = false,
          },
          pre_open = function()
            local term = require("toggleterm.terminal")
            local termid = term.get_focused_id()
            saved_terminal = term.get(termid)
          end,
          post_open = function(bufnr, winnr, ft, is_blocking)
            if is_blocking then
              if saved_terminal then
                saved_terminal:close()
              else
                vim.notify("Failed to get focused terminal", vim.log.levels.WARN)
              end
            end

            if ft == "gitcommit" or ft == "gitrebase" then
              vim.api.nvim_create_autocmd("BufWritePost", {
                buffer = bufnr,
                once = true,
                callback = vim.schedule_wrap(function()
                  require("close_buffers").delete({ type = bufnr })
                end),
              })
            end
          end,
          block_end = function()
            vim.schedule(function()
              if saved_terminal then
                saved_terminal:open()
                saved_terminal = nil
              end
            end)
          end,
        },
      }
    end,
  },

  -- only show 'cursorline' in current window
  {
    "Tummetott/reticle.nvim",
    event = "VeryLazy",
    opts = {
      on_startup = {
        cursorline = vim.go.cursorline,
      },
      always = {
        cursorline = {
          "neo-tree",
        },
      },
      never = {
        cursorline = {
          "DressingInput",
          "TelescopePrompt",
          "alpha",
          "dashboard",
          "snacks_terminal",
          "toggleterm",
        },
      },
      ignore = {
        cursorline = {
          "noice",
        },
      },
    },
  },

  -- scope buffers to tabpages
  {
    "tiagovla/scope.nvim",
    enabled = true,
    lazy = false,
    cmd = { "ScopeSaveState", "ScopeLoadState" },
    init = function()
      vim.opt.sessionoptions:append({ "buffers", "tabpages", "globals" })
      vim.api.nvim_create_autocmd("SessionLoadPost", {
        group = Utils.augroup("scope"),
        callback = function()
          vim.cmd([[ScopeLoadState]])
        end,
      })
    end,
    config = true,
  },
  {
    "folke/persistence.nvim",
    optional = true,
    opts = {
      pre_save = function()
        if LazyVim.has("scope.nvim") then
          vim.cmd([[ScopeSaveState]])
        end
      end,
    },
  },

  -- display a character as the colorcolumn
  {
    "xiyaowong/virtcolumn.nvim",
    event = "VeryLazy",
  },

  -- forever undo
  {
    "kevinhwang91/nvim-fundo",
    dependencies = { "kevinhwang91/promise-async" },
    event = "VeryLazy",
    build = function()
      require("fundo").install()
    end,
    config = true,
  },

  -- highlights for text filetypes
  {
    "lukas-reineke/headlines.nvim",
    optional = true,
    opts = function(_, opts)
      local highlight = {
        codeblock_highlight = not style.transparent and nil,
        fat_headlines = false,
      }
      return vim.tbl_deep_extend("force", opts, {
        markdown = highlight,
        rmd = highlight,
        norg = highlight,
        org = highlight,
      })
    end,
  },

  -- nerd icon picker
  {
    "2kabhishek/nerdy.nvim",
    cmd = "Nerdy",
    keys = {
      { "<leader>ci", "<Cmd>Nerdy<CR>", desc = "Pick icon" },
    },
  },

  -- Vim sugar for UNIX shell commands
  {
    "tpope/vim-eunuch",
    lazy = false,
  },
}
