---@module 'lazy'

local Utils = require("utils")
local style = require("config.style")

---@type LazySpec[]
return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts, {
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
          hover = {
            enabled = true,
            silent = true,
          },
        },
        presets = {
          bottom_search = true,
          command_palette = true,
          long_message_to_split = true,
          lsp_doc_border = style.border,
        },
      })
    end,
    config = function(_, opts)
      require("noice").setup(opts)
      vim.api.nvim_create_autocmd("FileType", {
        group = Utils.augroup("noice_markdown"),
        pattern = "markdown",
        callback = function(event)
          vim.schedule(function()
            require("noice.text.markdown").keys(event.buf)
          end)
        end,
      })
    end,
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
    },
  },

  {
    "goolord/alpha-nvim",
    optional = true,
    opts = function(_, opts)
      -- stylua: ignore
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
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      local function assert_lualine(actual, expected, name)
        return assert(
          string.gsub(actual, "%s", "") == string.gsub(expected, "%s", ""),
          ("Expected `%s` to be `%s`; found `%s` \nCheck https://github.com/LazyVim/LazyVim to see if its lualine config changed"):format(
            name,
            expected,
            actual
          )
        )
      end

      -- notification and error when upstream lualine_a changes
      assert_lualine(vim.inspect(opts.sections.lualine_a), '{ "mode" }', "opts.sections.lualine_a")

      table.insert(opts.sections.lualine_x, 3, { "overseer" })

      opts.options = vim.tbl_deep_extend("force", opts.options, {
        component_separators = "|",
        section_separators = { left = "", right = "" },
      })
      opts.sections = vim.tbl_deep_extend("force", opts.sections, {
        lualine_a = {
          { "mode", separator = { left = "", right = "" } },
        },
        lualine_y = {
          {
            function()
              local tors = vim.o.expandtab and "spaces" or "tab size"
              local size = vim.o.shiftwidth ~= 0 and vim.o.shiftwidth or vim.o.tabstop
              return ("%s: %s"):format(tors, size)
            end,
            cond = function()
              return vim.o.modifiable
            end,
          },
        },
        lualine_z = {
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 }, separator = { right = "" } },
        },
      })
    end,
  },

  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    keys = {
      { "<leader>fu", "<Cmd>UndotreeToggle<CR>", desc = "Undotree" },
    },
    deactivate = function()
      vim.cmd([[UndotreeHide]])
    end,
    init = function()
      vim.g.undotree_SetFocusWhenToggle = 1
    end,
  },

  -- floating winbar
  {
    "b0o/incline.nvim",
    event = "LazyFile",
    config = function()
      local function get_palette()
        local ok, incline0, incline1 = pcall(function()
          local palette = require("utils.palette")
          if not palette.supported then
            return "", ""
          end
          return palette.incline0, palette.incline1
        end)

        if not ok then
          return
        end

        if incline0 == nil or incline1 == nil then
          vim.notify_once(
            ("Please ensure `incline0` and `incline1` are defined for colorscheme '%s' in palette.lua,\nor set them to `\"\"` explicitly."):format(
              vim.g.colors_name
            ),
            vim.log.levels.WARN,
            { title = "incline.nvim" }
          )
          return
        end

        if incline0 == false then
          incline0 = nil
        end
        if incline1 == false then
          incline1 = nil
        end
        return incline0, incline1
      end

      local incline0, incline1 = get_palette()

      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = incline1, guifg = incline0 },
            InclineNormalNC = { guifg = incline1, guibg = incline0 },
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
    dependencies = {
      "kevinhwang91/nvim-hlslens",
    },
    config = function()
      local scrollbar = require("scrollbar")
      local palette = require("utils.palette")
      scrollbar.setup({
        handle = { color = palette.overlay0 },
        excluded_filetypes = {
          "TelescopePrompt",
          "cmp_docs",
          "cmp_menu",
          "noice",
          "notify",
          "prompt",
        },
        marks = {
          Search = { color = palette.search },
          Error = { color = palette.error },
          Warn = { color = palette.warning },
          Info = { color = palette.info },
          Hint = { color = palette.hint },
          Misc = { color = palette.misc },
        },
        handlers = { cursor = false },
      })
      require("scrollbar.handlers.search").setup({ override_lens = function() end })
    end,
  },

  -- style windows with different colorschemes
  {
    "folke/styler.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.themes = {} -- required, or else neovim goes apeshit
      local palette = require("utils.palette")
      if #palette.colorscheme > 0 then
        vim.tbl_deep_extend("force", opts, {
          themes = {
            markdown = { colorscheme = palette.colorscheme.secondary },
            ["markdown.mdx"] = { colorscheme = palette.colorscheme.secondary },
            help = { colorscheme = palette.colorscheme.tertiary, background = "dark" },
          },
        })
      end
      return opts
    end,
  },

  -- fun screensavers
  {
    "folke/drop.nvim",
    enabled = false,
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
    enabled = false,
    dependencies = {
      { "anuvyklack/middleclass" },
      { "anuvyklack/animation.nvim", cond = style.animation },
    },
    event = "WinNew",
    keys = { { "<leader>Z", "<cmd>WindowsMaximize<cr>", desc = "Zoom" } },
    opts = {
      animation = {
        enable = style.animation,
        duration = 150,
      },
      -- FIXME: file types are not ignored
      ignore = {
        buftype = { "quickfix" },
        filetype = {
          "NvimTree",
          "Outline",
          "gundo",
          "neo-tree",
          "neotest-summary",
          "undotree",
        },
      },
    },
    config = function(_, opts)
      vim.o.winwidth = 5
      vim.o.winminwidth = 5
      vim.o.equalalways = false
      require("windows").setup(opts)
    end,
  },

  -- tabline-like bufferline
  {
    -- "akinsho/bufferline.nvim",
    "loqusion/bufferline.nvim",
    dev = true,
    keys = {
      { "<leader>br", false },
      { "<leader>bl", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
      { "<leader>bh", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
      { "<C-S-L>", "<Cmd>BufferLineMoveNext<CR>", desc = "Move Buffer to the Right" },
      { "<C-S-H>", "<Cmd>BufferLineMovePrev<CR>", desc = "Move Buffer to the Left" },
    },
    ---@param opts bufferline.UserConfig
    opts = function(_, opts)
      local pinned_group = require("bufferline.groups").builtin.pinned:with({ icon = "󰤱" })
      ---@type bufferline.UserConfig
      local overrides = {
        options = {
          show_buffer_close_icons = false,
          groups = {
            items = {
              pinned_group,
            },
          },
        },
      }
      return vim.tbl_deep_extend("force", opts, overrides)
    end,
  },

  -- Ultra fold
  {
    "kevinhwang91/nvim-ufo",
    optional = true,
    dependencies = "kevinhwang91/promise-async",
    -- event = "BufReadPost",
    -- stylua: ignore
    keys = {
      { "zR", function() require("ufo").openAllFolds() end },
      { "zM", function() require("ufo").closeAllFolds() end },
      { "zr", function() require("ufo").openFoldsExceptKinds() end },
      { "zm", function() require("ufo").closeFoldsWith() end },
    },
    -- opts = {
    --   close_fold_kinds = { "imports" },
    --   provider_selector = function(_, filetype)
    --     local ts = { "treesitter", "indent" }
    --     local providers = {
    --       lua = ts,
    --       zsh = ts,
    --     }
    --     return providers[filetype]
    --   end,
    -- },
  },
  -- Neovim hasn't added foldingRange to default capabilities, users must add it manually
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     capabilities = {
  --       textDocument = {
  --         foldingRange = {
  --           dynamicRegistration = false,
  --           lineFoldingOnly = true,
  --         },
  --       },
  --     },
  --   },
  -- },

  -- 'statuscolumn' customization
  {
    "luukvbaal/statuscol.nvim",
    optional = true,
    event = "BufReadPost",
    -- config = function()
    --   local builtin = require("statuscol.builtin")
    --   require("statuscol").setup({
    --     segments = {
    --       {
    --         text = { builtin.lnumfunc, " " },
    --         condition = { true, builtin.not_empty },
    --         click = "v:lua.ScLa",
    --       },
    --       { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
    --       { text = { "%s" }, click = "v:lua.ScSa" },
    --     },
    --   })
    -- end,
  },

  {
    "akinsho/toggleterm.nvim",
    version = "v2.*",
    cmd = "ToggleTerm",
    keys = function(plugin)
      return {
        { plugin.opts.open_mapping, desc = "Toggle Terminal" },
      }
    end,
    opts = {
      direction = "float",
      border = "shadow",
      shell = vim.env.SHELL,
      open_mapping = [[<C-\>]],
      float_opts = {
        border = style.border,
      },
    },
  },

  {
    "nvim-colortils/colortils.nvim",
    enabled = false,
    cmd = "Colortils",
    keys = {
      { "<leader>co", "<cmd>Colortils picker<cr>", desc = "Colortils" },
    },
    config = true,
  },

  {
    "carbon-steel/detour.nvim",
    cmd = "Detour",
    keys = {
      { "<leader>wD", "<Cmd>Detour<CR>", desc = "Detour" },
    },
  },
}
