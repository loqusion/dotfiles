return {
  { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },

  -- modern matchit and matchparen
  {
    "andymass/vim-matchup",
    enabled = true, -- WARN: This plugin has caused an annoying bug with cmp in the past
    event = "BufReadPost",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "status_manual" }
    end,
  },

  {
    "RRethy/nvim-treesitter-endwise",
    event = "BufReadPost",
  },

  -- color highlighter
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      filetypes = { "*", "!lazy" },
      buftype = { "*", "!prompt", "!nofile" },
      user_default_options = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = false, -- "Name" codes like Blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        AARRGGBB = false, -- 0xAARRGGBB hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes: foreground, background
        -- Available modes for `mode`: foreground, background,  virtualtext
        mode = "background", -- Set the display mode.
        virtualtext = "■",
      },
    },
  },

  -- switch.vim, but with treesitter
  {
    "CKolkey/ts-node-action",
    keys = {
      -- stylua: ignore
      { "-", function() require("ts-node-action").node_action() end, desc = "Trigger Node Action" },
    },
    opts = {},
  },

  {
    "nvim-treesitter/nvim-treesitter",
    ---@class TSConfig
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "css",
        "diff",
        "fennel",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "graphql",
        "html",
        "htmldjango",
        "http",
        "javascript",
        "jq",
        "json",
        "json5",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "teal",
        "todotxt",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
        "styled",
      },
      auto_install = true,
      autotag = { enable = true },
      endwise = { enable = true },
      indent = { enable = true },
      matchup = { enable = true },
      query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { "BufWrite", "CursorHold" },
      },
      playground = {
        enable = true,
      },
    },
  },
}
