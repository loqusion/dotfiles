---@module 'lazy'

---@type LazySpec[]
return {
  { "nvim-mini/mini.surround", enabled = false },
  {
    "kylechui/nvim-surround",
    version = "*",
    -- v4 dropped the `keymaps` setup option; keymaps are now bound via
    -- <Plug> mappings when the plugin loads, gated by these globals.
    -- See `:h nvim-surround.migrating.v3_to_v4`.
    init = function()
      vim.g.nvim_surround_no_insert_mappings = true
    end,
    keys = {
      { "ys", desc = "Add surrounding" },
      { "yss", desc = "Add surrounding cur line" },
      { "yS", desc = "Add surrounding w/ new lines" },
      { "ySS", desc = "Add surrounding cur line w/ new lines" },
      { "S", desc = "Add surrounding", mode = "x" },
      { "gS", desc = "Add surrounding w/ new lines", mode = "x" },
      { "ds", desc = "Delete surrounding" },
      { "cs", desc = "Change surrounding" },
      { "cS", desc = "Change surrounding w/ new lines" },
    },
    opts = {
      highlight = { duration = math.huge },
    },
  },
}
