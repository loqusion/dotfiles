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
    keys = {
      { "<Plug>(Tabout)", tabout, mode = "i" },
      { "<Plug>(TaboutMulti)", taboutMulti, mode = "i" },
      { "<Plug>(TaboutBack)", taboutBack, mode = "i" },
      { "<Plug>(TaboutBackMulti)", taboutBackMulti, mode = "i" },
    },
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
    "L3MON4D3/LuaSnip",
    optional = true,
    -- stylua: ignore
    keys = {
      {
        "<tab>",
        function()
          if require("luasnip").expand_or_jumpable(1) then
            return "<Plug>luasnip-expand-or-jump"
          else
            return "<Plug>(Tabout)"
          end
        end,
        expr = true, silent = true, mode = "i",
      },
    },
  },
}
