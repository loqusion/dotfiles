local Util = require("utils")

return {
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      ---@type table<string, { name: string, plugins: string[]}>
      local defaults = {
        ["<leader>bd"] = { name = "+delete", plugins = { "bufferline.nvim", "close-buffers.nvim", "mini.bufremove" } },
        ["<leader>t"] = { name = "+test/task", plugins = { "neotest", "overseer.nvim" } },
        ["<localleader>e"] = { name = "+evaulate", plugins = { "conjure" } },
        ["<localleader>ec"] = { name = "+comment", plugins = { "conjure" } },
        ["<localleader>l"] = { name = "+log", plugins = { "conjure" } },
      }

      ---@param prefix string
      ---@param spec { name: string, plugins: string[] }
      defaults = vim.map(function(prefix, spec)
        if not vim.iter(spec.plugins):any(Util.has) then
          return nil
        end
        return { prefix, { name = spec.name } }
      end, defaults)

      return vim.tbl_deep_extend("force", opts, {
        defaults = defaults,
      })
    end,
  },

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
      { "<leader>bdi", function() require("close_buffers").delete({ type = "hidden" }) require("bufferline.ui").refresh() end, desc = 'H[i]dden buffers' },
      { "<leader>bdo", function() require("close_buffers").delete({ type = "other" }) require("bufferline.ui").refresh() end, desc = 'Other buffers' },
      { "<leader>bdd", function() require("close_buffers").delete({ type = "this" }) end, desc = 'Current buffer' },
      { "<leader>bD", function() require("close_buffers").delete({ type = "this", force = true }) end, desc = 'Current buffer (Force)' },
    },
  },
  { "echasnovski/mini.bufremove", enabled = false },

  {
    "NMAC427/guess-indent.nvim",
    event = { "BufReadPre", "BufNewFile" },
    cmd = "GuessIndent",
    opts = {},
  },
}
