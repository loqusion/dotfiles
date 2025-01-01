---@type LazySpec[]
return {
  {
    "mfussenegger/nvim-dap",

    dependencies = {
      {
        "mxsdev/nvim-dap-vscode-js",
        event = "VeryLazy",
        opts = function(_, opts)
          opts.adapters = opts.adapters or {}
          vim.list_extend(opts.adapters, {
            "pwa-node",
            "node-terminal",
          })
        end,
        config = function(_, opts)
          local dap = require("dap")
          local dap_js = require("dap-vscode-js")

          local function get_js_debug_path()
            local mason_registry = require("mason-registry")

            if not mason_registry.is_installed("js-debug-adapter") then
              return
            end

            local js_debug_pkg = mason_registry.get_package("js-debug-adapter")
            return js_debug_pkg:get_install_path()
          end

          opts.debugger_path = opts.debugger_path or get_js_debug_path()
          dap_js.setup(opts)

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
