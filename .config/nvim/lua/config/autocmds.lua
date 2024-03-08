local Utils = require("utils")

vim.api.nvim_create_autocmd({ "VimLeave" }, {
  callback = function()
    vim.fn.jobstart("", { detach = true })
  end,
})

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

-- auto reload configs --

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
    vim.fn.system(("nohup hyprpaper --config %s >/dev/null 2>&1 & disown"):format(event.file))
  end,
})

-- hyprshade
vim.api.nvim_create_autocmd("BufWritePost", {
  group = Utils.augroup("config_reload"),
  pattern = { "hyprshade.toml", "hyprshade/config.toml" },
  callback = function()
    vim.notify("Regenerating hyprshade")
    vim.fn.system("hyprshade install")
    vim.fn.system("systemctl --user daemon-reload")
  end,
})

----

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
    require("dap.ext.vscode").load_launchjs()
  end

  load_launchjs()

  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "launch.json",
    callback = function()
      vim.notify("Reloading launch.json", vim.log.levels.INFO)
      load_launchjs()
    end,
  })
end)

-- custom filetype detection --

-- json
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = Utils.augroup("custom_filetypes"),
  pattern = { "flake.lock" },
  callback = function(event)
    vim.bo[event.buf].filetype = "json"
  end,
})

-- hyprlang
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = Utils.augroup("custom_filetypes"),
  pattern = "*/hypr/*.conf",
  callback = function(event)
    vim.bo[event.buf].filetype = "hyprlang"
  end,
})

----

-- clear lazyvim autocmds
vim.api.nvim_clear_autocmds({ group = "lazyvim_json_conceal" })
