-- https://github.com/folke/noice.nvim

local M = {
  safe_requires = {
    'noice',
  },
}

function M.setup() end

function M.config()
  M.noice.setup {
    lsp = { progress = { enabled = true } },
    views = {
      cmdline_popup = {
        position = {
          row = '33%',
          col = '50%',
        },
      },
    },
    routes = {
      {
        filter = {
          event = 'lsp',
          kind = 'progress',
          -- find = 'null.?ls',
          find = 'code_action',
        },
        opts = { skip = true },
      },
    },
    popupmenu = {
      enabled = true,
      backend = 'cmp',
    },
    hacks = {
      -- otherwise causes issues with vim-textobj-comment
      skip_duplicate_messages = true,
    },
  }
end

return M
