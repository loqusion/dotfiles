local style = require("config.style")

return {
  {
    "akinsho/toggleterm.nvim",
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
    "anuvyklack/hydra.nvim",
    keys = { "zl", "zh", "zL", "zH" },
    config = function()
      local Hydra = require("hydra")
      Hydra({
        name = "Side scroll",
        mode = "n",
        body = "z",
        heads = {
          { "h", "5zh" },
          { "l", "5zl" },
          { "H", "zH" },
          { "L", "zL" },
        },
        config = { hint = false },
      })
    end,
  },

  -- rest client
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    config = function(_, opts)
      require("rest-nvim").setup(opts)
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("loqusion_http", {}),
        pattern = "http",
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          vim.keymap.set("n", "<CR>", "<Plug>RestNvim", { desc = "Rest", buffer = buffer })
        end,
      })
    end,
  },

  -- jk = <Esc>
  {
    "kana/vim-arpeggio",
    event = "InsertEnter",
    init = function()
      vim.g.arpeggio_timeoutlen = 50
    end,
    config = function()
      vim.fn["arpeggio#map"]("i", "", 0, "jk", "<Esc>")
    end,
  },

  -- copy-paste over ssh with osc52
  {
    "ibhagwan/smartyank.nvim",
    event = "VeryLazy",
    opts = {
      -- we already have this
      highlight = { enabled = false },
    },
  },

  -- paste image in markdown
  {
    "ekickx/clipboard-image.nvim",
    cmd = "PasteImg",
    build = "brew install pngpaste",
  },
}
