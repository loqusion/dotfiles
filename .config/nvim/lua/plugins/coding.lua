local prefer = {
  nvim_autopairs = false,
  nvim_surround = true,
}

local nvim_autopairs_spec = {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {
    fast_wrap = {},
    enable_check_bracket_line = true,
    check_ts = true,
  },
  config = function(_, opts)
    require("nvim-autopairs").setup(opts)
    -- cmp integration
    local cmp = require("cmp")
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}

local nvim_surround_spec = {
  "kylechui/nvim-surround",
  version = "*",
  ---@param plugin LazyPlugin
  ---@param keys LazyKeys
  keys = function(plugin, keys)
    ---@cast plugin any
    local opts = plugin.opts
    local mappings = {
      { opts.keymaps.insert, desc = "Insert surrounding", mode = { "i" } },
      { opts.keymaps.insert_line, desc = "Insert surrounding w/ new lines", mode = { "i" } },
      { opts.keymaps.normal, desc = "Add surrounding" },
      { opts.keymaps.normal_cur, desc = "Add surrounding cur line" },
      { opts.keymaps.normal_line, desc = "Add surrounding w/ new lines" },
      { opts.keymaps.normal_cur_line, desc = "Add surrounding cur line w/ new lines" },
      { opts.keymaps.visual, desc = "Add surrounding", mode = { "x" } },
      { opts.keymaps.visual_line, desc = "Add surrounding w/ new lines", mode = { "x" } },
      { opts.keymaps.delete, desc = "Delete surrounding" },
      { opts.keymaps.change, desc = "Change surrounding" },
    }
    mappings = vim.tbl_filter(function(m)
      return m[1] and #m[1] > 0
    end, mappings)
    return vim.list_extend(mappings, keys)
  end,
  ---@type user_options
  opts = {
    keymaps = {
      insert = false,
      insert_line = false,
      normal = "ys",
      normal_cur = "yss",
      normal_line = "yS",
      normal_cur_line = "ySS",
      visual = "S",
      visual_line = "gS",
      delete = "ds",
      change = "cs",
    },
  },
}

return {
  prefer.nvim_autopairs and nvim_autopairs_spec or {},
  { "echasnovski/mini.pairs", enabled = not prefer.nvim_autopairs },

  prefer.nvim_surround and nvim_surround_spec or {},
  { "echasnovski/mini.surround", enabled = not prefer.nvim_surround },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
    end,
  },

  {
    "danymat/neogen",
    keys = {
      {
        "<leader>cc",
        function()
          require("neogen").generate({})
        end,
        desc = "Neogen comment",
      },
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
    keys = {
      {
        "<leader>r",
        function()
          require("refactoring").select_refactor()
        end,
        mode = "x",
        desc = "Refactoring",
      },
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
    keys = { "-", "<Plug>(Switch)" },
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
    "windwp/nvim-spectre",
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
    },
  },
}
