return {
  -- window picker for neo-tree
  {
    "s1n7ax/nvim-window-picker",
    version = "",
    config = true,
  },

  -- motions respect camelCase, snake_case, etc
  {
    "chaoren/vim-wordmotion",
    event = "VeryLazy",
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
        ["core.completion"] = {
          config = { engine = "nvim-cmp" },
        },
        ["core.integrations.nvim-cmp"] = {},
      },
    },
  },

  {
    "echasnovski/mini.bracketed",
    event = "BufReadPost",
    opts = {
      window = { suffix = "" },
      quickfix = { suffix = "" },
      treesitter = { suffix = "n" },
    },
    config = function(_, opts)
      local bracketed = require("mini.bracketed")

      local function put(cmd, regtype)
        local body = vim.fn.getreg(vim.v.register)
        local type = vim.fn.getregtype(vim.v.register)
        ---@diagnostic disable-next-line: param-type-mismatch
        vim.fn.setreg(vim.v.register, body, regtype or "l")
        ---@diagnostic disable-next-line: missing-parameter
        bracketed.register_put_region()
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

  -- visualize and resolve conflicts
  {
    "akinsho/git-conflict.nvim",
    version = "",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      default_mappings = false,
    },
    config = function(_, opts)
      require("git-conflict").setup(opts)
      vim.api.nvim_create_autocmd("User", {
        group = "GitConflictCommands",
        pattern = "GitConflictDetected",
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          local function map(mode, l, r, desc)
            vim.keymap.set(mode, l, r, { buffer = buffer, desc = "Git Conflict: " .. desc })
          end
          map("n", "co", "<Plug>(git-conflict-ours)", "Choose Ours")
          map("n", "cb", "<Plug>(git-conflict-both)", "Choose Both")
          map("n", "c0", "<Plug>(git-conflict-none)", "Choose None")
          map("n", "ct", "<Plug>(git-conflict-theirs)", "Choose Theirs")
        end,
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
    -- stylua: ignore
    keys = {
      { "<leader>bdi", function() require("close_buffers").delete({ type = "hidden" }) end, desc = 'H[i]dden buffers' },
      { "<leader>bdo", function() require("close_buffers").delete({ type = "other" }) end, desc = 'Other buffers' },
      { "<leader>bdd", function() require("close_buffers").delete({ type = "this" }) end, desc = 'Current buffer' },
      { "<leader>bD", function() require("close_buffers").delete({ type = "this", force = true }) end, desc = 'Current buffer (Force)' },
    },
  },
  { "echasnovski/mini.bufremove", enabled = false },
}
