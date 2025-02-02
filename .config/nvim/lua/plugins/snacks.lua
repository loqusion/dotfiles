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
    },
  },
}
