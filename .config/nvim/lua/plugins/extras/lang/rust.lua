local Utils = require("utils")

local function get_codelldb_paths()
  local this_os = vim.loop.os_uname().sysname
  local extension_path = vim.env.MASON .. "/packages/codelldb/extension"
  local codelldb_path
  local liblldb_path

  if this_os:find("Windows") then
    codelldb_path = extension_path .. "/adapter/codelldb.exe"
    liblldb_path = extension_path .. "/lldb/bin/liblldb.dll"
  else
    codelldb_path = extension_path .. "/adapter/codelldb"
    liblldb_path = extension_path .. "/lldb/lib/liblldb" .. (this_os == "Linux" and ".so" or ".dylib")
  end

  return codelldb_path, liblldb_path
end

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
    vim.notify(("Could not find any executables in %s"):format(target_debug_dir), vim.log.levels.WARN)
    return
  end

  return require("dap.ui").pick_if_many(executable_names, "Pick an executable:", tostring)
end

return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "rust-analyzer",
        "rustfmt",
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "simrat39/rust-tools.nvim", config = false },
    },
    opts = {
      servers = {
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              procMacro = { enable = true },
              cargo = { allFeatures = true },
              checkOnSave = {
                command = "clippy",
                extraArgs = { "--no-deps" },
              },
            },
          },
        },
      },
      setup = {
        rust_analyzer = function(_, opts)
          local codelldb_path, liblldb_path = get_codelldb_paths()
          require("rust-tools").setup({
            tools = {
              inlay_hints = { auto = not Utils.has("lsp-inlayhints.nvim") },
            },
            server = opts,
            dap = {
              adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
            },
          })
          return true
        end,
      },
    },
  },

  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = function(_, opts)
          vim.list_extend(opts.ensure_installed, {
            "codelldb",
          })
        end,
      },
    },
    opts = function()
      local dap = require("dap")
      dap.configurations.rust = vim.deepcopy(dap.configurations.c)

      local did_config = false
      for _, v in pairs(dap.configurations.rust) do
        if v.name == "LLDB: Launch" then
          v.program = dap_rust_program
          did_config = true
        end
      end

      if not did_config then
        vim.notify(
          "Failed to configure rust dap -- could not find c config with name 'LLDB: Launch'",
          vim.log.levels.ERROR
        )
      end
    end,
  },

  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "rouge8/neotest-rust",
    },
    opts = {
      adapters = {
        ["neotest-rust"] = {},
      },
    },
  },

  {
    "Saecki/crates.nvim",
    event = "BufRead Cargo.toml",
    opts = {
      null_ls = { enabled = true },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      table.insert(opts.sources, { name = "crates" })
    end,
  },

  {
    "Olical/conjure",
    dependencies = {
      "evcxr/evcxr",
      build = {
        "rustup component add rust-src",
        "cargo install evcxr_repl",
      },
    },
  },
}
