return {
  -- visualize and resolve conflicts
  {
    "akinsho/git-conflict.nvim",
    version = "",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      default_mappings = false,
    },
    config = function(_, opts)
      require("git-conflict").setup(opts)
      vim.api.nvim_create_autocmd("User", {
        group = "GitConflictCommands",
        pattern = "GitConflictDetected",
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          local function map(mode, l, r, desc)
            vim.keymap.set(mode, l, r, { buffer = buffer, desc = "Git Conflict: " .. desc })
          end
          map("n", "co", "<Plug>(git-conflict-ours)", "Choose Ours")
          map("n", "cb", "<Plug>(git-conflict-both)", "Choose Both")
          map("n", "c0", "<Plug>(git-conflict-none)", "Choose None")
          map("n", "ct", "<Plug>(git-conflict-theirs)", "Choose Theirs")
        end,
      })
    end,
  },

  -- better diffing
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    keys = { { "<leader>gd", "<Cmd>DiffviewOpen<CR>", desc = "Diffview" } },
    config = true,
  },

  {
    "tpope/vim-fugitive",
    cmd = {
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit",
      "Gsplit",
      "Gvsplit",
      "Gtabedit",
    },
  },
  {
    "tpope/vim-rhubarb",
    dependencies = "tpope/vim-fugitive",
    cmd = "GBrowse",
  },
}
