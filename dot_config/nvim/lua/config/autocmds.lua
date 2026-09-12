local Utils = require("utils")

vim.api.nvim_create_autocmd({ "VimLeave" }, {
  callback = function()
    vim.fn.jobstart("", { detach = true })
  end,
})

-- close only the top-level folds (functions, classes, etc.) when a file is
-- opened; anything nested inside (if-statements, loops, ...) is left open so
-- it's fully expanded as soon as its parent fold is opened.
--
-- Whatever populates folds (treesitter, LSP foldingRange, indent, ...) is
-- left untouched -- this just closes depth-1 folds after the fact. A single
-- pass on BufReadPost isn't enough: e.g. LazyVim switches a buffer's
-- 'foldexpr' to the LSP one as soon as a server *advertises* foldingRange
-- support, but the actual ranges only show up later once the async
-- textDocument/foldingRange request completes, with no event fired for
-- that. So this retries with backoff until it actually finds fold
-- structure to close, rather than assuming one attempt was enough.
---@param buf integer
---@param attempt? integer
local function close_top_level_folds(buf, attempt)
  attempt = attempt or 1
  if not vim.api.nvim_buf_is_valid(buf) or vim.bo[buf].buftype ~= "" then
    return
  end
  local win = vim.fn.bufwinid(buf)
  if win == -1 then
    return
  end
  local found_folds = false
  local closed_count = 0
  vim.api.nvim_win_call(win, function()
    if vim.wo.foldmethod == "manual" then
      return
    end
    local lnum, last = 1, vim.api.nvim_buf_line_count(buf)
    while lnum <= last do
      if vim.fn.foldlevel(lnum) >= 1 then
        found_folds = true
        if vim.fn.foldlevel(lnum) == 1 and vim.fn.foldclosed(lnum) == -1 then
          vim.cmd(lnum .. "foldclose")
          closed_count = closed_count + 1
        end
      end
      local fend = vim.fn.foldclosedend(lnum)
      lnum = (fend ~= -1 and fend or lnum) + 1
    end
  end)
  _G.__fold_dbg = _G.__fold_dbg or {}
  table.insert(_G.__fold_dbg, {
    t = vim.uv.hrtime() / 1e6,
    attempt = attempt,
    found_folds = found_folds,
    closed_count = closed_count,
    foldmethod = vim.wo[win].foldmethod,
    foldexpr = vim.wo[win].foldexpr,
  })
  if not found_folds and attempt < 8 then
    vim.defer_fn(function()
      close_top_level_folds(buf, attempt + 1)
    end, attempt * 250)
  end
end

vim.api.nvim_create_autocmd({ "BufReadPost", "LspAttach" }, {
  group = Utils.augroup("top_level_folds"),
  callback = function(event)
    vim.schedule(function()
      close_top_level_folds(event.buf)
    end)
  end,
})

vim.api.nvim_create_autocmd("OptionSet", {
  group = Utils.augroup("top_level_folds"),
  pattern = { "foldexpr", "foldmethod" },
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    vim.schedule(function()
      close_top_level_folds(buf)
    end)
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

-- clear lazyvim autocmds
vim.api.nvim_clear_autocmds({ group = "lazyvim_json_conceal" })
