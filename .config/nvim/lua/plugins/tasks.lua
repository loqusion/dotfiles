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
      "akinsho/neotest-go",
      "nvim-neotest/neotest-vim-test",
      "vim-test/vim-test",
    },
    keys = function()
      -- stylua: ignore
      return {
        { "<leader>tr", function() require("neotest").run.run() end, desc = "Run Nearest" },
        { "<leader>tR", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File" },
        { "<leader>tA", function() require("neotest").run.run({ suite = true }) end, desc = "Run Suite" },
        { "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end, desc = "Debug Nearest" },
        { "<leader>tl", function() require("neotest").run.run_last() end, desc = "Run last test" },
        { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle summary" },
        { "<leader>tS", function() require("neotest").run.stop() end, desc = "Stop" },
        -- { "<leader>tD", function() require("neotest").run.run_last({ strategy = "dap" }) end, desc = "Debug last test" },
        -- { "<leader>ta", function() require("neotest").run.attach() end, desc = "Attach to running test" },
        -- { "<leader>tm", function() require("neotest").summary.run_marked() end, desc = "Summary for marked tests" },
        { "<leader>to", function() require("neotest").output.open({ enter = true, short = true }) end, desc = "Output (short)", },
        { "<leader>tO", function() require("neotest").output.open({ enter = true }) end, desc = "Output" },
        { "[T", function() require("neotest").jump.prev({ status = "failed" }) end, desc = "Previous failed test" },
        { "]T", function() require("neotest").jump.next({ status = "failed" }) end, desc = "Next failed test" },
      }
    end,
    opts = function()
      return {
        adapters = {
          -- require("neotest-jest")({
          --   jestCommand = "pnpm test --",
          -- }),
          require("neotest-python")({}),
          require("neotest-vim-test")({
            ignore_filetypes = {
              -- 'javascript',
              -- 'typescript',
              -- 'javascriptreact',
              -- 'typescriptreact',
              "python",
            },
          }),
        },
        icons = {
          expanded = "",
          child_prefix = "",
          child_indent = "",
          final_child_prefix = "",
          non_collapsible = "",
          collapsed = "",
          passed = "",
          running = "",
          failed = "",
          unknown = "",
          skipped = "",
        },
      }
    end,
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
