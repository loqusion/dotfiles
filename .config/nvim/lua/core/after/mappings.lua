local key = require('crows').key

-- Unmap
key.maps({
  m = { '<Nop>', '' },
  ['<Space>'] = { '<Nop>', '', remap = true },
  ['<MiddleMouse>'] = {'<Nop>', '', mode = { 'n', 'i', 'c', 'v', 'o', 't', 'l' }}
}, {}, false)
