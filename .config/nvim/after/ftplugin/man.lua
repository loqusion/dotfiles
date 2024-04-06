vim.keymap.set("n", "g/", [[/\V\C\^\s\*\zs]], {
  buffer = true,
  remap = true,
  silent = false,
  desc = "Search beginning of line (optional leading whitespace)",
})
