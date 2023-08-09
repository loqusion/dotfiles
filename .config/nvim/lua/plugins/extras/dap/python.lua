local python = require("utils.python")

return {
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      {
        "mfussenegger/nvim-dap-python",
        event = "VeryLazy",
        config = function()
          local dap_python = require("dap-python")
          local mason_registry = require("mason-registry")
          if not mason_registry.is_installed("debugpy") then
            return
          end

          local debugpy = mason_registry.get_package("debugpy")
          local debugpy_path = debugpy:get_install_path()

          dap_python.setup(("%s/venv/bin/python"):format(debugpy_path))
        end,
      },
    },
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "python" })
    end,
  },
}
