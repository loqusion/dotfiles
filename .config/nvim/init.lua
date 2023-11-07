---@type any
local notify = false
-- vim.loader = false

if notify then
  notify = function(...)
    local args = { ... }
    vim.schedule(function()
      vim.notify(unpack(args))
    end)
  end
else
  notify = function() end
end

if vim.loader then
  vim.loader.enable()
  notify("nvim loader is enabled")
end

local debug = require("utils.debug")

if vim.env.VIMCONFIG then
  return debug.switch(vim.env.VIMCONFIG)
end

---@diagnostic disable-next-line: unused-local
local profiler = require("utils.profile")
-- profiler.start()

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimStarted",
  callback = function()
    vim.schedule(function()
      -- require("lazy.core.cache")._inspect()
    end)
  end,
})

package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua"

require("config.lazy")
require("config.neovide")
require("config.commands")

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("utils").version()
  end,
})
