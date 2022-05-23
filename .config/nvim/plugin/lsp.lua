require('nvim-lsp-installer').setup { automatic_installation = true }

local lspconfig = require 'lspconfig'
local trouble = require 'trouble'

trouble.setup()

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

local on_attach = function(_, bufnr)
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
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

local servers = {
  bashls = {},
  cssls = {
    filetypes = { 'css', 'scss', 'less', 'sass' },
    root_dir = lspconfig.util.root_pattern('package.json', '.git'),
  },
  cssmodules_ls = {},
  emmet_ls = {},
  eslint = {},
  graphql = {},
  html = {},
  jsonls = {},
  sumneko_lua = {
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
  },
  pyright = {},
  stylelint_lsp = {},
  tailwindcss = {},
  rust_analyzer = {},
  tsserver = {},
  vimls = {},
  yamlls = {},
}

for server, config in pairs(servers) do
  if type(config) == 'function' then
    config = config()
  end

  -- TODO: merge on_attach
  --config.on_attach = vim.tbl_deep_extend(
  --  'keep',
  --  config.on_attach or {},
  --  on_attach
  --)
  config.on_attach = on_attach
  config.capabilities = vim.tbl_deep_extend(
    'keep',
    config.capabilities or {},
    capabilities
  )

  lspconfig[server].setup(config)
end
