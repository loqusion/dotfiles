local style = require("config.style")

return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
      "onsails/lspkind.nvim",
    },
    config = function(_, opts)
      local cmp = require("cmp")
      -- force overwrite copilot's mapping
      opts.mapping["<CR>"] = cmp.mapping.confirm({ select = false })
      cmp.setup(opts)
      vim.keymap.set({ "i", "s" }, "<C-e>", function()
        return require("luasnip").choice_active() and "<Plug>luasnip-next-choice" or "<C-e>"
      end, { expr = true, silent = true })
    end,
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      return vim.tbl_deep_extend("force", opts, {
        completion = {
          completeopt = "menu.menuone,noselect",
        },
        sources = cmp.config.sources(vim.list_extend(opts.sources, {
          { name = "emoji" },
          { name = "neorg" },
        })),
        window = {
          completion = {
            col_offset = -3,
            side_padding = 0,
          },
          documentation = {
            winhighlight = vim
              .iter({
                Normal = style.transparent and "Pmenu" or nil,
                FloatBorder = style.transparent and "Pmenu" or nil,
                Search = "NONE",
              })
              :fold("", function(acc, hl_from, hl_to)
                if hl_to == nil then
                  return acc
                end

                local hl_pair = ("%s:%s"):format(hl_from, hl_to)
                return acc == "" and hl_pair or hl_pair .. "," .. acc
              end),
          },
        },
        formatting = {
          ---@type cmp.ItemField[]
          fields = { "kind", "abbr", "menu" },
          ---@param item vim.CompletedItem
          format = function(_, item)
            local icons = require("lazyvim.config").icons.kinds
            if icons[item.kind] then
              item.kind = (" %s"):format(icons[item.kind])
            end
            return item
          end,
        },
      })
    end,
  },
}
