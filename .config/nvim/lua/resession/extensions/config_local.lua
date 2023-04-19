return {
  on_save = function()
    return {}
  end,
  on_load = function()
    local ok, config_local = pcall(require, "config-local")
    if not ok then
      return
    end
    local saved_tabpage = vim.api.nvim_get_current_tabpage()
    for _, tabpage in ipairs(vim.api.nvim_list_tabpages()) do
      vim.api.nvim_set_current_tabpage(tabpage)
      config_local.source()
    end
    vim.api.nvim_set_current_tabpage(saved_tabpage)
  end,
}
