local Utils = require("utils")

return {
  -- yaml schemas
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "someone-stole-my-name/yaml-companion.nvim",
      config = function()
        require("telescope").load_extension("yaml_schema")
      end,
    },
    opts = function(_, opts)
      if Utils.has("yaml-companion.nvim") then
        local yaml_companion = require("yaml-companion")
        opts.servers.yamlls = yaml_companion.setup(opts.servers.yamlls)
      end
    end,
  },
}
