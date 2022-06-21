-- https://github.com/gelguy/wilder.nvim

local M = {}

function M.setup() end

function M.config()
  local wilder = require 'wilder'
  wilder.setup {
    modes = { ':', '/', '?' },
  }
  wilder.set_option('pipeline', {
    wilder.branch(
      wilder.cmdline_pipeline {
        language = 'python',
        fuzzy = 1,
      },
      wilder.python_search_pipeline {
        pattern = wilder.python_fuzzy_pattern(),
        sorter = wilder.python_difflib_sorter(),
        engine = 're',
      }
    ),
  })
  wilder.set_option(
    'renderer',
    wilder.popupmenu_renderer {
      highlighter = wilder.basic_highlighter(),
    }
  )
end

return M
