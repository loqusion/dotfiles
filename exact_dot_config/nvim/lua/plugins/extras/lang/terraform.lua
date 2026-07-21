---@module 'lazy'

---@type LazySpec[]
return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        hcl = { "packer_fmt" },
      },
    },
  },
}
