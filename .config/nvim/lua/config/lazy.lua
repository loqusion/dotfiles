local style = require("config.style")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
    },
    { import = "lazyvim.plugins.extras.coding.copilot", enabled = false },
    -- TODO: migrate to native snippets
    { import = "lazyvim.plugins.extras.coding.luasnip", enabled = true },
    { import = "lazyvim.plugins.extras.coding.neogen" },
    { import = "lazyvim.plugins.extras.coding.nvim-cmp" }, -- LEGACY
    -- FIXME: See https://github.com/gbprod/yanky.nvim/issues/123
    { import = "lazyvim.plugins.extras.coding.yanky", enabled = false },
    { import = "lazyvim.plugins.extras.dap.core" },
    { import = "lazyvim.plugins.extras.dap.nlua" },
    { import = "lazyvim.plugins.extras.editor.dial" },
    { import = "lazyvim.plugins.extras.editor.harpoon2" },
    -- BUG: Sometimes doesn't work for rust-analyzer
    { import = "lazyvim.plugins.extras.editor.inc-rename", enabled = false },
    { import = "lazyvim.plugins.extras.editor.navic" },
    { import = "lazyvim.plugins.extras.editor.neo-tree" },
    { import = "lazyvim.plugins.extras.editor.telescope" }, -- fzf.lua is default upstream
    { import = "lazyvim.plugins.extras.formatting.prettier" },
    { import = "lazyvim.plugins.extras.lang.ansible" },
    { import = "lazyvim.plugins.extras.lang.clangd" },
    { import = "lazyvim.plugins.extras.lang.cmake" },
    { import = "lazyvim.plugins.extras.lang.docker" },
    { import = "lazyvim.plugins.extras.lang.git" },
    { import = "lazyvim.plugins.extras.lang.haskell" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.markdown" },
    { import = "lazyvim.plugins.extras.lang.nix" },
    { import = "lazyvim.plugins.extras.lang.python" },
    { import = "lazyvim.plugins.extras.lang.rust" },
    { import = "lazyvim.plugins.extras.lang.sql" },
    { import = "lazyvim.plugins.extras.lang.tailwind" },
    { import = "lazyvim.plugins.extras.lang.terraform" },
    { import = "lazyvim.plugins.extras.lang.tex" },
    { import = "lazyvim.plugins.extras.lang.toml" },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.yaml" },
    { import = "lazyvim.plugins.extras.linting.eslint" },
    { import = "lazyvim.plugins.extras.test.core" },
    { import = "lazyvim.plugins.extras.ui.alpha" },
    { import = "lazyvim.plugins.extras.ui.mini-animate", enabled = style.animation },
    { import = "lazyvim.plugins.extras.ui.treesitter-context" },
    { import = "lazyvim.plugins.extras.util.dot" },
    { import = "lazyvim.plugins.extras.util.octo" },
    { import = "lazyvim.plugins.extras.util.project" },
    { import = "lazyvim.plugins.extras.util.rest" },
    --#region DEBUG
    -- { import = "plugins.coding" },
    -- { import = "plugins.colorscheme" },
    -- { import = "plugins.editor" },
    -- { import = "plugins.git" },
    -- { import = "plugins.integrations" },
    -- { import = "plugins.lsp" },
    -- { import = "plugins.syntax" },
    -- { import = "plugins.tab" },
    -- { import = "plugins.tasks" },
    -- { import = "plugins.telescope" },
    -- { import = "plugins.tools" },
    -- { import = "plugins.treesitter" },
    -- { import = "plugins.ui" },
    --#endregion
    { import = "plugins" },
    { import = "plugins.extras.coding.autopairs" },
    { import = "plugins.extras.coding.avante", enabled = false },
    { import = "plugins.extras.coding.backseat" },
    { import = "plugins.extras.coding.comment", enabled = false },
    { import = "plugins.extras.coding.surround", enabled = true },
    { import = "plugins.extras.dap" },
    { import = "plugins.extras.editor.neorg", enabled = false },
    { import = "plugins.extras.editor.telescope" },
    { import = "plugins.extras.formatting" },
    { import = "plugins.extras.lang" },
    { import = "plugins.extras.vscode" },
  },
  defaults = {
    lazy = true,
    version = false,
  },
  ---@diagnostic disable-next-line: assign-type-mismatch
  dev = {
    path = "~/repos",
    patterns = { "loqusion" },
    fallback = true,
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = true,
    concurrency = 5, -- avoid rate limits
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  ui = {
    custom_keys = {
      ["<localleader>d"] = function(plugin)
        d(plugin)
      end,
    },
  },
})
