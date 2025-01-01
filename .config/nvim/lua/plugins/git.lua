return {
  -- git signs
  {
    "lewis6991/gitsigns.nvim",
    opts = function(_, opts)
      local on_attach = opts.on_attach
      opts.on_attach = function(buffer)
        -- vim.keymap.set("n", "<leader>gb", "<Cmd>Gitsigns blame_line<CR>", {
        --   buffer = buffer,
        --   desc = "Blame current line",
        -- })

        if on_attach ~= nil then
          on_attach(buffer)
        end
      end
    end,
  },

  -- visualize and resolve conflicts
  {
    "akinsho/git-conflict.nvim",
    version = "",
    event = "LazyFile",
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

  -- toggle git blame annotations
  {
    "f-person/git-blame.nvim",
    enabled = false,
    event = "LazyFile",
    keys = {
      { "<leader>gB", "<Cmd>GitBlameToggle<CR>", desc = "Git Blame" },
    },
    opts = {
      enabled = false,
    },
  },

  -- copy link to remote repo
  {
    "ruifm/gitlinker.nvim",
    enabled = false,
    -- stylua: ignore
    keys = {
      -- { "<leader>gy", desc = "Copy permalink", mode = "n" },
      -- { "<leader>gy", desc = "Copy permalink to range", mode = "x" },
      -- { "<leader>gY", function() require("gitlinker").get_repo_url() end, desc = "Copy link to repo", mode = "n" },
    },
    opts = {
      mappings = "<leader>gy",
    },
  },

  -- Magit
  {
    "NeogitOrg/neogit",
    dependencies = {
      "sindrets/diffview.nvim",
    },
    cmd = "Neogit",
    keys = {
      { "<leader>gm", "<Cmd>Neogit<CR>", desc = "Neogit" },
    },
    config = true,
  },
}
