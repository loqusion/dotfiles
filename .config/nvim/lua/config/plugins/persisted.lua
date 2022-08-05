-- https://github.com/olimorris/persisted.nvim

local M = {
  safe_requires = {
    'persisted',
  },
}

function M.setup() end

function M.config()
  M.persisted.setup {
    use_git_branch = true,
    allowed_dirs = { '~/repos', '~/.config/nvim' },
    before_save = function()
      vim.cmd [[
        Neotree close
        TroubleClose
      ]]
    end,
    telescope = {
      before_source = function()
        if vim.g.persisting then
          require('persisted').save()
        end
        vim.api.nvim_input('<Esc>:%bd<CR>')
      end,
    },
  }
end

-- dashboard-nvim overrides
function M.register_global_commands()
  vim.cmd [[
    command! SessionSave :lua require("persisted").save()
    command! SessionLoad :lua require("persisted").load()
  ]]
end

function M.load_telescope_extension()
  local ok, telescope = pcall(require, 'telescope')
  if ok then
    telescope.load_extension 'persisted'
  end
end

return M
