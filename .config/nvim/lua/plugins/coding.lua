---@module 'lazy'

---@type LazySpec[]
return {
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

  {
    "smoka7/multicursors.nvim",
    enabled = false, -- buggy
    dependencies = {
      "nvimtools/hydra.nvim",
    },
    event = "VeryLazy",
    cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
    keys = {
      {
        "_",
        "<Cmd>MCstart<CR>",
        desc = "Create a selection for selected text or word under the cursor",
        mode = { "n", "v" },
      },
    },
    opts = {
      hint_config = {
        float_opts = {
          border = "rounded",
        },
        position = "bottom-right",
      },
      generate_hints = {
        normal = true,
        insert = true,
        extend = true,
        config = {
          column_count = 1,
        },
      },
    },
  },
}
