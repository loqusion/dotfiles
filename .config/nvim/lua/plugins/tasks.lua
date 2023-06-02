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
      "haydenmeade/neotest-jest",
      "nvim-neotest/neotest-python",
      { "nvim-neotest/neotest-vim-test", dependencies = "vim-test/vim-test" },
    },
    -- stylua: ignore
    keys = {
      { "<leader>tA", function() require("neotest").run.run({ suite = true }) end, desc = "Run Suite" },
      { "<leader>tl", function() require("neotest").run.run_last() end, desc = "Run last test" },
      { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true, short = true }) end, desc = "Show Output" },
      -- { "<leader>tD", function() require("neotest").run.run_last({ strategy = "dap" }) end, desc = "Debug last test" },
      -- { "<leader>ta", function() require("neotest").run.attach() end, desc = "Attach to running test" },
      -- { "<leader>tm", function() require("neotest").summary.run_marked() end, desc = "Summary for marked tests" },
      { "[T", function() require("neotest").jump.prev({ status = "failed" }) end, desc = "Previous failed test" },
      { "]T", function() require("neotest").jump.next({ status = "failed" }) end, desc = "Next failed test" },
    },
    opts = {
      adapters = {
        -- ["neotest-jest"] = {},
        ["neotest-python"] = {},
        ["neotest-vim-test"] = {
          ignore_filetypes = {
            "python",
          },
        },
      },
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
      templates = { "builtin", "user.run_script" },
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

  -- conjure
  {
    "Olical/conjure",
    event = "VeryLazy",
    init = function()
      if Utils.has("which-key.nvim") then
        require("which-key").register({
          mode = { "n" },
          ["<localleader>e"] = { name = "+evaluate" },
          ["<localleader>ec"] = { name = "+comment" },
          ["<localleader>l"] = { name = "+log" },
          -- ["<localleader>c"] = { name = "+repl" },
          -- ["<localleader>r"] = { name = "+reset" },
        })
      end
      vim.g["conjure#mapping#prefix"] = "<localleader>"
      vim.g["conjure#mapping#doc_word"] = false
      vim.g["conjure#mapping#def_word"] = false

      -- TODO: add virtualenv support
      vim.g["conjure#client#python#stdio#command"] = "python3 -iq"
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "PaterJason/cmp-conjure",
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "conjure" } }))
    end,
  },

  -- rest client
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    config = function(_, opts)
      require("rest-nvim").setup(opts)
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("loqusion_http", {}),
        pattern = "http",
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          vim.keymap.set("n", "<CR>", "<Plug>RestNvim", { desc = "Rest", buffer = buffer })
        end,
      })
    end,
  },
}
