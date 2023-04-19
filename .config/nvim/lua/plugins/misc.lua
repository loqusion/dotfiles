local Utils = require("utils")

return {
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
}
