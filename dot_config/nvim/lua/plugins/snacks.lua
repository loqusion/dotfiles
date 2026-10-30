---@module 'lazy'

---@type LazySpec[]
return {
  {
    "folke/snacks.nvim",
    -- stylua: ignore
    keys = {
      { "<leader>n", function() Snacks.notifier.show_history() end, desc = "Notification History" },
    },
    opts = {
      scroll = {
        animate = {
          duration = { step = 15, total = 50 },
        },
      },
      picker = {
        sources = {
          git_log_line = {
            actions = {
              yank_commit = { action = "yank", field = "commit" },
            },
            win = {
              input = { keys = { ["<c-y>"] = { "yank_commit", mode = { "n", "i" } } } },
              list = { keys = { ["y"] = "yank_commit" } },
            },
          },
        },
      },
    },
  },
}
