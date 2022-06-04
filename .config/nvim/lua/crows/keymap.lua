local keymap = {}

function keymap.map(msg, mode, lhs, rhs, opt)
  if mode ~= 'n' then
    opt = opt or {}
    opt.mode = mode
  end
  require('which-key').register({ [lhs] = { rhs, msg } }, opt)
end

function keymap.maps(mappings, opts)
  require('which-key').register(mappings, opts)
end

function keymap.reset()
  require('which-key').reset()
end

return keymap
