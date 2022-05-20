local g = vim.g
g.EditorConfig_exclude_patterns = { 'fugitive://.*' }

vim.cmd [[au Filetype gitcommit let b:EditorConfig_disable = 1]]
