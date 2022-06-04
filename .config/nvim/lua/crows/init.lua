-- source: https://github.com/nanozuki/CrowsEnv

local keymap = require('crows.keymap')
local lsp = require('crows.lsp')
local plugin = require('crows.plugin')

---@class CrowsModule
---@field key table
---@field modules string[]
---@field features Feature[]

---@type CrowsModule
local crows = {
  key = {
    map = keymap.map,
    maps = keymap.maps,
  },
  modules = {},
  features = {},
}

---@class SetupOptions
---@field modules string[]
---@field features Feature[]

---@class Feature
---@field pre? function config not depend on plugin
---@field plugins? PluginSpec[]
---@field post? function config depend on plugin

local default_plugins = {
  { 'wbthomason/packer.nvim', opt = true },
  'folke/which-key.nvim',
  'nvim-lua/plenary.nvim',
  'neovim/nvim-lspconfig',
}

local function load_plugins()
  for _, plug in ipairs(default_plugins) do
    plugin.use(plug)
  end
  for _, feature in ipairs(crows.features) do
    if feature.plugins ~= nil then
      for _, plug in ipairs(feature.plugins) do
        plugin.use(plug)
      end
    end
  end
end

---@param opt SetupOptions
function crows.setup(opt)
  vim.api.nvim_create_user_command('CrowsReload', crows.reload, {})
  vim.api.nvim_create_user_command('CrowsResync', crows.resync, {})
  vim.api.nvim_create_user_command('CrowsUpdateSync', crows.external_resync, {})
  crows.modules = opt.modules or {}
  crows.features = opt.features or {}
  for _, feature in ipairs(crows.features) do
    if feature.pre ~= nil then
      feature.pre()
    end
  end
  if plugin.is_ready() then
    crows.post_setup()
  else
    load_plugins()
    plugin.init(crows.post_setup)
  end
end

function crows.post_setup()
  for _, feature in ipairs(crows.features) do
    if feature.post ~= nil then
      local ok, err = pcall(feature.post)
      if not ok then
        vim.notify(err, 'warn')
      end
    end
  end
end

local function reset()
  for _, m in ipairs(crows.modules) do
    require('plenary.reload').reload_module(m)
  end
  plugin.reset()
  keymap.reset()
  lsp.stop_all_clients()
  vim.cmd [[runtime! init.lua]]
  load_plugins()
end

function crows.reload()
  reset()
  plugin.compile()
end

function crows.resync()
  reset()
  plugin.sync()
end

function crows.external_resync()
  plugin.sync_and_quit()
end

return crows
