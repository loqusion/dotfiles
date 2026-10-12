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

-- terraform
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = Utils.augroup("custom_filetypes"),
  pattern = "*.tf",
  callback = function(event)
    vim.bo[event.buf].filetype = "terraform"
  end,
})

----

-- HACK: keep which-key triggers ahead of newer buffer-local mappings.
-- Neovim checks buffer-local mappings newest-first. When a mapping like `gr`
-- (e.g. LSP keymaps, which Snacks sets after attach) is newer than which-key's
-- `nowait` `g` trigger, typing `g` waits for more keys, and then `gc` resolves
-- to the `gc` operator instead of `gcc`, so `gcc` does nothing. which-key
-- expects its triggers to be added after other mappings, so re-add them.
vim.api.nvim_create_autocmd("SafeState", {
  group = Utils.augroup("which_key_trigger_order"),
  callback = function()
    if not package.loaded["which-key"] or require("which-key.state").state then
      return
    end
    if vim.api.nvim_get_mode().mode ~= "n" then
      return
    end
    local buf = vim.api.nvim_get_current_buf()
    local newer = {} ---@type string[] lhs of non-trigger mappings newer than the current one
    for _, map in ipairs(vim.api.nvim_buf_get_keymap(buf, "n")) do
      if map.desc and map.desc:find("which-key-trigger", 1, true) then
        for _, lhs in ipairs(newer) do
          if vim.startswith(lhs, map.lhs) then
            local wk_buf = require("which-key.buf")
            wk_buf.clear({ buf = buf, mode = "n" })
            wk_buf.get({ buf = buf, mode = "n" })
            return
          end
        end
      else
        newer[#newer + 1] = map.lhs
      end
    end
  end,
})

-- clear lazyvim autocmds
vim.api.nvim_clear_autocmds({ group = "lazyvim_json_conceal" })
