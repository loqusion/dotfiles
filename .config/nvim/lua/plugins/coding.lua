local prefer = {
  nvim_autopairs = false,
  nvim_surround = false,
}

local Utils = require("utils")

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
    "L3MON4D3/LuaSnip",
    -- stylua: ignore
    keys = {
      {
        "<tab>",
        function()
          return require("luasnip").expand_or_jumpable(1) and "<Plug>luasnip-expand-or-jump" or "<tab>"
        end,
        expr = true, silent = true, mode = "i",
      },
    },
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
      { "<leader>r", function() require("refactoring").select_refactor() end, mode = "x", desc = "Refactoring" },
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
            col = math.max(vim.fn.getline("$"):len(), 1),
          }
          return { from = from, to = to }
        end,
      },
    },
    config = function(_, opts)
      require("mini.ai").setup(opts)
      if Utils.has("which-key.nvim") then
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
      end
    end,
  },
}