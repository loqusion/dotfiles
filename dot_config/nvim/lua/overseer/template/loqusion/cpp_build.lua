return {
  name = "g++ build",
  builder = function()
    local file = vim.fn.expand("%:p")
    return {
      cmd = { "g++" },
      args = { file },
      components = { { "on_output_quickfix", open = true }, "default" },
    }
  end,
  condition = {
    filetype = { "cpp" },
  },
}
