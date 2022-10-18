-- https://github.com/folke/noice.nvim

local M = {
  safe_requires = {
    'noice',
  },
}

function M.setup() end

function M.config()
  M.noice.setup {
    views = {
      cmdline_popup = {
        position = {
          row = '33%',
          col = '50%',
        },
      },
    },
    popupmenu = {
      enabled = false,
      backend = 'cmp',
    },
    hacks = {
      -- otherwise causes issues with vim-textobj-comment
      skip_duplicate_messages = true,
    },
  }
end

return M
