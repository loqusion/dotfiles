-- https://github.com/Shatur/neovim-session-manager

local M = {
  safe_requires = {
    'session_manager',
    {'session_manager.config', 'session_manager_config'}
  }
}

function M.setup()
end

function M.config()
  M.session_manager.setup({
    autoload_mode = M.session_manager_config.AutoloadMode.Disabled,
    autosave_ignore_filetypes = {
      'gitcommit',
      'neo-tree',
      'Outline',
      'toggleterm',
      'Trouble',
    },
    autosave_only_in_session = true,
  })
end

return M
