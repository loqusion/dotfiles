---@param opts overseer.SearchParams
---@return string | nil
local function get_flake_nix_file(opts)
  return vim.fs.find("flake.nix", { upward = true, type = "file", path = opts.dir })[1]
end

---@type overseer.TemplateDefinition
return {
  name = "typix",
  desc = "Run `typst watch` and open PDF",
  builder = function()
    vim.notify("now")

    ---@type overseer.TaskDefinition
    return {
      cmd = "nix run .#watch",
      components = {
        "unique",
        -- {
        --   "dependencies",
        --   task_names = {
        --     { "shell", cmd = "xdg-open cover.pdf" },
        --   },
        --   sequential = false,
        -- },
      },
    }
  end,
  priority = 10,
  condition = {
    filetype = "typst",
    callback = function(search)
      return get_flake_nix_file(search) ~= nil
    end,
  },
}
