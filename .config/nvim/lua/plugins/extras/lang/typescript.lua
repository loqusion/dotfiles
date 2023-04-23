local Utils = require("utils")

return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local inlay_hints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      }
      local inlay_hints_opts = {
        settings = {
          typescript = { inlayHints = inlay_hints },
          javascript = { inlayHints = inlay_hints },
        },
      }

      opts.servers.tsserver = vim.tbl_deep_extend("force", opts.servers.tsserver, inlay_hints_opts)
      opts.servers.eslint = {}
    end,
  },
}
