local Utils = require("utils")
local style = require("config.style")

local function dap_rust_program()
  local target_dir = vim.fn.json_decode(vim.fn.system("cargo metadata --format-version 1 | jq '.target_directory'"))
  local target_debug_dir = ("%s/debug"):format(target_dir)

  local pattern = ("%s/?$"):format(Utils.escape_pattern(target_debug_dir))

  local executable_names = vim.fs.find(function(name, path)
    if not path:match(pattern) then
      return false
    end
    local full_path = ("%s/%s"):format(path, name)
    return vim.uv.fs_access(full_path, "X") or false
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

---@type LazySpec[]
return {
  {
    "Saecki/crates.nvim",
    opts = {},
  },

  {
    "mrcjkb/rustaceanvim",
    opts = function(_, opts)
      local on_attach = opts.server.on_attach

      return {
        tools = {
          ---@type vim.api.keyset.win_config
          float_win_config = {
            border = style.border,
          },
        },
        server = {
          on_attach = function(client, buffer, ...)
            on_attach(client, buffer, ...)

            vim.keymap.set("n", "<leader>ce", function()
              vim.cmd.RustLsp("expandMacro")
            end, { desc = "Expand Macro (Rust)", buffer = buffer })
            vim.keymap.set("n", "<leader>co", function()
              vim.cmd.RustLsp("openDocs")
            end, { desc = "Open Docs (Rust)", buffer = buffer })
          end,
          default_settings = {
            ["rust-analyzer"] = {
              files = {
                excludeDirs = {
                  ".direnv",
                  ".git",
                  ".gitlab",
                  "node_modules",
                  ".venv",
                },
              },
            },
          },
        },
      }
    end,
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

      require("dap.ext.vscode").type_to_filetypes["rt_lldb"] = { "rust" }
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
