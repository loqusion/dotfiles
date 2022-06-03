require('nvim-lsp-installer').setup { automatic_installation = true }

local lspconfig = require 'lspconfig'
local trouble = require 'trouble'
local lsp_colors = require 'lsp-colors'
local lsp_status = require 'lsp-status'
local null_ls = require 'null-ls'

local lsp = vim.lsp

vim.api.nvim_command 'hi link LightBulbFloatWin YellowFloat'
vim.api.nvim_command 'hi link LightBulbVirtualText YellowFloat'

local sign_define = vim.fn.sign_define
sign_define('DiagnosticSignError', { text = '', numhl = 'RedSign' })
sign_define('DiagnosticSignWarn', { text = '', numhl = 'YellowSign' })
sign_define('DiagnosticSignInfo', { text = '', numhl = 'WhiteSign' })
sign_define('DiagnosticSignHint', { text = '', numhl = 'BlueSign' })
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
trouble.setup()
lsp_colors.setup {
  Error = '#db4b4b',
  Warning = '#e0af68',
  Information = '#0db9d7',
  Hint = '#10B981',
}

lsp.handlers['textDocument/publishDiagnostics'] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
  signs = true,
  update_in_insert = false,
  underline = true,
})

local disabled_formatters = { 'stylelint_lsp', 'tsserver' }
local lsp_formatting = function(bufnr)
  -- TODO: Change to `vim.lsp.buf.format` in Neovim 0.8
  -- @see https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts
  vim.lsp.buf.formatting {
    -- filter = function(clients)
    --   return vim.tbl_filter(function(client)
    --     return not vim.tbl_contains(disabled_formatters, client.name)
    --   end, clients)
    -- end,
    -- bufnr = bufnr,
  }
end

pcall(function()
  require('lsp_signature').setup { bind = true, handler_opts = { border = 'single' } }
end)
local on_attach = function(client, bufnr)
  lsp_status.on_attach(client)
  pcall(function()
    require('lsp_signature').on_attach { bind = true, handler_opts = { border = 'single' } }
  end)
  local opts = { buffer = bufnr }
  local map = vim.keymap.set
  map('n', 'gD', vim.lsp.buf.declaration, opts)
  map('n', 'gd', vim.lsp.buf.definition, opts)
  map('n', 'K', vim.lsp.buf.hover, opts)
  map('n', 'gI', vim.lsp.buf.implementation, opts)
  map('i', '<C-k>', vim.lsp.buf.signature_help, opts)
  map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
  map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
  map('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  map('n', '<leader>D', vim.lsp.buf.type_definition, opts)
  map('n', '<leader>rn', vim.lsp.buf.rename, opts)
  map('n', 'gr', vim.lsp.buf.references, opts)
  map('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  map('n', '<leader>so', require('telescope.builtin').lsp_document_symbols, opts)
  map('n', '<leader>f', function()
    lsp_formatting(bufnr)
  end)
  vim.api.nvim_create_user_command('Format', function()
    lsp_formatting(bufnr)
  end, {})

  vim.cmd 'augroup lsp_aucmds'
  if client.server_capabilities.documentHighlightProvider then
    vim.cmd 'au CursorHold <buffer> lua vim.lsp.buf.document_highlight()'
    vim.cmd 'au CursorMoved <buffer> lua vim.lsp.buf.clear_references()'
  end

  vim.cmd 'au CursorHold,CursorHoldI <buffer> lua require"nvim-lightbulb".update_lightbulb {sign = {enabled = false}, virtual_text = {enabled = true, text = ""}, float = {enabled = false, text = "", win_opts = {winblend = 100, anchor = "NE"}}}'
  vim.cmd 'augroup END'
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = { 'documentation', 'detail', 'additionalTextEdits' },
}
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.offsetEncoding = { 'utf-16' }

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

local function prefer_null_ls_fmt(client)
  client.server_capabilities.documentHighlightProvider = false
  client.server_capabilities.documentFormattingProvider = false
  on_attach(client)
end

local servers = {
  bashls = {},
  cssls = {
    filetypes = { 'css', 'scss', 'less', 'sass' },
    root_dir = lspconfig.util.root_pattern('package.json', '.git'),
  },
  cssmodules_ls = {},
  emmet_ls = {},
  -- eslint = { cmd = { 'eslint' } },
  graphql = {},
  html = { cmd = { 'vscode-html-language-server', '--stdio' } },
  jsonls = { prefer_null_ls = true, cmd = { 'vscode-json-language-server', '--stdio' } },
  sumneko_lua = {
    cmd = { 'lua-language-server' },
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
          path = runtime_path,
        },
        diagnostics = {
          globals = { 'vim' },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file('', true),
        },
        telemetry = {
          enable = false,
        },
      },
    },
    prefer_null_ls = true,
  },
  pyright = { settings = { python = { formatting = { provider = 'yapf' } } } },
  stylelint_lsp = {},
  tailwindcss = {},
  -- rust_analyzer = {},
  tsserver = {},
  vimls = {},
  yamlls = {},
}

for server, config in pairs(servers) do
  if type(config) == 'function' then
    config = config()
  end

  local own_on_attach = config.on_attach
  if own_on_attach and config.prefer_null_ls then
    config.on_attach = function(client, bufnr)
      -- on_attach(client, bufnr)
      own_on_attach(client, bufnr)
      prefer_null_ls_fmt(client)
    end
  elseif not own_on_attach and config.prefer_null_ls then
    config.on_attach = function(client, bufnr)
      -- on_attach(client, bufnr)
      prefer_null_ls_fmt(client)
    end
  elseif own_on_attach and not config.prefer_null_ls then
    config.on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      own_on_attach(client, bufnr)
    end
  else
    config.on_attach = on_attach
  end

  config.capabilities = vim.tbl_deep_extend('keep', config.capabilities or {}, capabilities)

  lspconfig[server].setup(config)
end

-- null-ls setup
local null_fmt = null_ls.builtins.formatting
local null_diag = null_ls.builtins.diagnostics
local null_act = null_ls.builtins.code_actions
null_ls.setup {
  sources = {
    -- null_diag.pylint,
    null_diag.eslint,
    null_diag.shellcheck,
    null_diag.teal,
    null_diag.vint,
    -- null_diag.write_good.with { filetypes = { 'markdown' } },
    null_fmt.isort,
    null_fmt.prettier,
    null_fmt.rustfmt,
    null_fmt.stylua,
    null_fmt.trim_whitespace,
    null_fmt.yapf,
    null_act.gitsigns,
    null_act.refactoring.with { filetypes = { 'javascript', 'typescript', 'lua', 'python' } },
    null_act.eslint,
  },
  on_attach = on_attach,
}
