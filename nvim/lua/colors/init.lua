local colorscheme = "onedark"

local colorbuddy = require("colorbuddy")
colorbuddy.colorscheme(colorscheme)

local Color = colorbuddy.Color
local Group = colorbuddy.Group

local c = colorbuddy.colors
local g = colorbuddy.groups
local s = colorbuddy.styles

require("colors." .. colorscheme)(Color)

require("colors.neovim")(Group, c, g, s)
require("colors.syntax")(Group, c, g, s)
require("colors.plugin")(Group, c, g, s)
