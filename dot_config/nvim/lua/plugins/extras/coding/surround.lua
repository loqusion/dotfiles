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

      -- `ys...e` wraps a motion/text-object in a LaTeX environment,
      -- prompting for its name (mirrors classic vim-surround's tex support).
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "tex",
        group = vim.api.nvim_create_augroup("nvim_surround_tex", { clear = true }),
        callback = function()
          require("nvim-surround").buffer_setup({
            surrounds = {
              e = {
                add = function()
                  local config = require("nvim-surround.config")
                  local result = config.get_input("Enter the environment name: ")
                  if result then
                    return { { "\\begin{" .. result .. "}" }, { "\\end{" .. result .. "}" } }
                  end
                end,
              },
            },
          })
        end,
      })
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
