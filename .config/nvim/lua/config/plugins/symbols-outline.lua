-- https://github.com/simrat39/symbols-outline.nvim

local M = {
  safe_requires = {
    { 'symbols-outline', 'symbols_outline' },
  },
}

function M.setup()
  M.register_global_keys()
  M.register_global_commands()
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'Outline',
    command = 'setlocal nolist',
  })
end

function M.config()
  M.symbols_outline.setup {}
end

function M.register_global_keys()
  require('crows').key.maps {
    ['<Space>s;'] = { '<Cmd>SymbolsOutline<CR>', 'Toggle symbols outline' },
  }
end

function M.register_global_commands()
  vim.api.nvim_create_user_command('Outline', 'SymbolsOutline', {})
end

return M
