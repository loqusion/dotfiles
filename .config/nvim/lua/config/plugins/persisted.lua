-- https://github.com/olimorris/persisted.nvim

local M = {
  safe_requires = {
    'persisted',
  },
  ignore_filetypes = {
    'noice',
  },
}

M.telescope_config = {
  before_source = function()
    -- close all running lsp servers
    vim.lsp.stop_client(vim.lsp.get_active_clients())

    if not M.is_restorable_buffer_present() then
      require('persisted').start()
    elseif vim.g.persisting then
      require('persisted').save()
      require('utils.api').buffers.delete_listed()
    end
  end,
}

function M.setup() end

function M.config()
  M.persisted.setup {
    branch_separator = '@@',
    allowed_dirs = { '~/repos', '~/.config/nvim' },
    before_save = function()
      vim.api.nvim_input '<Esc>:tabrewind<CR>'
      vim.cmd [[
        Neotree close
        TroubleClose
      ]]
    end,
    should_autosave = M.is_restorable_buffer_present,
    telescope = M.telescope_config,
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

---@private
function M.is_restorable(buffer)
  if #vim.api.nvim_buf_get_option(buffer, 'bufhidden') ~= 0 then
    return false
  end

  local buftype = vim.api.nvim_buf_get_option(buffer, 'buftype')
  if #buftype == 0 then
    -- Normal buffer, check if it is listed.
    if not vim.api.nvim_buf_get_option(buffer, 'buflisted') then
      return false
    end
    -- Check if it has a filename.
    if #vim.api.nvim_buf_get_name(buffer) == 0 then
      return false
    end
  elseif buftype ~= 'terminal' then
    return false
  end

  if vim.tbl_contains(M.ignore_filetypes, vim.api.nvim_buf_get_option(buffer, 'filetype')) then
    return false
  end

  return true
end

---@private
function M.is_restorable_buffer_present()
  for _, buffer in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_valid(buffer) and M.is_restorable(buffer) then
      return true
    end
  end
  return false
end

return M
