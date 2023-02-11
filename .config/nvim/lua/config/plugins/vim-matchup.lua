-- https://github.com/andymass/vim-matchup

local M = {}

function M.entrance()
  vim.g.matchup_matchparen_deferred = 1
  vim.g.matchup_matchparen_deferred_show_delay = 100
  vim.g.matchup_matchparen_hi_surround_always = 1
  vim.g.matchup_surround_enabled = 1
  vim.g.matchup_matchparen_offscreen = {}
end

return M
