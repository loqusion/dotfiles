return {
  {
    "mfussenegger/nvim-dap",
    -- HACK: using `opts` for side effects without overriding `config`
    opts = function()
      require("dap.ext.vscode").load_launchjs(nil, { rt_lldb = { "rust" } })
    end,
  },
}
