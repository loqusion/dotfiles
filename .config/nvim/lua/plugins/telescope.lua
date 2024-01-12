return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    keys = {
      {
        "<leader>fP",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
      {
        "<leader>fl",
        function()
          local files = {} ---@type table<string, string>
          for _, plugin in pairs(require("lazy.core.config").plugins) do
            repeat
              if plugin._.module then
                local info = vim.loader.find(plugin._.module)[1]
                if info then
                  files[info.modpath] = info.modpath
                end
              end
              plugin = plugin._.super
            until not plugin
          end
          require("telescope.builtin").live_grep({
            default_text = "/",
            search_dirs = vim.tbl_values(files),
          })
        end,
        desc = "Find Lazy Plugin Spec",
      },
    },
  },

  {
    "renerocksai/telekasten.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    cmd = "Telekasten",
    keys = {
      { "<leader>nf", "<Cmd>Telekasten find_notes<CR>", desc = "Find" },
      { "<leader>ng", "<Cmd>Telekasten search_notes<CR>", desc = "Search" },
      { "<leader>nd", "<Cmd>Telekasten goto_today<CR>", desc = "Today" },
      { "<leader>nz", "<Cmd>Telekasten follow_link<CR>", desc = "Follow link", ft = { "telekasten" } },
      { "<leader>nn", "<Cmd>Telekasten new_note<CR>", desc = "New" },
      { "<leader>nc", "<Cmd>Telekasten show_calendar<CR>", desc = "Calendar" },
      { "<leader>nb", "<Cmd>Telekasten show_backlinks<CR>", desc = "Show backlinks", ft = { "telekasten" } },
      { "<leader>nI", "<Cmd>Telekasten insert_img_link<CR>", desc = "Insert image link" },
      { "[[", "<Cmd>Telekasten insert_link<CR>", desc = "Insert link", ft = { "telekasten" }, mode = "i" },
    },
    opts = {
      home = vim.fn.expand("~/Documents/Notes"),
    },
  },
}
