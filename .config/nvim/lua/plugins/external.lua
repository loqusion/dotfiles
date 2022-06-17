local external = require('crows.utils').new_feat()

external.use {
  'tyru/open-browser.vim',
  config = function()
    local key = require('crows').key
    for _, mode in ipairs { 'n', 'x' } do
      key.map(
        'Open in browser',
        mode,
        'gx',
        "<cmd>call vimrc#github_or_open_browser('" .. mode .. "')<cr>",
        { silent = true }
      )
    end
  end,
}

external.use 'rizzatti/dash.vim'

return external
