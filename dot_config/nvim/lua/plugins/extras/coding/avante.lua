---@module 'lazy'

---@type LazySpec[]
return {
  {
    "yetone/avante.nvim",
    build = LazyVim.is_win() and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" or "make",
    event = "VeryLazy",
    dependencies = {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = LazyVim.is_win(),
        },
      },
    },
    init = function()
      -- required for `avante.tokenizers` and templates to work
      require("avante_lib").load()
    end,
    ---@type avante.Config
    opts = {
      ---@type Provider
      provider = "claude",
      hints = { enabled = false },
    },
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    optional = true,
    ft = function(_, ft)
      return vim.list_extend(ft, { "Avante" })
    end,
    opts = function(_, opts)
      opts.file_types = vim.list_extend(opts.file_types or {}, { "Avante" })
    end,
  },

  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>a", group = "ai" },
      },
    },
  },
}
