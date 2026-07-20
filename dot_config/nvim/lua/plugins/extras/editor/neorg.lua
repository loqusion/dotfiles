---@module 'lazy'

---@type LazySpec[]
return {
  {
    "nvim-neorg/neorg",
    lazy = false,
    version = "*",
    dependencies = {
      {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        opts = {},
        config = true,
      },
    },
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/Documents/Notes",
            },
          },
        },
        ["core.completion"] = {
          config = { engine = "nvim-cmp" },
        },
        ["core.export"] = {},
        ["core.summary"] = {},
      },
    },
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
        { name = "neorg" },
      }))
      return opts
    end,
  },
}
