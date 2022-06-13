local lsp = require('crows.utils').new_feat()

lsp.pre = function()
  local signs = { Error = '', Warn = '', Info = '', Hint = '' }
  for sign, text in pairs(signs) do
    local hl = 'DiagnosticSign' .. sign
    vim.fn.sign_define(hl, { text = text, texthl = hl, linehl = '', numhl = '' })
  end
  vim.cmd [[
    hi link LightBulbFloatWin YellowFloat
    hi link LightBulbVirtualText YellowFloat
  ]]
end

lsp.use {
  'jose-elias-alvarez/null-ls.nvim',
  disable = true,
  requires = 'nvim-lua/plenary.nvim',
}

-- lsp diagnostics
lsp.use {
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
        w = { '<cmd>Trouble workspace_diagnostics<cr>', 'Workspace diagnostics' },
        d = { '<cmd>Trouble document_diagnostics<cr>', 'Document diagnostics' },
        l = { '<cmd>Trouble loclist<cr>', "Items from the window's location list" },
        q = { '<cmd>Trouble quickfix<cr>', 'Quickfix items' },
      },
    }
  end,
}

lsp.use {
  'nvim-lua/lsp-status.nvim',
  disable = true,
  config = function()
    local lsp_status = require 'lsp-status'
    lsp_status.config {
      indicator_errors = 'E',
      indicator_warnings = 'W',
      indicator_info = 'i',
      indicator_hint = '?',
      indicator_ok = 'Ok',
      select_symbol = function(cursor_pos, symbol)
        if symbol.valueRange then
          local value_range = {
            ['start'] = { character = 0, line = vim.fn.byte2line(symbol.valueRange[1]) },
            ['end'] = { character = 0, line = vim.fn.byte2line(symbol.valueRange[2]) },
          }

          return require('lsp-status/util').in_range(cursor_pos, value_range)
        end
      end,
      current_function = false,
    }
    lsp_status.register_progress()
    require('crows.lsp').add_on_attach(function(client, _)
      require('lsp_status').on_attach(client)
    end)
  end,
}

lsp.use {
  'folke/lsp-colors.nvim',
  config = function()
    require('lsp-colors').setup {
      Error = '#db4b4b',
      Warning = '#e0af68',
      Information = '#0db9d7',
      Hint = '#10B981',
    }
  end,
}

lsp.use {
  'ray-x/lsp_signature.nvim',
  config = function()
    require('crows.lsp').add_on_attach(function(_, _)
      require('lsp_signature').on_attach { bind = true, handler_opts = { border = 'none' } }
    end)
  end,
}

lsp.use {
  'kosayoda/nvim-lightbulb',
  config = function()
    require('crows.lsp').add_on_attach(function(_, bufnr)
      local group = vim.api.nvim_create_augroup('lsp_aucmds', {})
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        group = group,
        buffer = bufnr,
        callback = function()
          require('nvim-lightbulb').update_lightbulb {
            sign = { enabled = false },
            virtual_text = { enabled = true, text = '' },
            float = { enabled = false, text = '', win_opts = { winblend = 100, anchor = 'NE' } },
          }
        end,
        desc = 'Show lightbulb',
      })
    end)
  end,
}

lsp.use {
  'RRethy/vim-illuminate',
  config = function()
    require('crows.lsp').add_on_attach(function(client)
      require('illuminate').on_attach(client)
    end)
    vim.g.Illuminate_delay = 100
  end,
}

lsp.use {
  'ThePrimeagen/refactoring.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
}

lsp.use {
  'j-hui/fidget.nvim',
  config = function()
    require('fidget').setup {
      window = {
        blend = 100,
      },
    }
  end,
}

return lsp
