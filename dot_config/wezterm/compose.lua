local function compose(x, fns)
  for _, fn in ipairs(fns) do
    x = fn(x) or x
  end
  return x
end

return compose
