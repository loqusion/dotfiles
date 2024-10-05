local Utils = require("utils")

return {
  -- run tests
  {
    "nvim-neotest/neotest",
    dependencies = {
      {
        "antoinemadec/FixCursorHold.nvim", -- https://github.com/antoinemadec/FixCursorHold.nvim/issues/13
        init = function()
          vim.g.cursorhold_updatetime = 50
        end,
      },
      { "nvim-neotest/neotest-vim-test", dependencies = "vim-test/vim-test" },
    },
    -- stylua: ignore
    keys = {
      { "<leader>tA", function() require("neotest").run.run({ suite = true }) end, desc = "Run Suite" },
      { "<leader>tl", function() require("neotest").run.run_last() end, desc = "Run last test" },
      { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true, short = true }) end, desc = "Show Output" }, ---@diagnostic disable-line: missing-fields
      -- { "<leader>tD", function() require("neotest").run.run_last({ strategy = "dap" }) end, desc = "Debug last test" },
      -- { "<leader>ta", function() require("neotest").run.attach() end, desc = "Attach to running test" },
      -- { "<leader>tm", function() require("neotest").summary.run_marked() end, desc = "Summary for marked tests" },
      { "[T", function() require("neotest").jump.prev({ status = "failed" }) end, desc = "Previous failed test" },
      { "]T", function() require("neotest").jump.next({ status = "failed" }) end, desc = "Next failed test" },
    },
    opts = {
      adapters = {
        ["neotest-vim-test"] = {
          ignore_filetypes = {
            "javascript",
            "python",
            "typescript",
            "typescriptreact",
          },
        },
      },
      quickfix = { open = false },
    },
  },

  -- task runner and job management
  {
    "stevearc/overseer.nvim",
    cmd = {
      "OverseerOpen",
      "OverseerClose",
      "OverseerToggle",
      "OverseerSaveBundle",
      "OverseerLoadBundle",
      "OverseerDeleteBundle",
      "OverseerRunCmd",
      "OverseerRun",
      "OverseerInfo",
      "OverseerBuild",
      "OverseerQuickAction",
      "OverseerTaskAction",
      "OverseerClearCache",
    },
    keys = {
      { "<leader>ru", "<cmd>OverseerToggle<cr>", desc = "Task list" },
      { "<leader>rr", "<cmd>OverseerRun<cr>", desc = "Run task" },
      { "<leader>rb", "<cmd>OverseerBuild<cr>", desc = "Run task (build)" },
      { "<leader>rc", "<cmd>OverseerRunCmd<cr>", desc = "Run task (command)" },
      { "<leader>ra", "<cmd>OverseerQuickAction<cr>", desc = "Action (recent task)" },
      { "<leader>rA", "<cmd>OverseerTaskAction<cr>", desc = "Action" },
      { "<leader>ri", "<cmd>OverseerInfo<cr>", desc = "Overseer info" },
      { "<leader>rl", "<cmd>OverseerLoadBundle<cr>", desc = "Load Bundle" },
      { "<leader>rs", "<cmd>OverseerSaveBundle<cr>", desc = "Save Bundle" },
    },
    opts = {
      templates = { "builtin", "loqusion" },
      strategy = {
        "toggleterm",
      },
      task_list = {
        bindings = {
          ["<C-j>"] = false,
          ["<C-k>"] = false,
          ["<C-l>"] = false,
          ["<C-h>"] = false,
          ["["] = false,
          ["]"] = false,
          L = "IncreaseDetail",
          H = "DecreaseDetail",
          ["<C-[>"] = "DecreaseWidth",
          ["<C-]>"] = "IncreaseWidth",
        },
      },
      form = {
        win_opts = {
          winblend = 0,
        },
      },
      confirm = {
        win_opts = {
          winblend = 0,
        },
      },
      task_win = {
        win_opts = {
          winblend = 0,
        },
      },
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = { "stevearc/overseer.nvim" },
    opts = function(_, opts)
      vim.tbl_deep_extend("force", opts, {
        consumers = { overseer = require("neotest.consumers.overseer") },
      })
    end,
  },

  -- rest client
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    config = function(_, opts)
      require("rest-nvim").setup(opts)
      vim.api.nvim_create_autocmd("FileType", {
        group = Utils.augroup("http"),
        pattern = "http",
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          vim.keymap.set("n", "<CR>", "<Plug>RestNvim", { desc = "Rest", buffer = buffer })
        end,
      })
    end,
  },
}
