---@module 'lazy'

---@type LazySpec[]
return {
  { "echasnovski/mini.pairs", enabled = false },
  {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    opts = {
      fast_wrap = {},
      enable_check_bracket_line = true,
      check_ts = true,
    },
    config = function(_, opts)
      local npairs = require("nvim-autopairs")
      npairs.setup(opts)

      -- rules

      local cond = require("nvim-autopairs.conds")

      -- don't expand single-quote in Rust
      ---@type table | nil
      local rust_single_quote_rules = vim
        .iter(npairs.get_rules("'"))
        :filter(function(rule)
          return #(rule.filetypes or {}) == 1 and rule.filetypes[1] == "rust"
        end)
        :fold({}, function(acc, v)
          if acc == nil or #acc > 0 then
            return nil
          else
            table.insert(acc, v)
            return acc
          end
        end)
      if rust_single_quote_rules == nil then
        vim.notify(
          "Multiple rules satisfied predicate that should have only matched one unique rule!",
          vim.log.levels.ERROR,
          { title = "nvim-autopairs (config)" }
        )
      elseif #rust_single_quote_rules == 0 then
        vim.notify("No rules satisfied predicate!", vim.log.levels.ERROR, { title = "nvim-autopairs (config)" })
      elseif #rust_single_quote_rules > 1 then
        vim.notify("This should be impossible!", vim.log.levels.ERROR, { title = "nvim-autopairs (config)" })
      else
        rust_single_quote_rules[1]:with_pair(cond.none(), 1)
      end

      -- cmp integration
      local cmp = require("cmp")
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
}
