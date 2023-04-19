local prefer = {
  resession = false,
}

local Utils = require("utils")

local function save_dirsession(opts)
  opts = vim.tbl_deep_extend("force", opts or {}, { notify = false })
  require("resession").save(require("lazyvim.util").get_root(), opts)
end

local function create_save_on_close_autocmd()
  vim.api.nvim_create_autocmd("VimLeavePre", {
    group = Utils.augroup("resession_save_on_close"),
    callback = function()
      save_dirsession()
    end,
  })
end

local _save_on_close = vim.fn.argc() <= 0
local function toggle_save_on_close(force)
  _save_on_close = vim.F.if_nil(force, not _save_on_close)
  if _save_on_close then
    create_save_on_close_autocmd()
  else
    vim.api.nvim_del_augroup_by_id(Utils.augroup("resession_save_on_close"))
  end
end

return {
  { "folke/persistence.nvim", enabled = not prefer.resession },

  -- session management
  {
    "stevearc/resession.nvim",
    enabled = prefer.resession,
    dependencies = {
      "stevearc/three.nvim",
      "klen/nvim-config-local",
    },
    event = "VeryLazy",
    -- stylua: ignore
    keys = {
      { "<leader>qs", save_dirsession, desc = "Session Save" },
      { "<leader>qr", function() require("resession").load() end, desc = "Session Restore" },
    ---@diagnostic disable-next-line: missing-parameter
      { "<leader>qd", function() require("resession").delete() end, desc = "Session Delete" },
      { "<leader>qS", toggle_save_on_close, desc = "Session Stop", },
      {
        "ZZ",
        function()
          require("resession").save("__quicksave__", { notify = false })
          vim.cmd("wa")
          vim.cmd("qa")
        end,
        desc = "Quit all (Quicksave)",
      },
    },
    opts = {
      autosave = {
        enabled = false,
        notify = false,
      },
      tab_buf_filter = function(_, buffer)
        local lutil = require("lazyvim.util")
        return vim.startswith(vim.api.nvim_buf_get_name(buffer), lutil.get_root())
      end,
      extensions = { config_local = {}, three = {}, quickfix = {} },
    },
    config = function(_, opts)
      local resession = require("resession")
      local visible_buffers = {}

      resession.setup(vim.tbl_deep_extend("force", opts, {
        buf_filter = function(buffer)
          if not require("resession").default_buf_filter(buffer) then
            return false
          end
          return visible_buffers[buffer] or require("three").is_buffer_in_any_tab(buffer)
        end,
      }))

      resession.add_hook("pre_save", function()
        visible_buffers = {}
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          if vim.api.nvim_win_is_valid(win) then
            visible_buffers[vim.api.nvim_win_get_buf(win)] = win
          end
        end
      end)

      if vim.tbl_contains(resession.list(), "__quicksave__") then
        vim.defer_fn(function()
          resession.load("__quicksave__", { attach = false })
          local ok, err = pcall(resession.delete, "__quicksave__")
          if not ok then
            vim.notify(string.format("Error deleting quicksave session: %s", err), vim.log.levels.WARN)
          end
        end, 50)
      end

      if _save_on_close then
        create_save_on_close_autocmd()
      end
    end,
  },
}
