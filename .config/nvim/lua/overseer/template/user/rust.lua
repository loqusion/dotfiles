return {
  name = "cargo watch -x run",
  builder = function(params)
    return {
      cmd = { "cargo", "watch", "-x", "run" },
    }
  end,
  priority = 50,
  condition = {
    filetype = { "rust" },
  },
}
