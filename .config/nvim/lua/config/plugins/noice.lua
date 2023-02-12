-- https://github.com/folke/noice.nvim

local M = {
  safe_requires = {
    'noice',
  },
}

function M.setup() end

function M.config()
  M.noice.setup {
    presets = {
      -- command_palette = true,
      lsp_doc_border = true,
    },
    lsp = {
      progress = { enabled = true },
      hover = { enabled = false },
      signature = {
        enabled = false,
        auto_open = { enabled = false },
      },
    },
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
          any = {
            { find = 'code_action' },
          },
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
