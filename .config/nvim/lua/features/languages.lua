-- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

local lsp = require 'crows.lsp'
local fmt = require 'features.format'

---@type Feature
local fish = {
  plugins = {
    { 'dag/vim-fish', ft = { 'fish' } },
  },
}

local go = {
  pre = function()
    fmt.by_formatter.go = { fmt.formatters.goimports }
  end,
  plugins = {
    {
      'ray-x/go.nvim',
      ft = { 'go', 'gomod' },
      config = function()
        require('go').setup()
      end,
    },
  },
  post = function()
    lsp.set_config('gopls', {})
    lsp.set_config('golangci_lint_ls', {})
  end,
}

---@type Feature
local json = {
  pre = function()
    fmt.by_formatter.json = { fmt.formatters.prettier }
  end,
  post = function()
    lsp.set_config('jsonls', {})
  end,
}

---@type Feature
local lua = {
  pre = function()
    fmt.by_formatter.lua = { fmt.formatters.stylua }
  end,
  post = function()
    local runtime_path = vim.split(package.path, ';')
    table.insert(runtime_path, 'lua/?.lua')
    table.insert(runtime_path, 'lua/?/init.lua')

    local function workspace_files()
      local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ':~')
      if cwd == '~/.config/nvim' then
        -- Make the server aware of Neovim runtime files, only in config cwd
        return vim.api.nvim_get_runtime_file('', true)
      end
      return nil
    end

    local sumneko_lua_settings = {
      cmd = { 'lua-language-server' },
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
            path = runtime_path,
          },
          completion = {
            autoRequire = false,
          },
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            library = workspace_files(),
            maxPreload = 5000,
          },
          telemetry = {
            enable = false,
          },
        },
      },
    }
    lsp.set_config('sumneko_lua', sumneko_lua_settings)
  end,
}

---@type Feature
local markdown = {
  pre = function()
    fmt.by_formatter.markdown = { fmt.formatters.prettier }
  end,
  plugins = {
    'preservim/vim-markdown',
    {
      'iamcco/markdown-preview.nvim',
      run = 'cd app && yarn install',
      ft = { 'markdown', 'pandoc.markdown', 'rmd' },
      setup = function()
        vim.g.mkdp_filetypes = { 'markdown', 'pandoc.markdown', 'rmd' }
      end,
    },
  },
}

---@type Feature
local python = {
  pre = function()
    fmt.by_formatter.python = { fmt.formatters.python }
  end,
  plugins = {
    'Vimjas/vim-python-pep8-indent',
  },
  post = function()
    lsp.set_config('pyright', {})
  end,
}

---@type Feature
local rust = {
  pre = function()
    fmt.by_formatter.rust = { fmt.formatters.rustfmt }
  end,
  plugins = {
    {
      'simrat39/rust-tools.nvim',
      disable = true,
      ft = 'rust',
      config = function()
        require('rust-tools').setup {}
      end,
    },
  },
  post = function()
    lsp.set_config('rust_analyzer', {})
  end,
}

---@type Feature
local typescript = {
  pre = function()
    fmt.by_formatter.typescript = { fmt.formatters.prettier }
    fmt.by_formatter.javascript = { fmt.formatters.prettier }
    fmt.by_formatter.typescriptreact = { fmt.formatters.prettier }
    fmt.by_formatter.javascriptreact = { fmt.formatters.prettier }
    fmt.by_formatter.html = { fmt.formatters.prettier }
    fmt.by_formatter.css = { fmt.formatters.prettier }
    fmt.by_formatter.scss = { fmt.formatters.prettier }
    fmt.by_formatter.sass = { fmt.formatters.prettier }
    fmt.by_formatter.vue = { fmt.formatters.prettier }
    fmt.by_formatter.graphql = { fmt.formatters.prettier }
  end,
  plugins = {
    {
      'mattn/emmet-vim',
      ft = {
        'html',
        'javascript.jsx',
        'typescript.tsx',
        'javascriptreact',
        'typescriptreact',
        'vue',
      },
    },
    {
      'vuki656/package-info.nvim',
      requires = 'MunifTanjim/nui.nvim',
      module = 'package-info',
      config = function()
        require('package-info').setup()

        local lazy_require = require('crows.utils').lazy_require
        local key = require('crows').key
        key.maps({
          ['<leader>n'] = {
            s = { lazy_require('package-info', 'show'), 'Show package versions' },
            c = { lazy_require('package-info', 'hide'), 'Hide package versions' },
            u = { lazy_require('package-info', 'update'), 'Update package on current line' },
            d = { lazy_require('package-info', 'delete'), 'Delete package on current line' },
            i = { lazy_require('package-info', 'install'), 'Install a new package' },
            r = { lazy_require('package-info', 'reinstall'), 'Reinstall dependencies' },
            p = { lazy_require('package-info', 'change_version'), 'Change package version' },
          },
        }, { silent = true })
      end,
    },
  },
  post = function()
    local util = require 'lspconfig.util'
    lsp.set_config('tsserver', {
      root_dir = function(fname)
        return util.root_pattern 'tsconfig.json' (fname)
            or util.root_pattern('package.json', 'jsconfig.json')(fname)
      end,
    })

    lsp.set_config('tailwindcss', {
      root_dir = util.root_pattern('tailwind.config.js', 'tailwind.config.ts'),
    })

    lsp.set_config('denols', {
      root_dir = util.root_pattern 'deno_root',
      init_options = {
        enable = true,
        lint = true,
        unstable = true,
      },
    })
    lsp.set_config('graphql', {
      filetypes = { 'graphql' },
    })
    lsp.set_config('html', {})
    lsp.set_config('cssls', {})
    lsp.set_config('cssmodules_ls', {})
    lsp.set_config('eslint', {})
    lsp.set_config('emmet_ls', {})
  end,
}

---@type Feature
local viml = {
  post = function()
    lsp.set_config('vimls', {})
  end,
}

---@type Feature
local yaml = {
  pre = function()
    fmt.by_formatter.yaml = { fmt.formatters.prettier }
  end,
  post = function()
    lsp.set_config('yamlls', {})
  end,
}

---@type Feature[]
return {
  fish,
  go,
  json,
  lua,
  markdown,
  python,
  rust,
  typescript,
  viml,
  yaml,
}
