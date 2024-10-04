local function tabout()
  require("tabout.tab").tabout("forward", true, false)
end

local function taboutMulti()
  require("tabout.tab").tabout("forward", true, true)
end

local function taboutBack()
  require("tabout.tab").tabout("backward", true, false)
end

local function taboutBackMulti()
  require("tabout.tab").tabout("backward", true, true)
end

return {
  {
    "abecodes/tabout.nvim",
    keys = function()
      local tab_fn
      local tab_s_fn
      local stab_fn
      if LazyVim.has("LuaSnip") then
        tab_fn = function()
          if require("luasnip").expand_or_jumpable(1) then
            return "<Plug>luasnip-expand-or-jump"
          else
            return "<Plug>(Tabout)"
          end
        end
        tab_s_fn = function()
          return "<Plug>luasnip-jump-next"
        end
        stab_fn = function()
          if require("luasnip").jumpable(-1) then
            return "<Plug>luasnip-jump-prev"
          else
            return "<Plug>(TaboutBack)"
          end
        end
      else
        tab_fn = function()
          if vim.snippet.active({ direction = 1 }) then
            return "<Cmd>lua vim.snippet.jump(1)<CR>"
          else
            return "<Plug>(Tabout)"
          end
        end
        tab_s_fn = tab_fn
        stab_fn = function()
          if vim.snippet.active({ direction = -1 }) then
            return "<Cmd>lua vim.snippet.jump(-1)<CR>"
          else
            return "<Plug>(TaboutBack)"
          end
        end
      end

      return {
        { "<Plug>(Tabout)", tabout, mode = "i" },
        { "<Plug>(TaboutMulti)", taboutMulti, mode = "i" },
        { "<Plug>(TaboutBack)", taboutBack, mode = "i" },
        { "<Plug>(TaboutBackMulti)", taboutBackMulti, mode = "i" },
        { "<Tab>", tab_fn, expr = true, silent = true, mode = "i" },
        { "<Tab>", tab_s_fn, expr = true, silent = true, mode = "s" },
        { "<S-Tab>", stab_fn, expr = true, silent = true, mode = { "i", "s" } },
      }
    end,
    opts = {
      -- Disable default keybinds to avoid conflicts
      tabkey = "",
      backwards_tabkey = "",
    },
    config = function(_, opts)
      -- WARN: Using internal api which may change in the future
      require("tabout.config").setup(opts)
    end,
  },

  {
    "nvim-cmp",
    optional = true,
    keys = {
      { "<Tab>", mode = "i", false },
      { "<Tab>", mode = "s", false },
      { "<S-Tab>", mode = { "i", "s" }, false },
    },
  },
}
