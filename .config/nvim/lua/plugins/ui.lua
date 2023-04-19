local style = require("config.style")
local Utils = require("config.utils")

return {
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = true,
        lsp_doc_border = style.border,
      },
    },
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
    },
  },

  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      local logo = [[
  ██╗     █████╗  █████╗ ██╗   ██╗███████╗██╗ █████╗ ███╗   ██╗
  ██║    ██╔══██╗██╔══██╗██║   ██║██╔════╝██║██╔══██╗████╗  ██║
  ██║    ██║  ██║██║  ██║██║   ██║███████╗██║██║  ██║██╔██╗ ██║
  ██║    ██║  ██║██║  ██║██║   ██║╚════██║██║██║  ██║██║╚██╗██║
  ███████╗█████╔╝╚███████╗██████╔╝███████║██║╚█████╔╝██║ ╚████║
  ╚══════╝╚════╝  ╚════██║╚═════╝ ╚══════╝╚═╝ ╚════╝ ╚═╝  ╚═══╝
                       ╚═╝                                      
  ]]
      opts.section.header.val = vim.split(logo, "\n")
    end,
  },

  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cS", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },

  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    init = function()
      vim.g.undotree_SetFocusWhenToggle = 1
    end,
  },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
      },
    },
  },

  {
    "folke/twilight.nvim",
    cmd = "Twilight",
    keys = {
      { "<leader>ut", "<Cmd>Twilight<CR>", desc = "Toggle Twilight" },
    },
  },

  -- floating winbar
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    config = function()
      local colors = require("tokyonight.colors").setup()
      require("incline").setup({
        -- TODO: setup highlight groups for other colorschemes
        highlight = {
          groups = {
            InclineNormal = { guibg = "#FC56B1", guifg = colors.black },
            InclineNormalNC = { guifg = "#FC56B1", guibg = colors.black },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  },

  {
    "petertriho/nvim-scrollbar",
    event = "BufReadPost",
    config = function()
      local scrollbar = require("scrollbar")
      local colors = require("tokyonight.colors")
      scrollbar.setup({
        handle = { color = colors.bg_highlight },
        excluded_filetypes = { "prompt", "TelescopePrompt", "noice", "notify" },
        marks = {
          Search = { color = colors.orange },
          Error = { color = colors.error },
          Warn = { color = colors.warning },
          Info = { color = colors.info },
          Hint = { color = colors.hint },
          Misc = { color = colors.purple },
        },
      })
    end,
  },

  -- style windows with different colorschemes
  {
    "folke/styler.nvim",
    event = "VeryLazy",
    opts = {
      themes = {
        markdown = { colorscheme = "tokyonight-storm" },
        help = { colorscheme = "oxocarbon", background = "dark" },
      },
    },
  },

  -- fun screensavers
  {
    "folke/drop.nvim",
    cond = not style.transparent, -- https://github.com/folke/drop.nvim/issues/7
    event = "VeryLazy",
    config = function()
      math.randomseed(os.time())
      -- local theme = ({ "stars", "snow" })[math.random(1, 3)]
      require("drop").setup({ theme = "spring" })
    end,
  },

  -- auto-resize windows
  {
    "anuvyklack/windows.nvim",
    event = "WinNew",
    dependencies = {
      { "anuvyklack/middleclass" },
      { "anuvyklack/animation.nvim", cond = style.animation },
    },
    keys = { { "<leader>Z", "<cmd>WindowsMaximize<cr>", desc = "Zoom" } },
    config = function()
      vim.o.winwidth = 5
      vim.o.equalalways = false
      require("windows").setup({
        animation = { enable = style.animation, duration = 150 },
      })
    end,
  },

  {
    "akinsho/bufferline.nvim",
      -- stylua: ignore
    keys = {
      { "<leader>bdl", "<Cmd>BufferLineCloseRight<CR>", desc = "Buffers to right" },
      { "<leader>bdh", "<Cmd>BufferLineCloseLeft<CR>", desc = "Buffers to left" },
    },
    init = function()
      if Utils.has("which-key.nvim") then
        require("which-key").register({
          ["<leader>bd"] = { name = "+delete" },
        })
      end
    end,
  },

  -- Ultra fold
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    event = "BufReadPost",
    -- stylua: ignore
    keys = {
      { "zR", function() require("ufo").openAllFolds() end },
      { "zM", function() require("ufo").closeAllFolds() end },
    },
    opts = {
      provider_selector = function()
        return { "treesitter", "indent" }
      end,
    },
  },

  -- 'statuscolumn' customization
  {
    "luukvbaal/statuscol.nvim",
    event = "BufReadPost",
    config = function()
      local builtin = require("statuscol.builtin")
      require("statuscol").setup({
        segments = {
          {
            text = { builtin.lnumfunc, " " },
            condition = { true, builtin.not_empty },
            click = "v:lua.ScLa",
          },
          { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
          { text = { "%s" }, click = "v:lua.ScSa" },
        },
      })
    end,
  },

  -- better diffing
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    keys = { { "<leader>gd", "<Cmd>DiffviewOpen<CR>", desc = "Diffview" } },
    config = true,
  },
}
