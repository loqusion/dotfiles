-- https://github.com/kevinhwang91/nvim-hlslens

local M = {}

function M.setup()
  M.register_global_keys()
end

function M.config()
  -- M.register_global_keys()

  local ok, m = pcall(require, 'hlslens')
  if not ok then
    vim.notify(
      string.format('Failed to load config %s: %s', require('utils.api.path').current_filename(true), m),
      vim.log.levels.ERROR
    )
    return
  end

  M.hlslens = m
  M.hlslens.setup {
    build_position_cb = function(plist, _, _, _)
      require('scrollbar.handlers.search').handler.show(plist.start_pos)
    end,
  }
end

function M.register_global_keys()
  require('crows').key.maps({
    n = {
      [[<Cmd>call execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
      'Goto next match',
    },
    N = {
      [[<Cmd>call execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
      'Goto previous match',
    },
    ['*'] = {
      [[<Plug>(asterisk-z*)<Cmd>lua require('hlslens').start()<CR>]],
      'Find matches for keyword under cursor',
      remap = true,
    },
    -- ['#'] = {
    --   [[<Plug>(asterisk-z#)<Cmd>lua require('hlslens').start()<CR>]],
    --   'Find matches for keyword under cursor',
    --   remap = true,
    -- },
    ['g*'] = {
      [[<Plug>(asterisk-gz*)<Cmd>lua require('hlslens').start()<CR>]],
      'Find matches for keyword under cursor',
      remap = true,
    },
    ['g#'] = {
      [[<Plug>(asterisk-gz#)<Cmd>lua require('hlslens').start()<CR>]],
      'Find matches for keyword under cursor',
      remap = true,
    },
  }, { mode = { 'n', 'x' }, use_whichkey = false })
end

return M
