local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "gV", "v`[o`]", { desc = "Switch to VISUAL using last insertion/yank" })

map({ "n", "i", "c", "v", "o", "t", "l" }, "<MiddleMouse>", "<Nop>", { desc = "which_key_ignore" })
