---@type Feature
local lsp = { plugins = {} }

lsp.pre = function()
  local signs = { Error = '', Warn = '', Info = '', Hint = '' }
  for sign, text in pairs(signs) do
    local hl = 'DiagnosticSign' .. sign
    vim.fn.sign_define(hl, { text = text, texthl = hl, linehl = '', numhl = '' })
  end
end

-- lsp diagnostics
lsp.plugins[#lsp.plugins + 1] = {
  'folke/trouble.nvim',
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require('trouble').setup {
      signs = { error = '', warning = '', hint = '', information = '', other = '﫠' },
    }
    require('crows').key.maps {
      ['<leader>x'] = {
        name = 'lsp trouble',
        x = { '<cmd>TroubleToggle<cr>', 'Toggle Trouble' },
        w = { '<cmd>Trouble lsp_workspace_diagnostics<cr>', 'Workspace diagnostics' },
        d = { '<cmd>Trouble lsp_document_diagnostics<cr>', 'Document diagnostics' },
        l = { '<cmd>Trouble loclist<cr>', "Items from the window's location list" },
        q = { '<cmd>Trouble quickfix<cr>', 'Quickfix items' },
      },
    }
  end,
}

lsp.plugins[#lsp.plugins + 1] = {
  'ray-x/lsp_signature.nvim',
  config = function()
    require('crows.lsp').add_on_attach(function(_, _)
      require('lsp_signature').on_attach { bind = true, handler_opts = { border = 'none' } }
    end)
  end,
}

lsp.plugins[#lsp.plugins + 1] = {
  'j-hui/fidget.nvim',
  config = function()
    require('fidget').setup {}
  end,
}

return lsp
