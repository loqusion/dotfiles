return {
  {
    "mfussenegger/nvim-dap",

    dependencies = {
      {
        "mxsdev/nvim-dap-vscode-js",
        event = "VeryLazy",
        config = function()
          local dap = require("dap")
          local dap_js = require("dap-vscode-js")
          local mason_registry = require("mason-registry")

          if not mason_registry.is_installed("js-debug-adapter") then
            return
          end

          local js_debug_pkg = mason_registry.get_package("js-debug-adapter")
          local js_debug_path = js_debug_pkg:get_install_path()

          dap_js.setup({
            debugger_path = js_debug_path,
            adapters = { "pwa-node", "node-terminal" },
          })
          for _, language in ipairs({ "typescript", "typescriptreact", "javascript" }) do
            dap.configurations[language] = {
              {
                type = "pwa-node",
                request = "launch",
                name = "Launch file (" .. language .. ")",
                program = "${file}",
                cwd = "${workspaceFolder}",
              },
              {
                type = "pwa-node",
                request = "attach",
                name = "Attach (" .. language .. ")",
                processId = require("dap.utils").pick_process,
                cwd = "${workspaceFolder}",
              },
            }
          end
        end,
      },
    },
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "js" })
    end,
  },
}
