---@module 'lazy'

---@type LazySpec[]
return {
  {
    "lervag/vimtex",
    init = function()
      vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
      vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
      vim.g.vimtex_view_method = "skim"
      -- Don't add a shiftwidth of indent to the body of every \begin{...}/\end{...}
      -- environment (vimtex's indent script only skips "document" by default).
      vim.g.vimtex_indent_ignored_envs = { ".*" }
    end,
  },
}
