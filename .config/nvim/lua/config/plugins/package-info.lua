-- https://github.com/vuki656/package-info.nvim

local M = {
  safe_requires = {
    {'package-info', 'package_info'}
  }
}

function M.setup()
  M.register_global_keys()
end

function M.config()
  M.package_info.setup()
end

function M.register_global_keys()
  local lazy = require 'crows.lazy'
  local key = require('crows').key
  key.maps({
    ['<leader>p'] = {
      s = { lazy.fn('package-info', 'show'), 'Show package versions' },
      c = { lazy.fn('package-info', 'hide'), 'Hide package versions' },
      u = { lazy.fn('package-info', 'update'), 'Update package on current line' },
      d = { lazy.fn('package-info', 'delete'), 'Delete package on current line' },
      i = { lazy.fn('package-info', 'install'), 'Install a new package' },
      r = { lazy.fn('package-info', 'reinstall'), 'Reinstall dependencies' },
      p = { lazy.fn('package-info', 'change_version'), 'Change package version' },
    },
  }, { silent = true })
end

return M
