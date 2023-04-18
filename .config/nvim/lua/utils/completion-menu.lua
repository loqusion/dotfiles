---@param vim_item vim.CompletedItem
---@param entry cmp.Entry
local function get_abbr(vim_item, entry)
  local types = require("cmp.types")
  local str = require("cmp.utils.str")

  if entry.source.name == "nvim_lsp_document_symbol" then
    return vim_item.abbr
  end
  local word = entry:get_insert_text()
  if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet then
    word = vim.lsp.util.parse_snippet(word)
  end
  word = str.oneline(word)

  -- concatenates the string
  local max = 50
  if string.len(word) >= max then
    local before = string.sub(word, 1, math.floor((max - 3) / 2))
    word = before .. "..."
  end

  if
    entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet
    and string.sub(vim_item.abbr, -1, -1) == "~"
  then
    word = word .. "~"
  end
  return word
end

return {
  window = {
    completion = {
      col_offset = -3,
      side_padding = 0,
    },
    documentation = {
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
    },
  },
  formatting = {
    ---@type cmp.ItemField[]
    fields = { "kind", "abbr", "menu" },
    ---@param entry cmp.Entry
    ---@param vim_item vim.CompletedItem
    format = function(entry, vim_item)
      vim_item.abbr = get_abbr(vim_item, entry)
      vim_item.dup = ({
        buffer = 1,
        path = 1,
        nvim_lsp = 1,
      })[entry.source.name] or 0

      ---@type vim.CompletedItem
      local format =
        require("lspkind").cmp_format({ mode = "symbol_text", with_text = false, maxwidth = 50 })(entry, vim_item)

      local strings = vim.split(format.kind, "%s", { trimempty = true })

      format.kind = (" %s "):format(strings[1])

      return format
    end,
  },
}
