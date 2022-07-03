-- https://github.com/kosayoda/nvim-lightbulb

local M = {}

function M.setup()
end

function M.config()
require('crows.lsp').add_on_attach(function(_, bufnr)
      local group = vim.api.nvim_create_augroup('lsp_aucmds', {})
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        group = group,
        buffer = bufnr,
        callback = function()
          local action_icon = require('utils.icons').lsp_hover.Action
          require('nvim-lightbulb').update_lightbulb {
            sign = { enabled = false },
            virtual_text = { enabled = true, text = action_icon },
            float = { enabled = false, text = action_icon, win_opts = { winblend = 100, anchor = 'NE' } },
          }
        end,
        desc = 'Show lightbulb',
      })
    end)
end

return M
