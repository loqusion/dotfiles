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

-- kdl options
vim.api.nvim_create_autocmd("FileType", {
  group = Utils.augroup("ft_kdl"),
  pattern = "kdl",
  callback = function()
    vim.opt_local.commentstring = "// %s"
  end,
})

-- auto reload configs

-- yabai
vim.api.nvim_create_autocmd("BufWritePost", {
  group = Utils.augroup("config_reload"),
  pattern = { "yabairc", "skhdrc", ".yabairc", ".skhdrc" },
  callback = function()
    vim.notify("Reloading yabai+skhd")
    vim.fn.system('launchctl kickstart -k "gui/${UID}/homebrew.mxcl.yabai"')
    vim.fn.system('launchctl kickstart -k "gui/${UID}/homebrew.mxcl.skhd"')
  end,
})

-- hyprpaper
vim.api.nvim_create_autocmd("BufWritePost", {
  group = Utils.augroup("config_reload"),
  pattern = "hyprpaper.conf",
  callback = function(event)
    vim.notify("Reloading hyprpaper")
    vim.fn.system("pkill hyprpaper")
    vim.fn.system(("nohup hyprpaper -c %s >/dev/null 2>&1 & disown"):format(event.file))
  end,
})

-- hyprshade
vim.api.nvim_create_autocmd("BufWritePost", {
  group = Utils.augroup("config_reload"),
  pattern = { "hyprshade.toml", "hyprshade/config.toml" },
  callback = function()
    vim.notify("Regenerating hyprshade")
    vim.fn.system("hyprshade install")
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
