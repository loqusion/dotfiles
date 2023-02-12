-- https://github.com/kyazdani42/nvim-web-devicons

local M = {
  safe_requires = {
    { 'nvim-web-devicons', 'devicons' },
  },
}

function M.setup() end

function M.config()
  M.add_extra_icons()
end

function M.add_extra_icons()
  local env_override = {
    icon = '',
    color = '#faf743',
    cterm_color = '226',
    name = 'Env',
  }

  M.devicons.setup {
    override_by_filename = {
      -- globs/regex not supported :(
      ['.env.example'] = env_override,
      ['.env.development'] = env_override,
      ['.env.production'] = env_override,
      ['.env.test'] = env_override,
    },
  }
end

return M
