---@class LspModule
---@field keys LspKeyMappers
---@field buffer_keys LspKeyMappers
---@field on_attaches OnAttachFn()
---@field caps_setters CapsSetter[]

---@class LspKeyMapper
---@field [1] string key
---@field [2] string command
---@field [3] string introduce

---@alias LspKeyMappers table<string, LspKeyMapper>
---@alias OnAttachFn function(client:table,bufnr:number)
---@alias CapsSetter function(caps:table):table

-- local opts = { noremap=true, silent=true }

---@type LspModule
local lsp = {
  keys = {
    diag_float = {
      '<localleader>e',
      {
        vim.diagnostic.open_float,
        'Open diagnostic floating window',
      },
    },
    diag_prev = { '[d', { vim.diagnostic.goto_prev, 'Goto prev diagnostic' } },
    diag_next = { ']d', { vim.diagnostic.goto_next, 'Goto next diagnostic' } },
    diag_loclist = {
      '<localleader>q',
      {
        vim.diagnostic.setloclist,
        'Add buffer diagnostics to the location list.',
      },
    },
  },
  buffer_keys = {
    goto_decl = { 'gD', { vim.lsp.buf.declaration, 'Goto declaration' } },
    goto_def = { 'gd', { vim.lsp.buf.definition, 'Goto definition' } },
    hover = { 'gh', { vim.lsp.buf.hover, 'Display hover information' } },
    goto_impl = { 'gI', { vim.lsp.buf.implementation, 'Goto implementation' } },
    sign_help = { '<C-k>', { vim.lsp.buf.signature_help, 'Display signature information', mode = 'i' } },
    -- add_folder = { '<leader>wa', { vim.lsp.buf.add_workspace_folder, 'Add workspace folder' } },
    -- del_folder = { '<leader>wr', { vim.lsp.buf.remove_workspace_folder, 'Remove workspace folder' } },
    -- list_folders = {
    --   '<leader>wl',
    --   {
    --     function()
    --       print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    --     end,
    --     'List workspace folder',
    --   },
    -- },
    type_def = { '<leader>D', { vim.lsp.buf.type_definition, 'Goto type definition' } },
    rename = { '<F2>', { vim.lsp.buf.rename, 'Rename symbol' } },
    code_action = { '<leader><leader>', { vim.lsp.buf.code_action, 'Code action' } },
    list_ref = { 'gr', { '<cmd>TroubleToggle lsp_references<cr>', 'List references' } },
  },
  on_attaches = {},
  caps_setters = {},
}

---set lsp function of the key
---@param mapper LspKeyMapper
---@param command string
function lsp.set_key_cmd(mapper, command)
  mapper[2] = command
end

---set lsp key of the function
---@param mapper LspKeyMapper
---@param command string
function lsp.set_cmd_key(mapper, command)
  mapper[1] = command
end

---add 'on_attach' hook
---@param fn OnAttachFn
function lsp.add_on_attach(fn)
  lsp.on_attaches[#lsp.on_attaches + 1] = fn
end

---add a capabilities setter
---@param setter CapsSetter
function lsp.add_caps_setter(setter)
  lsp.caps_setters[#lsp.caps_setters + 1] = setter
end

--- mapping lsp keys
---@param bufnr number buffer number
local function mapping(bufnr)
  -- local wk = require 'which-key'
  local key = require('crows').key
  local mappings = {}
  for _, mapper in pairs(lsp.keys) do
    mappings[mapper[1]] = mapper[2]
  end
  -- wk.register(mappings, { silent = true })
  key.maps(mappings, {silent = true})

  local buf_mappings = {}
  for _, mapper in pairs(lsp.buffer_keys) do
    buf_mappings[mapper[1]] = mapper[2]
  end
  -- wk.register(buf_mappings, { buffer = bufnr })
  key.maps(buf_mappings, {buffer = bufnr})
end

--- on attach function
---@param client table client object
---@param bufnr number buffer number
local function on_attach(client, bufnr)
  if not vim.b.did_lsp_mappings then
    mapping(bufnr)
    vim.b.did_lsp_mappings = true
  end
  for _, fn in ipairs(lsp.on_attaches) do
    fn(client, bufnr)
  end
end

local function make_on_attach(local_on_attach)
  return function(client, bufnr)
    if local_on_attach then
      local_on_attach(client, bufnr)
    end
    on_attach(client, bufnr)
  end
end

local function capabilities()
  local caps = vim.lsp.protocol.make_client_capabilities()
  caps.textDocument.completion.completionItem.snippetSupport = true
  caps.textDocument.completion.completionItem.resolveSupport = {
    properties = { 'documentation', 'detail', 'additionalTextEdits' },
  }
  for _, setter in ipairs(lsp.caps_setters) do
    caps = setter(caps)
  end
  return caps
end

--- set lsp config
---@param name string language server string
---@param config table language server config
function lsp.set_config(name, config)
  local lspconfig = require 'lspconfig'
  config.on_attach = make_on_attach(config.on_attach)
  config.capabilities = capabilities()
  lspconfig[name].setup(config)
end

function lsp.setup_null_ls(config)
  config.on_attach = make_on_attach(config.on_attach)
  return require('null-ls').setup(config)
end

function lsp.add_default(name, default_config)
  local configs = require 'lspconfig.configs'
  if not configs[name] then
    configs[name] = {
      default_config = default_config,
    }
  end
end

function lsp.stop_all_clients()
  ---@diagnostic disable-next-line: missing-parameter
  vim.lsp.stop_client(vim.lsp.get_active_clients())
end

return lsp
