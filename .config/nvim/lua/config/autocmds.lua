local Utils = require("utils")

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = Utils.augroup("close_with_q", "lazyvim"),
  pattern = {
    "OverseerList",
    "dap-float",
    "fugitive",
    "fugitiveblame",
    "neotest-*",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
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

-- quickfix options
vim.api.nvim_create_autocmd("FileType", {
  group = Utils.augroup("quickfix"),
  pattern = "qf",
  callback = function()
    vim.wo.number = true
    vim.wo.relativenumber = false
    vim.wo.signcolumn = "no"
    vim.wo.foldcolumn = 0
  end,
})

-- yaml options
vim.api.nvim_create_autocmd("FileType", {
  group = Utils.augroup("ft_yaml"),
  pattern = "yaml",
  callback = function()
    vim.opt_local.iskeyword:append("-")
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

-- disable autoformat for PKGBUILD
vim.api.nvim_create_autocmd("BufRead", {
  group = Utils.augroup("pkgbuild"),
  pattern = "PKGBUILD",
  callback = function(event)
    vim.b[event.buf].autoformat = false
  end,
})

-- launch.json auto load
require("lazyvim.util").on_load("nvim-dap", function()
  local function load_launchjs()
    require("dap.ext.vscode").load_launchjs(nil, { rt_lldb = { "rust" } })
  end

  load_launchjs()
  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "launch.json",
    callback = load_launchjs,
  })
end)
