return {
  {
    "nvim-telescope/telescope.nvim",
    -- TODO: remove this when fix for #2667 is merged
    -- https://github.com/nvim-telescope/telescope.nvim/pull/2679
    dev = true,
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    keys = {
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
    },
  },
}
