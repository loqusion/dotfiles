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

local function l()
  vim.cmd([[exe 'normal! ' .. (foldclosed(line('.')) != -1 ? (mode() == 'n' ? 'zo0' : 'zogv0') : 'l')]])
end

map("n", "gV", "v`[o`]", { desc = "Switch to VISUAL using last insertion/yank" })

map("n", "<leader>w=", "<C-w>=", { desc = "Equalize windows" })
map("n", "<leader>wT", "<C-w>T", { desc = "Break out into a new tab" })
map("n", "<leader>wx", "<C-w>x", { desc = "Swap current with next" })
map("n", "<leader>wo", "<C-w>o", { desc = "Close other windows" })

map({ "n", "x" }, "x", '"_x', { desc = "Delete char" })
map({ "n", "x" }, "X", '"_X', { desc = "Delete prev char" })

map("n", "l", l, { desc = "which_key_ignore" })

-- map("n", "ZZ", "<Nop>", { desc = "which_key_ignore" })
map({ "n", "i", "c", "v", "o", "t", "l" }, "<MiddleMouse>", "<Nop>", { desc = "which_key_ignore" })
