---@type LazySpec[]
return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    vim.list_extend(opts.ensure_installed, {
      "zls",
    })
  end,
}
