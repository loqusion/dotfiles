local iron = require('iron.core')

iron.setup {
  config = {
    should_map_plug = false,
    scratch_repl = true,
    buflisted = false,
    repl_definition = {
      lua = {
        command = { 'croissant' },
      },
      python = {
        command = { 'ptipython' },
      },
    },
  },
}
