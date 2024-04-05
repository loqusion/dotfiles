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
    },
    keys = {
      { "<leader>rr", "<cmd>OverseerRun<cr>", desc = "Task" },
      { "<leader>rc", "<cmd>OverseerRunCmd<cr>", desc = "Cmd" },
      { "<leader>rb", "<cmd>OverseerLoadBundle<cr>", desc = "Load Bundle" },
      { "<leader>rB", "<cmd>OverseerSaveBundle<cr>", desc = "Save Bundle" },
      { "<leader>ru", "<cmd>OverseerToggle<cr>", desc = "Overseer UI" },
      { "<leader>ra", "<cmd>OverseerQuickAction<cr>", desc = "Quick Action" },
      { "<leader>rA", "<cmd>OverseerTaskAction<cr>", desc = "Action" },
    },
    opts = {
      strategy = {
        "toggleterm",
      },
      templates = { "builtin", "user.run_script", "user.rust" },
      task_list = {
        bindings = {
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
