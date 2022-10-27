-- https://github.com/kevinhwang91/nvim-ufo

local lazy = require 'utils.api.lazy'

local M = {
  safe_requires = {
    'ufo',
  },
}

function M.setup()
  require('crows').key.maps {
    zR = { lazy.fn('ufo', 'openAllFolds'), 'Open all folds (UFO)' },
    zM = { lazy.fn('ufo', 'closeAllFolds'), 'Close all folds (UFO)' },
    zr = { lazy.fn('ufo', 'openFoldsExceptKinds'), 'Open folds (UFO)' },
    zm = { lazy.fn('ufo', 'closeFoldsWith'), 'Close all folds (UFO)' },
  }
end

function M.config()
  M.ufo.setup {
    provider_selector = function(_bufnr, _filetype, _buftype)
      return { 'treesitter', 'indent' }
    end,
  }
end

return M
