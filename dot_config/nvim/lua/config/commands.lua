local function cmd(name, command, opts)
  opts = vim.F.if_nil(opts, {})
  local opts_ = vim.tbl_extend("force", {}, opts or {})
  vim.api.nvim_create_user_command(name, command, opts_)
end

cmd("AutoFormatStop", function(t)
  local root_dir = t.fargs[1] or nil
  require("utils").disable_autoformat(root_dir)
end, { nargs = "?" })
