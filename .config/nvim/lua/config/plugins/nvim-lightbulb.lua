-- https://github.com/kosayoda/nvim-lightbulb

local M = {
  icons = require('utils.icons').lsp_hover,
}

function M.setup()
  require('utils.aux.lsp').add_on_attach(function(_, bufnr)
    local group = vim.api.nvim_create_augroup('lsp_aucmds', {})
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI', 'CursorMoved', 'CursorMovedI' }, {
      group = group,
      buffer = bufnr,
      callback = function()
        local action_icon = M.icons.Action
        require('nvim-lightbulb').update_lightbulb {
          sign = {
            enabled = true,
            text = action_icon,
            priority = 15,
          },
          float = {
            enabled = false,
            text = action_icon,
            win_opts = {},
          },
          virtual_text = {
            enabled = false,
            text = action_icon,
          },
          status_text = {
            enabled = false,
            text = action_icon,
            text_unavailable = '',
          },
        }
      end,
      desc = 'Show lightbulb',
    })
  end)
end

function M.config() end

return M
