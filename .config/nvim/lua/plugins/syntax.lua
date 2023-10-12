return {
  {
    "MTDL9/vim-log-highlighting",
    event = "BufReadPre",
  },

  {
    "jxnblk/vim-mdx-js",
    event = "BufReadPre",
  },

  {
    "NoahTheDuke/vim-just",
    enabled = function()
      return not require("utils").has("tree-sitter-just")
    end,
    event = "BufReadPre",
  },

  {
    "fladson/vim-kitty",
    event = "BufReadPre",
  },

  {
    "baskerville/vim-sxhkdrc",
    event = "BufReadPre",
  },

  {
    "wgwoods/vim-systemd-syntax",
    pin = true,
    event = "BufReadPre",
    commit = "2f788c627efa7a50baa5766cfacf1852528eca28",
  },
}
