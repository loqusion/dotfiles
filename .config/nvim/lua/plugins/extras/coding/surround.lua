return {
  { "echasnovski/mini.surround", enabled = false },
  {
    "kylechui/nvim-surround",
    version = "*",
    ---@param plugin LazyPlugin
    ---@param keys LazyKeys
    keys = function(plugin, keys)
      ---@cast plugin any
      local opts = plugin.opts
      local mappings = {
        { opts.keymaps.insert, desc = "Insert surrounding", mode = { "i" } },
        { opts.keymaps.insert_line, desc = "Insert surrounding w/ new lines", mode = { "i" } },
        { opts.keymaps.normal, desc = "Add surrounding" },
        { opts.keymaps.normal_cur, desc = "Add surrounding cur line" },
        { opts.keymaps.normal_line, desc = "Add surrounding w/ new lines" },
        { opts.keymaps.normal_cur_line, desc = "Add surrounding cur line w/ new lines" },
        { opts.keymaps.visual, desc = "Add surrounding", mode = { "x" } },
        { opts.keymaps.visual_line, desc = "Add surrounding w/ new lines", mode = { "x" } },
        { opts.keymaps.delete, desc = "Delete surrounding" },
        { opts.keymaps.change, desc = "Change surrounding" },
      }
      mappings = vim.tbl_filter(function(m)
        return m[1] and #m[1] > 0
      end, mappings)

      return vim.list_extend(mappings, keys)
    end,
    opts = {
      keymaps = {
        insert = false,
        insert_line = false,
        normal = "ys",
        normal_cur = "yss",
        normal_line = "yS",
        normal_cur_line = "ySS",
        visual = "gS",
        visual_line = false,
        delete = "ds",
        change = "cs",
      },
      highlight = { duration = math.huge },
    },
  },
}
