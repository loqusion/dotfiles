---@type table<BaseColorscheme, PaletteInfo>
local palette_info = {
  catppuccin = {
    mod = function()
      ---@diagnostic disable-next-line: return-type-mismatch
      return require("catppuccin.palettes").get_palette()
    end,
    resolved = {
      error = "red",
      warning = "yellow",
      info = "sky",
      hint = "teal",
      search = "sapphire",
      misc = "mauve",
      incline0 = "base",
      incline1 = "flamingo",
    },
    colorscheme = {
      secondary = "nightfox",
      tertiary = "gruvbox",
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
      incline1 = "#FC56B1",
    },
    colorscheme = {},
  },
}

---@class PaletteInfo
---@field mod fun(): table
---@field resolved table<string, string>
---@field colorscheme table<string, string> Alternate colorschemes used for styler.nvim; accessed through `palette.colorscheme.*`

---@alias BaseColorscheme string

local memoized = {}
local Module = {}

function Module.new(colorscheme)
  local base_colorscheme = Module._base_colorscheme(colorscheme)
  if not base_colorscheme then
    return nil
  end

  local self = setmetatable(
    ---@diagnostic disable-next-line: param-type-mismatch
    vim.tbl_deep_extend("force", {
      base_colorscheme = base_colorscheme,
      mod = function()
        return {}
      end,
      resolved = {},
      colorscheme = {},
    }, palette_info[base_colorscheme]),
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

---Given a colorscheme name, return the "base" colorscheme.
---E.g. if given "catppuccin-mocha", will return "catppuccin".
---@param colorscheme string
---@return BaseColorscheme|nil
function Module._base_colorscheme(colorscheme)
  for base, _ in pairs(palette_info) do
    if string.match(colorscheme, ("^%s"):format(base)) then
      return base
    end
  end
  return nil
end

local M = setmetatable({}, {
  __index = function(_, key)
    local colorscheme = vim.g.colors_name
    local mod = memoized[colorscheme] or Module.new(colorscheme)
    if not mod then
      vim.notify_once(
        ("Palette: colorscheme not fully supported: %s\nadd support in:\n    %s\nor add a blank module to hide this warning."):format(
          colorscheme,
          debug.getinfo(1, "S").source:sub(2)
        ),
        vim.log.levels.WARN
      )
      return { colorscheme = {} }
    end
    memoized[colorscheme] = mod

    if key == "colorscheme" then
      return mod.colorscheme
    end

    return mod:color(key)
  end,
})

return M
