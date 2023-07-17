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

  -- git signs
  {
    "lewis6991/gitsigns.nvim",
    opts = function(_, opts)
      local on_attach = opts.on_attach
      opts.on_attach = function(buffer)
        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        map("n", "<leader>gb", "<Cmd>Gitsigns blame_line<CR>", "Blame current line")

        on_attach(buffer)
      end
    end,
  },

  -- toggle git blame annotations
  {
    "f-person/git-blame.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      { "<leader>gB", "<Cmd>GitBlameToggle<CR>", desc = "Git Blame" },
    },
    init = function()
      vim.g.gitblame_enabled = 0
    end,
  },

  -- show history of commits under the cursor
  {
    "rhysd/git-messenger.vim",
    event = "BufRead",
    keys = {
      { "<leader>gm", "<Plug>(git-messenger)", desc = "Git Messenger" },
    },
  },

  -- copy link to remote repo
  {
    "ruifm/gitlinker.nvim",
    -- stylua: ignore
    keys = {
      { "<leader>gy", desc = "Copy permalink", mode = "n" },
      { "<leader>gy", desc = "Copy permalink to range", mode = "x" },
      { "<leader>gY", function() require("gitlinker").get_repo_url() end, desc = "Copy link to repo", mode = "n" },
    },
    opts = {
      mappings = "<leader>gy",
    },
  },

  -- better diffing
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    keys = { { "<leader>gd", "<Cmd>DiffviewOpen<CR>", desc = "Diffview" } },
    config = true,
  },

  -- fugitive
  {
    "tpope/vim-fugitive",
    dependencies = { "tpope/vim-rhubarb" },
    cmd = {
      "G",
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

  -- GitHub interface
  {
    "pwntester/octo.nvim",
    cmd = "Octo",
    config = true,
  },
}
