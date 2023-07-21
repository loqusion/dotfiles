local Util = require("utils")

return {
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      ---@type table<string, { name: string, plugins: string[]}>
      local defaults = {
        ["<leader>bd"] = { name = "+delete", plugins = { "bufferline.nvim", "close-buffers.nvim", "mini.bufremove" } },
        ["<leader>o"] = { name = "+open", plugins = { "peek.nvim", "ChatGPT.nvim" } },
        ["<leader>r"] = { name = "+run", plugins = { "overseer.nvim" } },
        ["<localleader>e"] = { name = "+evaulate", plugins = { "conjure" } },
        ["<localleader>ec"] = { name = "+comment", plugins = { "conjure" } },
        ["<localleader>l"] = { name = "+log", plugins = { "conjure" } },
        ["gp"] = { name = "+preview", plugins = { "goto-preview" } },
      }

      ---@param prefix string
      ---@param spec { name: string, plugins: string[] }
      defaults = vim.iter(defaults):fold({}, function(acc, prefix, spec)
        if vim.iter(spec.plugins):any(Util.has) then
          acc[prefix] = { name = spec.name }
        end
        return acc
      end)

      return vim.tbl_deep_extend("force", opts, {
        show_help = false,
        defaults = defaults,
      })
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>fe", false },
      { "<leader>fE", false },
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").get_root() })
        end,
        desc = "Explorer NeoTree (root dir)",
      },
      {
        "<leader>E",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
    },
    opts = {
      filesystem = {
        window = {
          mappings = {
            ["o"] = "open_in_external_program",
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
            unfocused = { fg = palette.incline0, bg = palette.incline1 },
          },
          winbar = {
            unfocused = { fg = palette.incline0, bg = palette.incline1 },
          },
        },
      }
    end,
  },

  -- motions respect camelCase, snake_case, etc
  {
    "chaoren/vim-wordmotion",
    event = "VeryLazy",
    keys = {
      { "av", mode = { "x", "o" }, desc = "a word (within variable)" },
      { "iv", mode = { "x", "o" }, desc = "inner word (within variable)" },
      { "w" },
      { "e" },
      { "b" },
      { "ge" },
    },
    init = function()
      vim.g.wordmotion_mappings = {
        aw = "av",
        iw = "iv",
        ["<C-R><C-W>"] = "",
      }
    end,
  },

  -- neorg
  {
    "nvim-neorg/neorg",
    ft = "norg",
    cmd = "Neorg",
    build = ":Neorg sync-parsers",
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/Documents/notes",
            },
          },
        },
        ["core.completion"] = {
          config = { engine = "nvim-cmp" },
        },
        ["core.export"] = {},
        ["core.summary"] = {},
      },
    },
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

      bracketed.setup(opts)
    end,
  },

  -- better increase/decrease
  {
    "monaqa/dial.nvim",
    -- stylua: ignore
    keys = {
      { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
      { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
    },
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%m/%d/%Y"],
          augend.semver.alias.semver,
        },
      })
    end,
  },

  -- display test coverage
  {
    "andythigpen/nvim-coverage",
    cmd = { "Coverage", "CoverageSummary" },
    opts = {
      commands = true,
    },
  },

  -- close buffers matching filter
  {
    "kazhala/close-buffers.nvim",
    cmd = { "BDelete", "BWipeout" },
    keys = {
      {
        "<leader>bdi",
        function()
          require("close_buffers").delete({ type = "hidden" })
          require("bufferline.ui").refresh()
        end,
        desc = "H[i]dden buffers",
      },
      {
        "<leader>bdo",
        function()
          require("close_buffers").delete({ type = "other" })
          require("bufferline.ui").refresh()
        end,
        desc = "Other buffers",
      },
      {
        "<leader>bdd",
        function()
          require("close_buffers").delete({ type = "this" })
        end,
        desc = "Current buffer",
      },
      {
        "<leader>bD",
        function()
          require("close_buffers").delete({ type = "this", force = true })
        end,
        desc = "Current buffer (Force)",
      },
    },
  },
  {
    "echasnovski/mini.bufremove",
    keys = {
      { "<leader>bd", false },
      { "<leader>bD", false },
    },
  },

  -- indent detection
  {
    "NMAC427/guess-indent.nvim",
    event = { "BufReadPre", "BufNewFile" },
    cmd = "GuessIndent",
    opts = {},
  },

  -- better macros
  {
    "ecthelionvi/NeoComposer.nvim",
    dependencies = { "kkharji/sqlite.lua" },
    keys = { "q", "Q", "<m-q>", "<c-p>", "<c-n>" },
    opts = {},
  },

  -- strip trailing whitespace on save
  {
    "mcauley-penney/tidy.nvim",
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
}
