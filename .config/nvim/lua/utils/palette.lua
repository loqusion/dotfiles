---@class PaletteInfo
---@field mod fun(): table
---@field resolved table<string, string>
---@field colorscheme? table<string, string> Alternate colorschemes used for styler.nvim; accessed through `palette.colorscheme.*`

---@alias BaseColorscheme string

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
  gruvbox = {
    mod = function()
      return require("gruvbox").palette
    end,
    resolved = {
      incline0 = "dark0_hard",
      incline1 = "bright_red",
    },
  },
  ["rose-pine"] = {
    mod = function()
      return require("rose-pine.palette")
    end,
    resolved = {
      incline0 = "surface",
      incline1 = "rose",
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
  },
}

local my_memo = {}

---@generic T
---@param f fun(...): T
---@return T
local function memoized(f, ...)
  local args = { ... }
  local key = vim.inspect(args)
  if not my_memo[key] then
    my_memo[key] = f(...)
  end
  return my_memo[key]
end

---@class PaletteModule : PaletteInfo
local Module = {}

---@param colorscheme string
---@return PaletteModule|nil
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

---@param colorname string
---@return string|nil
function Module:color(colorname)
  local colorname_or_color = self.resolved[colorname] or colorname
  if colorname_or_color == "" or string.match(colorname_or_color, "^#%w%w%w%w%w%w") then
    return colorname_or_color
  end
  return self.mod()[colorname_or_color]
end

---Given a colorscheme name, return the "base" colorscheme.
---E.g. if given "catppuccin-mocha", will return "catppuccin".
---@private
---@param colorscheme string
---@return BaseColorscheme|nil
function Module._base_colorscheme(colorscheme)
  local escape_pattern = require("utils").escape_pattern
  for base, _ in pairs(palette_info) do
    if string.match(colorscheme, ("^%s"):format(escape_pattern(base))) then
      return base
    end
  end
  return nil
end

local M = setmetatable({}, {
  __index = function(_, key)
    local colorscheme = vim.g.colors_name
    ---@type PaletteModule|nil
    local mod = memoized(Module.new, colorscheme)
    if not mod then
      vim.notify_once(
        ([[Palette for colorscheme '%s' not defined.
Add '%s' to `palette_info` in %s,
or add a blank module to hide this warning.]]):format(
          colorscheme,
          colorscheme,
          vim.fs.basename(debug.getinfo(1, "S").source:sub(2))
        ),
        vim.log.levels.WARN,
        { title = "palette.lua" }
      )
      return ({
        colorscheme = {},
        supported = false,
      })[key]
    end

    if key == "colorscheme" then
      return mod.colorscheme
    elseif key == "supported" then
      return true
    end
    return mod:color(key)
  end,
})

return M
