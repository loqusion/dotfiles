local Utils = require("utils")

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = Utils.augroup("close_with_q", "lazyvim"),
  pattern = {
    "OverseerList",
    "fugitive",
    "fugitiveblame",
    "neotest-*",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- show cursor line only in active window
local excluded_filetypes = { ["neo-tree"] = true }
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  group = Utils.augroup("cursorline"),
  callback = function()
    local ok, cl = pcall(vim.api.nvim_win_get_var, 0, "auto-cursorline")
    if ok and cl then
      vim.wo.cursorline = true
      vim.api.nvim_win_del_var(0, "auto-cursorline")
    end
  end,
})
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
  group = Utils.augroup("cursorline"),
  callback = function()
    local cl = vim.wo.cursorline
    if cl and not excluded_filetypes[vim.bo.filetype] then
      vim.api.nvim_win_set_var(0, "auto-cursorline", cl)
      vim.wo.cursorline = false
    end
  end,
})

-- hide line numbers in spectre panel
vim.api.nvim_create_autocmd("FileType", {
  group = Utils.augroup("spectre"),
  pattern = "spectre_panel",
  callback = function()
    vim.wo.number = false
    vim.wo.relativenumber = false
    vim.wo.signcolumn = "no"
  end,
})

-- reload yabai+skhd on config change
vim.api.nvim_create_autocmd("BufWritePost", {
  group = Utils.augroup("yabai"),
  pattern = { "yabairc", "skhdrc", ".yabairc", ".skhdrc" },
  callback = function()
    vim.notify("Reloading yabai+skhd")
    vim.fn.system('launchctl kickstart -k "gui/${UID}/homebrew.mxcl.yabai"')
    vim.fn.system('launchctl kickstart -k "gui/${UID}/homebrew.mxcl.skhd"')
  end,
})
