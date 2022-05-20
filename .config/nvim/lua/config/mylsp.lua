-- TODO: Get more inspiration from https://github.com/wbthomason/dotfiles/blob/linux/neovim/.config/nvim/plugin/lsp.lua

require('nvim-lsp-installer').setup { automatic_installation = true }

local lspconfig = require 'lspconfig'

local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wl', function()
    vim.inspect(vim.lsp.buf.list_workspace_folders())
  end, opts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>so', require('telescope.builtin').lsp_document_symbols, opts)
  vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting)
  vim.api.nvim_create_user_command('Format', vim.lsp.buf.formatting, {})
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
