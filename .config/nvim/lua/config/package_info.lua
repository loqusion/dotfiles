local map = vim.keymap.set

-- Show package versions
map('n', '<leader>ns', ":lua require('package-info').show()<CR>", { silent = true })

-- Hide package versions
map('n', '<leader>nc', ":lua require('package-info').hide()<CR>", { silent = true })

-- Update package on line
map('n', '<leader>nu', ":lua require('package-info').update()<CR>", { silent = true })

-- Delete package on line
map('n', '<leader>nd', ":lua require('package-info').delete()<CR>", { silent = true })

-- Install a new package
map('n', '<leader>ni', ":lua require('package-info').install()<CR>", { silent = true })

-- Reinstall dependencies
map('n', '<leader>nr', ":lua require('package-info').reinstall()<CR>", { silent = true })

-- Install a different package version
map('n', '<leader>np', ":lua require('package-info').change_version()<CR>", { silent = true })
