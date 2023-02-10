-- https://github.com/cshuaimin/ssr.nvim

local M = {
  safe_requires = {
    'ssr',
  },
}

function M.setup()
  M.register_global_keys()
end

function M.config()
  M.ssr.setup {
    min_width = 50,
    min_height = 5,
    max_width = 120,
    max_height = 25,
    keymaps = {
      close = 'q',
      next_match = 'n',
      prev_match = 'N',
      replace_confirm = '<cr>',
      replace_all = '<leader><cr>',
    },
  }
end

function M.register_global_keys()
  require('crows').key.maps({
    ['<Leader>sr'] = {
      function()
        require('ssr').open()
      end,
      'Structural search and replace',
    },
  }, { mode = { 'n', 'x' }, use_whichkey = false })
end

return M
