-- https://github.com/gelguy/wilder.nvim

local M = {
  safe_requires = {
    'wilder'
  }
}

function M.setup() end

function M.config()
  M.wilder.setup {
    modes = { ':', '/', '?' },
  }
  M.wilder.set_option('pipeline', {
    M.wilder.branch(
      M.wilder.cmdline_pipeline {
        language = 'python',
        fuzzy = 1,
      },
      M.wilder.python_search_pipeline {
        pattern = M.wilder.python_fuzzy_pattern(),
        sorter = M.wilder.python_difflib_sorter(),
        engine = 're',
      }
    ),
  })
  M.wilder.set_option(
    'renderer',
    M.wilder.popupmenu_renderer {
      highlighter = M.wilder.basic_highlighter(),
    }
  )
end

return M
