---@class PaletteModule
---@field mod fun(): table
---@field resolved table<string, string>

local incline1 = "#FC56B1"

---@type table<string, PaletteModule>
local modules = {
  catppuccin = {
    mod = function()
      return require("catppuccin.palettes").get_palette()
    end,
    resolved = {
      error = "red",
      warning = "yellow",
      info = "sapphire",
      hint = "teal",
      search = "peach",
      misc = "mauve",
      incline0 = "base",
      incline1 = incline1,
    },
  },
  tokyonight = {
    mod = function()
      return require("tokyonight.colors")
    end,
    resolved = {
      search = "orange",
      misc = "purple",
      incline0 = "black",
      incline1 = incline1,
    },
  },
}

local Module = {}

local function get_base_colorscheme(colorscheme)
  if string.match(colorscheme, "^catppuccin") then
    return "catppuccin"
  elseif string.match(colorscheme, "^tokyonight") then
    return "tokyonight"
  end
end

function Module.new(colorscheme)
  local base_colorscheme = get_base_colorscheme(colorscheme)
  if not base_colorscheme then
    return nil
  end

  local self = setmetatable(
    vim.tbl_deep_extend("force", {
      base_colorscheme = base_colorscheme,
      resolved = {},
    }, modules[base_colorscheme]),
    { __index = Module }
  )

  return self
end

function Module:color(colorname)
  colorname = self.resolved[colorname] or colorname
  if string.match(colorname, "^#%w%w%w%w%w%w") then
    return colorname
  end
  return self.mod()[colorname]
end

local M = setmetatable({}, {
  __index = function(_, key)
    local colorscheme = vim.g.colors_name
    local mod = Module.new(colorscheme)
    if not mod then
      vim.notify_once(
        ("Palette: colorscheme not supported: %s -- add support in "):format(colorscheme),
        vim.log.levels.WARN
      )
      return nil
    end

    return mod:color(key)
  end,
})

---@cast M table<string, string>
return M
