---@module 'lazy'

---@type LazySpec[]
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
    version = "*",
    event = "LazyFile",
    opts = {
      default_mappings = false,
    },
    config = function(_, opts)
      require("git-conflict").setup(opts)

      local modes = { "n" }
      local keys = {
        { "co", "<Plug>(git-conflict-ours)", "Choose Ours" },
        { "ct", "<Plug>(git-conflict-theirs)", "Choose Theirs" },
        { "cb", "<Plug>(git-conflict-both)", "Choose Both" },
        { "c0", "<Plug>(git-conflict-none)", "Choose None" },
      }
      local group = vim.api.nvim_create_augroup("UserGitConflict", { clear = true })

      vim.api.nvim_create_autocmd("User", {
        group = group,
        pattern = "GitConflictDetected",
        callback = function()
          local buf = vim.api.nvim_get_current_buf()
          if vim.b[buf].conflict_mappings_set then
            return
          end
          vim.b[buf].conflict_mappings_set = true
          for _, k in ipairs(keys) do
            vim.keymap.set(modes, k[1], k[2], { buffer = buf, desc = "Git Conflict: " .. k[3] })
          end
        end,
      })

      vim.api.nvim_create_autocmd("User", {
        group = group,
        pattern = "GitConflictResolved",
        callback = function()
          local buf = vim.api.nvim_get_current_buf()
          if not vim.b[buf].conflict_mappings_set then
            return
          end
          for _, k in ipairs(keys) do
            pcall(vim.keymap.del, modes, k[1], { buffer = buf })
          end
          vim.b[buf].conflict_mappings_set = false
        end,
      })
    end,
  },

  -- better diffing
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    keys = { { "<leader>gD", "<Cmd>DiffviewOpen<CR>", desc = "Diffview" } },
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
    enabled = false,
    dependencies = {
      "sindrets/diffview.nvim",
    },
    cmd = {
      "Neogit",
      "NeogitCommit",
      "NeogitLog",
      "NeogitResetState",
    },
    keys = {
      { "<leader>gm", "<Cmd>Neogit<CR>", desc = "Neogit" },
    },
    opts = {
      signs = {
        item = { "", "" },
        section = { "", "" },
      },
    },
  },
}
