local Utils = require("utils")

---@return LazyKeysHandler
local function get_keys_handler()
  local keys_handler = require("lazy.core.handler").handlers.keys
  ---@cast keys_handler LazyKeysHandler
  return keys_handler
end

local function map(mode, lhs, rhs, opts)
  local keys = get_keys_handler()
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

local function unmap(modes, lhs, opts)
  vim.keymap.del(modes, lhs, opts)
end

unmap("n", "<C-Up>")
unmap("n", "<C-Down>")
unmap("n", "<C-Left>")
unmap("n", "<C-Right>")
unmap("n", "<leader>ft")
unmap("n", "<leader>fT")
unmap({ "n", "t" }, "<C-/>")
unmap({ "n", "t" }, "<C-_>")
unmap("t", "<C-h>")
unmap("t", "<C-j>")
unmap("t", "<C-k>")
unmap("t", "<C-l>")

map({ "n", "i", "c", "v", "o", "t", "l" }, "<MiddleMouse>", "<Nop>", { desc = "which_key_ignore" })

map({ "n", "x" }, "x", '"_x', { desc = "Delete char" })
map({ "n", "x" }, "X", '"_X', { desc = "Delete prev char" })

local function l()
  vim.cmd([[exe 'normal! ' .. (foldclosed(line('.')) != -1 ? (mode() == 'n' ? 'zo0' : 'zogv0') : v:count1 .. 'l')]])
end
map("n", "l", l, { desc = "which_key_ignore" })

map("n", "gV", "v`[o`]", { desc = "Switch to VISUAL using last insertion/yank" })

map("n", "<leader>w=", "<C-w>=", { desc = "Equalize windows" })
map("n", "<leader>wT", "<C-w>T", { desc = "Break out into a new tab" })
map("n", "<leader>wx", "<C-w>x", { desc = "Swap current with next" })
map("n", "<leader>wo", "<C-w>o", { desc = "Close other windows" })

map("n", "<leader>fe", "<cmd>edit<cr>", { desc = "Re-edit file" })

map("n", "<leader>uf", function()
  local lazyvim_format = require("lazyvim.plugins.lsp.format")
  lazyvim_format.toggle()
  if Utils.has("tidy.nvim") then
    require("tidy").enabled = lazyvim_format.autoformat == true
  end
end, { desc = "Toggle format on Save" })

map("n", "<leader>cR", Utils.runlua, { desc = "Run Lua" })

if Utils.has("smart-splits.nvim") then
  -- manually map to override LazyVim mappings
  local smart_splits = require("lazy.core.config").spec.plugins["smart-splits.nvim"]
  local smart_splits_keys = require("lazy.core.plugin").values(smart_splits, "keys", true)
  local get_opts = get_keys_handler().opts
  for _, keys in ipairs(smart_splits_keys) do
    map(keys.mode or "n", keys[1], keys[2], get_opts(keys))
  end
end
