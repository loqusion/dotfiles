local function basename_root(path)
  return vim.fn.fnamemodify(path, ':t:r')
end

local memoized_colorscheme_list
local function get_colorscheme_list()
  if not memoized_colorscheme_list then
    local file_list = vim.api.nvim_get_runtime_file('colors/*', true)
    memoized_colorscheme_list = vim.tbl_map(basename_root, file_list)
  end
  return memoized_colorscheme_list
end

local memoized_omit_list
local function get_omit_list()
  if not memoized_omit_list then
    local file_list = vim.fn.globpath(vim.env.VIMRUNTIME, 'colors/*', true, true)
    memoized_omit_list = vim.tbl_map(basename_root, file_list)
  end
  return memoized_omit_list
end

vim.api.nvim_create_user_command('Colorscheme', function(opts)
  local colorscheme = opts.args
  if not opts.bang and vim.tbl_contains(get_omit_list(), colorscheme) then
    vim.notify(
      ('%s is a default colorscheme - run `Colorscheme! %s` to use it anyway'):format(colorscheme, colorscheme),
      vim.log.levels.WARN
    )
    return
  end
  vim.cmd(('colorscheme %s'):format(opts.args))
end, {
  nargs = 1,
  bang = true,
  complete = function(a, line, c)
    local colorscheme_list = get_colorscheme_list()
    local omit_list = get_omit_list()

    local l = vim.split(line, '%s+')
    local bang = vim.endswith(l[1], '!')

    return vim.tbl_filter(function(val)
      return vim.startswith(val, l[2]) and (bang or not vim.tbl_contains(omit_list, val))
    end, colorscheme_list)
  end,
})
