local rule = {
  matches = {
    {
      { "node.nick", "equals", "Wireless Controller" },
    },
    {
      { "device.nick", "equals", "Wireless Controller" },
    },
  },
  apply_properties = {
    ["device.disabled"] = true,
  },
}

table.insert(alsa_monitor.rules, rule)
