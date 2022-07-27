local port = 51324

return {
  port = port,
  adapters = {
    nlua = function(callback, config)
      callback {
        type = 'server',
        host = config.host,
        port = config.port,
      }
    end,
  },
  configurations = {
    lua = {
      {
        type = 'nlua',
        request = 'attach',
        name = 'Attach to running Neovim instance',
        host = '127.0.0.1',
        port = port,
      },
    },
  },
}
