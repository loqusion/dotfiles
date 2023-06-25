local function load_launchjs()
  require("dap.ext.vscode").load_launchjs(nil, { rt_lldb = { "rust" } })
end

return {
  {
    "mfussenegger/nvim-dap",
    -- HACK: using `opts` for side effects without overriding `config`
    opts = function()
      load_launchjs()
      vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = "launch.json",
        callback = load_launchjs,
      })
    end,
  },
}
