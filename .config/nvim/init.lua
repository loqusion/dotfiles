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

-- require("utils.profile").start()

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimStarted",
  callback = function()
    vim.schedule(function()
      -- require("lazy.core.cache")._inspect()
    end)
  end,
})

require("config.lazy")

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("utils").version()
  end,
})
