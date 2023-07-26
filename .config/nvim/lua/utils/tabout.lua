local M = {}

local function tabout_base(...)
  return require("tabout.tab").tabout(...)
end

function M.tabout()
  tabout_base("forward", true)
end

function M.taboutMulti()
  tabout_base("forward", true, true)
end

function M.taboutBack()
  tabout_base("backward", true)
end

function M.taboutBackMulti()
  tabout_base("backward", true, true)
end

return M
