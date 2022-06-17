local path = require 'utils.api.path'

local options = {
  -- Auto save Buffer
  auto_save_buffer = true,
  -- Automatically switch input method
  auto_switch_input = true,
  --  Icon style to use
  -- • vscode (requires condicon.ttf installed)
  -- • kind (default)options.
  icons_style = 'kind',
  -- theme style to use
  colorscheme = 'gruvbox-material',
  -- Whether the background is transparent
  -- • boolean
  transparent_background = true,
  -- lint configuration file
  -- • string
  nvim_lint_dir = path.join(vim.fn.stdpath 'config', 'lint'),
  -- Code snippet storage directory
  -- • string
  code_snippets_directory = path.join(vim.fn.stdpath 'config', 'snippets'),
  -- download source (for LSP server, treesitter parser, and various plugin downloads)
  -- • https://github.com/
  -- • https://hub.fastgit.xyz/
  download_source = 'https://github.com/',
}

return options
