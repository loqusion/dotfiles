---@module 'lazy'

---@type LazySpec[]
return {
  {
    "mason-org/mason.nvim",
    opts = {
      PATH = "append",
      ensure_installed = {
        "selene",
        "stylua",
        "luacheck",
        "shellcheck",
        "shfmt",
        "flake8",
        "actionlint",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "someone-stole-my-name/yaml-companion.nvim",
    },
    ---@class PluginLspOpts
    opts = {
      diagnostics = {
        virtual_text = {
          prefix = "icons",
        },
      },
      inlay_hints = { enabled = false },
      codelens = { enabled = false },
      document_highlight = { enabled = true },
      ---@class lspconfig.options
      servers = {
        ["*"] = {
          capabilities = {
            -- workaround for performance issue
            -- see https://github.com/neovim/neovim/issues/23291#issuecomment-1686709265
            workspace = { didChangeWatchedFiles = { dynamicRegistration = false } },
          },
        },
        cssls = {
          settings = {
            css = {
              lint = {
                unknownAtRules = "ignore",
              },
            },
          },
        },
        dockerls = {},
        html = {},
        marksman = {},
        svelte = {},
        teal_ls = {},
        vimls = {},
        yamlls = {},
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      -- log_level = vim.log.levels.DEBUG,
      formatters_by_ft = {
        ["_"] = { "trim_whitespace", "trim_newlines" },
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        -- lua = { "selene", "luacheck" },
      },
      linters = {
        luacheck = {
          condition = function(ctx)
            return #vim.fs.find({ "luacheckrc" }, { path = ctx.filename, upward = true }) > 0
          end,
        },
        selene = {
          condition = function(ctx)
            return #vim.fs.find({ "selene.toml" }, { path = ctx.filename, upward = true }) > 0
          end,
        },
      },
    },
  },

  {
    "nvimtools/none-ls.nvim",
    enabled = false,
    opts = function(_, opts)
      local nls = require("null-ls")
      vim.list_extend(opts.sources, {
        nls.builtins.diagnostics.selene.with({
          condition = function(utils)
            return utils.root_has_file({ "selene.toml" })
          end,
        }),
        nls.builtins.diagnostics.luacheck.with({
          condition = function(utils)
            return utils.root_has_file({ "luacheckrc" })
          end,
        }),
      })
    end,
  },

  -- preview LSP definition
  {
    "rmagatti/goto-preview",
    -- stylua: ignore
    keys = {
      { "<leader>cp", function() require("goto-preview").goto_preview_definition({}) end,     desc = "Preview Definition" },
      -- { "???", function() require("goto-preview").goto_preview_implementation({}) end, desc = "Preview Implementation" },
      { "<leader>cP",  function() require("goto-preview").close_all_win() end,                 desc = "Preview: Close windows" },
    },
    opts = {
      -- above nvim-scrollbar (30) and treesitter-context (20), below noice hover (45)
      -- nested previews count up from here (+1 each)
      zindex = 40,
      post_open_hook = function(buf, win)
        -- remember the non-preview window this stack was opened from
        local prev = vim.fn.win_getid(vim.fn.winnr("#"))
        vim.w[win].preview_origin = prev ~= 0 and (vim.w[prev].preview_origin or prev) or nil

        -- mappings are buffer-local, so outside a preview window they fall back to the builtin key
        local function in_preview()
          return vim.w["is-goto-preview-window"] == 1
        end

        vim.keymap.set("n", "q", function()
          if not in_preview() then
            return vim.api.nvim_feedkeys("q", "n", false)
          end
          vim.api.nvim_win_close(0, true)
        end, { buffer = buf, desc = "Close preview" })

        vim.keymap.set("n", "Q", function()
          if not in_preview() then
            return vim.api.nvim_feedkeys("Q", "n", false)
          end
          local origin = vim.w.preview_origin
          require("goto-preview").close_all_win()
          if origin and vim.api.nvim_win_is_valid(origin) then
            vim.api.nvim_set_current_win(origin)
          end
        end, { buffer = buf, desc = "Close all previews" })

        vim.keymap.set("n", "<CR>", function()
          if not in_preview() then
            return vim.api.nvim_feedkeys(vim.keycode("<CR>"), "n", false)
          end
          local origin = vim.w.preview_origin
          if not (origin and vim.api.nvim_win_is_valid(origin)) then
            return
          end
          local pos = vim.api.nvim_win_get_cursor(0)
          vim.bo[buf].bufhidden = "" -- goto-preview sets "wipe"; undo it before the float closes
          vim.bo[buf].buflisted = true -- vim.uri_to_bufnr() creates unlisted buffers
          require("goto-preview").close_all_win()
          vim.api.nvim_set_current_win(origin)
          vim.cmd("normal! m'")
          vim.api.nvim_win_set_buf(origin, buf)
          vim.api.nvim_win_set_cursor(origin, pos)
        end, { buffer = buf, desc = "Open preview in window" })

        -- post_close_hook also fires on BufLeave, so clean up on this window's close instead
        vim.api.nvim_create_autocmd("WinClosed", {
          pattern = tostring(win),
          once = true,
          callback = vim.schedule_wrap(function()
            if not vim.api.nvim_buf_is_valid(buf) then
              return
            end
            for _, w in ipairs(vim.fn.win_findbuf(buf)) do
              if vim.w[w]["is-goto-preview-window"] == 1 then
                return -- still shown in another preview
              end
            end
            pcall(vim.keymap.del, "n", "q", { buffer = buf })
            pcall(vim.keymap.del, "n", "Q", { buffer = buf })
            pcall(vim.keymap.del, "n", "<CR>", { buffer = buf })
          end),
        })
      end,
    },
  },
}
