local style = require("config.style")

return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
      "onsails/lspkind.nvim",
      "lukas-reineke/cmp-under-comparator",
      {
        "David-Kunz/cmp-npm",
        enabled = false,
        event = { "BufRead package.json" },
        config = true,
      },
    },
    ---@param opts cmp.ConfigSchema | {auto_brackets?: string[]}
    opts = function(_, opts)
      local cmp = require("cmp")
      local compare = cmp.config.compare

      opts = vim.tbl_deep_extend("force", opts, {
        auto_brackets = {},
        completion = {
          completeopt = "menu,menuone,noselect",
        },
        mapping = {
          ["<CR>"] = LazyVim.cmp.confirm({ select = false }),
        },
        sources = cmp.config.sources(vim.list_extend(opts.sources, {
          { name = "emoji" },
          { name = "neorg" },
          -- { name = "npm", keyword_length = 3 },
        })),
        sorting = {
          comparators = {
            compare.offset,
            compare.exact,
            -- compare.scopes,
            compare.score,
            require("cmp-under-comparator").under,
            compare.recently_used,
            compare.locality,
            compare.kind,
            -- compare.sort_text,
            compare.length,
            compare.order,
          },
        },
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

      return opts
    end,
  },
}
