local g = vim.g
g.indent_blankline_use_treesitter = true
g.indentLine_fileTypeExclude = {
  'lspinfo',
  'packer',
  'checkhealth',
  'help',
  'man',
  'markdown',
  'txt',
  'vimwiki',
  '',
}
g.indent_blankline_show_current_context = true
g.indent_blankline_show_current_context_start = true
