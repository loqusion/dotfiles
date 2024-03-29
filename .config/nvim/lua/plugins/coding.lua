local tabout = require("utils.tabout")

return {
  {
    "L3MON4D3/LuaSnip",
    -- stylua: ignore
    keys = {
      {
        "<tab>",
        function()
          if require("luasnip").expand_or_jumpable(1) then
            return "<Plug>luasnip-expand-or-jump"
          else
            return "<Plug>(Tabout)"
          end
        end,
        expr = true, silent = true, mode = "i",
      },
    },
  },

  {
    "abecodes/tabout.nvim",
    -- stylua: ignore
    keys = {
      { "<Plug>(Tabout)", function() tabout.tabout() end, mode = "i" },
      { "<Plug>(TaboutMulti)", function() tabout.taboutMulti() end, mode = "i" },
      { "<Plug>(TaboutBack)", function() tabout.taboutBack() end, mode = "i" },
      { "<Plug>(TaboutBackMulti)", function() tabout.taboutBackMulti() end, mode = "i" },
    },
    opts = {
      -- Disable default keybinds to avoid conflicts
      tabkey = "",
      backwards_tabkey = "",
    },
    config = function(_, opts)
      -- WARN: Using internal api which may change in the future
      require("tabout.config").setup(opts)
    end,
  },

  {
    "danymat/neogen",
    -- stylua: ignore
    keys = {
      { "<leader>cc", function() require("neogen").generate({ }) end, desc = "Neogen comment" },
    },
    opts = { snippet_engine = "luasnip" },
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
      { "<leader>cs", function() require("iswap").iswap_with() end, desc = "Swap" },
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

  {
    "echasnovski/mini.ai",
    opts = {
      custom_textobjects = {
        t = { "<(%w-)%f[^<%w][^<>]->.-</%1>", "^<.->%s*().-()%s*</[^/]->$" },
        T = { "<(%w-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
        e = function()
          local from = { line = 1, col = 1 }
          local to = {
            line = vim.fn.line("$"),
            ---@diagnostic disable-next-line: param-type-mismatch
            col = math.max(vim.fn.getline("$"):len(), 1),
          }
          return { from = from, to = to }
        end,
      },
    },
    config = function(_, opts)
      require("mini.ai").setup(opts)
      require("lazyvim.util").on_load("which-key.nvim", function()
        ---@type table<string, string|table>
        local i = {
          [" "] = "Whitespace",
          ['"'] = 'Balanced "',
          ["'"] = "Balanced '",
          ["`"] = "Balanced `",
          ["("] = "Balanced (",
          [")"] = "Balanced ) including white-space",
          [">"] = "Balanced > including white-space",
          ["<lt>"] = "Balanced <",
          ["]"] = "Balanced ] including white-space",
          ["["] = "Balanced [",
          ["}"] = "Balanced } including white-space",
          ["{"] = "Balanced {",
          ["?"] = "User Prompt",
          _ = "Underscore",
          a = "Argument",
          b = "Balanced ), ], }",
          c = "Class",
          f = "Function",
          o = "Block, conditional, loop",
          q = "Quote `, \", '",
          t = "Tag",
          T = "Tag including white-space",
          e = "Entire Buffer",
        }
        local a = vim.deepcopy(i)
        for k, v in pairs(a) do
          ---@cast v string
          a[k] = v:gsub(" including.*", "")
        end

        local ic = vim.deepcopy(i)
        local ac = vim.deepcopy(a)
        for key, name in pairs({ n = "Next", l = "Last" }) do
          i[key] = vim.tbl_extend("force", { name = "Inside " .. name .. " textobject" }, ic)
          a[key] = vim.tbl_extend("force", { name = "Around " .. name .. " textobject" }, ac)
        end
        require("which-key").register({
          mode = { "o", "x" },
          i = i,
          a = a,
        })
      end)
    end,
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
