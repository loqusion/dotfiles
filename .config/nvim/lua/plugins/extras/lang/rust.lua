local Utils = require("utils")

local function dap_rust_program()
  local target_dir = vim.fn.json_decode(vim.fn.system("cargo metadata --format-version 1 | jq '.target_directory'"))
  local target_debug_dir = ("%s/debug"):format(target_dir)

  local pattern = ("%s/?$"):format(Utils.escape_pattern(target_debug_dir))

  local executable_names = vim.fs.find(function(name, path)
    if not path:match(pattern) then
      return false
    end
    local full_path = ("%s/%s"):format(path, name)
    return vim.loop.fs_access(full_path, "X") or false
  end, { path = target_debug_dir, type = "file", limit = math.huge })
  if #executable_names == 0 then
    vim.notify(
      ("Could not find any executables in %s.\nTry running `cargo build`"):format(target_debug_dir),
      vim.log.levels.WARN
    )
    return
  end

  return require("dap.ui").pick_if_many(executable_names, "Pick an executable:", tostring)
end

return {
  {
    "Saecki/crates.nvim",
    opts = {},
  },

  {
    "simrat39/rust-tools.nvim",
    lazy = true,
    opts = {
      tools = {
        inlay_hints = {
          auto = false,
        },
      },
    },
  },

  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      local dap = require("dap")

      if not dap.configurations.rust then
        dap.configurations.rust = {}
      end

      local r = vim.iter(dap.configurations.rust):find(function(v)
        return v.name == "LLDB: Launch"
      end)
      if r then
        r.program = dap_rust_program
      else
        table.insert(dap.configurations.rust, {
          args = {},
          cwd = "${workspaceFolder}",
          name = "LLDB: Launch",
          program = dap_rust_program,
          request = "launch",
          stopOnEntry = false,
          type = "codelldb",
        })
      end
    end,
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        rust = { "rustfmt" },
      },
    },
  },

  {
    "Olical/conjure",
    optional = true,
  },
}
