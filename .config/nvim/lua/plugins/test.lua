return {
  -- run tests
  {
    "nvim-neotest/neotest",
    dependencies = {
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest",
      "nvim-neotest/neotest-python",
      "akinsho/neotest-go",
      "nvim-neotest/neotest-vim-test",
      "vim-test/vim-test",
    },
    keys = function()
      require("which-key").register({
        ["<leader>t"] = { name = "+test" },
      })
      -- stylua: ignore
      return {
        { "<leader>tr", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run all in buffer" },
        { "<leader>ts", function() require("neotest").run.run({ suite = true }) end, desc = "Run test suite" },
        { "<leader>tn", function() require("neotest").run.run() end, desc = "Run nearest test" },
        { "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end, desc = "Debug nearest test" },
        { "<leader>tl", function() require("neotest").run.run_last() end, desc = "Run last test" },
        { "<leader>tD", function() require("neotest").run.run_last({ strateg = "dap" }) end, desc = "Debug last test" },
        { "<leader>ta", function() require("neotest").run.attach() end, desc = "Attach to running test" },
        { "<leader>to", function() require("neotest").output.open({ enter = true }) end, desc = "Open test output" },
        { "<leader>tO", function() require("neotest").output.open({ enter = true, short = true }) end, desc = "Open short test output", },
        { "<leader>tp", function() require("neotest").summary.toggle() end, desc = "Toggle summary" },
        { "<leader>tm", function() require("neotest").summary.run_marked() end, desc = "Summary for marked tests" },
        { "[T", function() require("neotest").jump.prev({ status = "failed" }) end, desc = "Previous failed test" },
        { "]T", function() require("neotest").jump.next({ status = "failed" }) end, desc = "Next failed test" },
      }
    end,
    opts = {
      icons = {
        running = "↻",
      },
      adapters = {
        -- require("neotest-jest")({
        --   jestCommand = "pnpm test --",
        -- }),
        -- require("neotest-python")({}),
        -- require("neotest-vim-test")({
        --   ignore_filetypes = {
        --     -- 'javascript',
        --     -- 'typescript',
        --     -- 'javascriptreact',
        --     -- 'typescriptreact',
        --     "python",
        --   },
        -- }),
      },
    },
  },
}
