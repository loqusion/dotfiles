---@module 'lazy'

---@type LazySpec[]
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
    opts = function(_, opts)
      local actions = require("telescope.actions")

      -- Restore defaults
      opts.defaults.mappings.i["<C-f>"] = actions.preview_scrolling_left
      opts.defaults.mappings.i["<C-b>"] = nil
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = function()
      if LazyVim.pick.want() ~= "telescope" then
        return
      end

      local Keys = require("lazyvim.plugins.lsp.keymaps").get()

      ---@param key string
      ---@param keys LazyKeysLspSpec[]
      ---@return LazyKeysLspSpec | nil
      local function remove_key(key, keys)
        for i, v in ipairs(keys) do
          if v[1] == key then
            return table.remove(keys, i)
          end
        end
      end

      remove_key("gd", Keys)
      remove_key("gI", Keys)
      remove_key("gy", Keys)

      -- LazyVim sets `reuse_win` to `true`. When `reuse_win` is `true`, if you
      -- open a buffer in multiple windows and goto a definition/etc in the
      -- second window, it will use the first window, which is bad.
      -- stylua: ignore
      vim.list_extend(Keys, {
        { "gd", function() require("telescope.builtin").lsp_definitions({ reuse_win = false }) end, desc = "Goto Definition", has = "definition" },
        { "gI", function() require("telescope.builtin").lsp_implementations({ reuse_win = false }) end, desc = "Goto Implementation" },
        { "gy", function() require("telescope.builtin").lsp_type_definitions({ reuse_win = false }) end, desc = "Goto T[y]pe Definition" },
      })
    end,
  },
}
