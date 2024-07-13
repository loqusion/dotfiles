return {
  {
    "danymat/neogen",
    -- stylua: ignore
    keys = {
      { "<leader>cn", function() require("neogen").generate({}) end, desc = "Neogen comment" },
    },
    opts = function(_, opts)
      if LazyVim.has("LuaSnip") then
        opts.snippet_engine = "luasnip"
      end
    end,
  },

  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },

  {
    "ThePrimeagen/refactoring.nvim",
    -- stylua: ignore
    keys = {
      { "<leader>r", function() require("refactoring").select_refactor({}) end, mode = "x", desc = "Refactoring" },
    },
    opts = {},
  },

  -- split/join
  {
    "Wansmer/treesj",
    -- stylua: ignore
    keys = {
      { "<leader>cj", function() require("treesj").split() end, desc = "Split block" },
      { "<leader>ck", function() require("treesj").join() end, desc = "Join block" },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      use_default_keymaps = false,
      cursor_behavior = "hold",
    },
  },

  -- switch with predefined replacements
  {
    "AndrewRadev/switch.vim",
    enabled = false,
    keys = { "-", "<Plug>(Switch)", desc = "Switch" },
    init = function()
      vim.g.switch_mapping = "-"
    end,
  },

  -- Swap arguments/elements/etc
  {
    "mizlan/iswap.nvim",
    cmd = { "ISwap", "ISwapWith" },
    -- stylua: ignore
    keys = {
      { "<leader>cw", function() require("iswap").iswap_with() end, desc = "S[w]ap" },
    },
    opts = {},
  },

  -- Peek lines during `:{num}`
  {
    "nacro90/numb.nvim",
    event = "CmdlineEnter",
    opts = {
      show_numbers = true,
      show_cursorline = true,
      number_only = false,
      centered_peeking = true,
    },
  },

  -- structural search and replace
  {
    "cshuaimin/ssr.nvim",
    -- stylua: ignore
    keys = {
      { "<leader>sr", function() require("ssr").open() end, mode = { "n", "x" }, desc = "Replace (ssr)" },
    },
  },
  {
    "nvim-pack/nvim-spectre",
    -- stylua: ignore
    keys = {
      { "<leader>sr", false },
      { "<leader>sR", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>sR", false },
      { "<leader>su", "<cmd>Telescope resume<CR>", desc = "Res[u]me" },
    },
  },

  -- infer parentheses for lisp-like languages
  {
    "eraserhd/parinfer-rust",
    enabled = false, -- TODO: re-enable when it's not buggy?
    event = "VeryLazy",
    build = "cargo build --release",
  },

  {
    "zbirenbaum/copilot.lua",
    optional = true,
    opts = {
      filetypes = {
        gitcommit = true,
        markdown = false,
        mdx = false,
        ["markdown.mdx"] = false,
        typst = false,
      },
    },
  },
}
