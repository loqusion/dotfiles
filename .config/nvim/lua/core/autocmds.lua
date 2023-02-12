local yabai = require 'utils.api.yabai'

local groups = {
  cursorline = vim.api.nvim_create_augroup('cursorline', {}),
  colorscheme = vim.api.nvim_create_augroup('colorscheme-fallback', {}),
  lsp = vim.api.nvim_create_augroup('lsp-custom', {}),
  yabai = vim.api.nvim_create_augroup('yabai', {}),
}

vim.api.nvim_create_autocmd('VimEnter', {
  desc = 'Make terminal full-screen',
  pattern = '*',
  callback = yabai.float_off,
  once = true,
  group = groups.yabai,
})
vim.api.nvim_create_autocmd('VimResume', {
  desc = 'Make terminal full-screen',
  pattern = '*',
  callback = yabai.float_off,
  group = groups.yabai,
})
vim.api.nvim_create_autocmd('VimSuspend', {
  desc = 'Make terminal float',
  pattern = '*',
  callback = yabai.float_on,
  group = groups.yabai,
})
vim.api.nvim_create_autocmd('VimLeave', {
  desc = 'Make terminal float',
  pattern = '*',
  callback = yabai.float_on,
  once = true,
  group = groups.yabai,
})

-- Fallback treesitter highlights
vim.api.nvim_create_autocmd('ColorScheme', {
  desc = 'Fallback treesitter highlights',
  pattern = '*',
  callback = function()
    local links = {
      ['@property.class.css'] = '@string',
      ['@property.id.css'] = '@type',
      ['@string.plain'] = '@constant.builtin',
      ['@type.tag'] = '@keyword.operator',
    }

    for from, to in pairs(links) do
      vim.api.nvim_set_hl(0, from, {
        default = true,
        link = to,
      })
    end
  end,
  group = groups.colorscheme,
})

-- Disable linting .env files
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  desc = 'Disable linting for .env files',
  pattern = '.env,.env.*',
  callback = function(props)
    vim.diagnostic.disable(props.bufnr)
    vim.defer_fn(function()
      vim.diagnostic.reset(nil, props.bufnr)
    end, 300)
  end,
  group = groups.lsp,
})
