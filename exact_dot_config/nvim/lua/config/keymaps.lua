local Utils = require("utils")

---@return LazyKeysHandler
local function get_keys_handler()
  local keys_handler = require("lazy.core.handler").handlers.keys
  ---@cast keys_handler LazyKeysHandler
  return keys_handler
end

local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  vim.keymap.set(mode, lhs, rhs, opts)
end

local function unmap(modes, lhs, opts)
  vim.keymap.del(modes, lhs, opts)
end

map({ "n", "x" }, "<Space>", "<Nop>")

unmap("n", "<C-Up>")
unmap("n", "<C-Down>")
unmap("n", "<C-Left>")
unmap("n", "<C-Right>")
unmap("n", "<leader>ft")
unmap("n", "<leader>fT")
unmap({ "n", "t" }, "<C-/>")
unmap({ "n", "t" }, "<C-_>")

for _, x in ipairs({ false, "2", "3", "4" }) do
  local lhs = (x == false and "<MiddleMouse>" or ("<%s-MiddleMouse>"):format(x))
  map({ "n", "i", "c", "v", "o", "t", "l" }, lhs, "<Nop>", { desc = "which_key_ignore" })
end
map({ "n", "x" }, "#", "<Nop>")
map({ "n", "x" }, "g#", "<Nop>")

map({ "n", "x" }, "x", '"_x', { desc = "Delete char" })
map({ "n", "x" }, "X", '"_X', { desc = "Delete prev char" })

local function l()
  vim.cmd([[exe 'normal! ' .. (foldclosed(line('.')) != -1 ? (mode() == 'n' ? 'zo0' : 'zogv0') : v:count1 .. 'l')]])
end
map("n", "l", l, { desc = "which_key_ignore" })

map("n", "gV", "v`[o`]", { desc = "Switch to VISUAL using last insertion/yank" })
-- map("x", "g=", [[<Esc><Cmd>s/\%V.*\%V./\=eval("TODO")<CR>]], { desc = "Evaluate expression" })

map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })

map("n", "<leader>w=", "<C-w>=", { desc = "Equalize windows" })
map("n", "<leader>wT", "<C-w>T", { desc = "Break out into a new tab" })
map("n", "<leader>wx", "<C-w>x", { desc = "Swap current with next" })
map("n", "<leader>wo", "<C-w>o", { desc = "Close other windows" })

map("n", "<leader>fe", "<cmd>edit<cr>", { desc = "Re-edit file" })

map("n", "<leader>cR", Utils.runlua, { desc = "Run Lua" })

map("n", "<leader>gC", function()
  Snacks.terminal({
    "lazygit",
    ("--git-dir=%s"):format(vim.env.DOTBARE_DIR),
    ("--work-tree=%s"):format(vim.env.DOTBARE_TREE),
  }, { cwd = vim.env.HOME, esc_esc = false, ctrl_hjkl = false })
end, { desc = "Lazygit (dotfiles)" })

map("n", "<leader>uI", function()
  vim.treesitter.inspect_tree()
end, { desc = "Inspect Tree" })

if LazyVim.has("smart-splits.nvim") then
  -- manually map to override LazyVim mappings
  local smart_splits = require("lazy.core.config").spec.plugins["smart-splits.nvim"]
  local smart_splits_keys = require("lazy.core.plugin").values(smart_splits, "keys", true)
  local get_opts = get_keys_handler().opts
  for _, keys in ipairs(smart_splits_keys) do
    map(keys.mode or "n", keys[1], keys[2], get_opts(keys))
  end
end

if LazyVim.has("LuaSnip") then
  map("i", "<Tab>", function()
    if require("luasnip").expand_or_jumpable(1) then
      return "<Plug>luasnip-expand-or-jump"
    else
      return "<Tab>"
    end
  end, { expr = true, desc = "Jump Next" })
  map("s", "<Tab>", function()
    return "<Plug>luasnip-jump-next"
  end, { expr = true, desc = "Jump Next" })
  map({ "i", "s" }, "<S-Tab>", function()
    if require("luasnip").jumpable(-1) then
      return "<Plug>luasnip-jump-prev"
    else
      return "<S-Tab>"
    end
  end, { expr = true, desc = "Jump Previous" })
else
  map("i", "<Tab>", function()
    if vim.snippet.active({ direction = 1 }) then
      return "<Cmd>lua vim.snippet.jump(1)<CR>"
    else
      return "<Tab>"
    end
  end, { expr = true, desc = "Jump Next" })
  map("s", "<Tab>", function()
    if vim.snippet.active({ direction = 1 }) then
      return "<Cmd>lua vim.snippet.jump(1)<CR>"
    else
      return "<Tab>"
    end
  end, { expr = true, desc = "Jump Next" })
  map({ "i", "s" }, "<S-Tab>", function()
    if vim.snippet.active({ direction = -1 }) then
      return "<Cmd>lua vim.snippet.jump(-1)<CR>"
    else
      return "<S-Tab>"
    end
  end, { expr = true, desc = "Jump Previous" })
end

if LazyVim.has("nvim-spider") then
  require("snacks")
    .toggle({
      name = "spider.nvim",
      get = function()
        return require("spider.config").globalOpts.skipInsignificantPunctuation
      end,
      set = function(state)
        require("spider.config").globalOpts.skipInsignificantPunctuation = state
      end,
    })
    :map("<leader>uS")
end

-- stylua: ignore
if vim.fn.executable("lazygit") == 1 then
  -- I hate change :)
  map("n", "<leader>gf", function() Snacks.lazygit.log_file() end, { desc = "Lazygit Current File History" })
  ---@diagnostic disable-next-line: missing-fields
  map("n", "<leader>gl", function() Snacks.lazygit.log({ cwd = LazyVim.root.git() }) end, { desc = "Lazygit Log" })
  map("n", "<leader>gL", function() Snacks.lazygit.log() end, { desc = "Lazygit Log (cwd)" })
end
