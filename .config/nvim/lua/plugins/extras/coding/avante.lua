return {
  {
    "yetone/avante.nvim",
    build = LazyVim.is_win() and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" or "make",
    event = "VeryLazy",
    init = function()
      -- required for `avante.tokenizers` and templates to work
      require("avante_lib").load()
    end,
    opts = {
      hints = { enabled = false },
    },
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    optional = true,
    ft = function(_, ft)
      vim.list_extend(ft, { "Avante" })
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
