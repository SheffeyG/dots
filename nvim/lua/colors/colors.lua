-- stylua: ignore
local colors = {
    _red     = { base = "#bf616a", light = "#d06f79", dark = "#a54e56" },
    _orange  = { base = "#d08770", light = "#d89079", dark = "#b46950" },
    _green   = { base = "#a3be8c", light = "#b1d196", dark = "#8aa872" },
    _yellow  = { base = "#ebcb8b", light = "#f0d399", dark = "#d9b263" },
    _magenta = { base = "#b48ead", light = "#c895bf", dark = "#9d7495" },
    _blue    = { base = "#81a1c1", light = "#5e81ac", dark = "#668aab" },
    _black   = { base = "#3b4252", light = "#434c5e", dark = "#2e3440" },
    _cyan    = { base = "#8fbcbb", light = "#88c0d0", dark = "#69a7ba" },
    _white   = { base = "#e5e9f0", light = "#eceff4", dark = "#d8dee9" },
    _gray    = { base = "#4c566a", light = "#667084", dark = "#2b303b" },
}

-- Aliases
colors.fg = colors._white.base
colors.bg = colors._black.base

-- Base46
-- vim.g.terminal_color_0 = colors.black.dark
-- vim.g.terminal_color_1 = colors.red.base
-- vim.g.terminal_color_2 = colors.green.base
-- vim.g.terminal_color_3 = colors.yellow.base
-- vim.g.terminal_color_4 = colors.blue.bright
-- vim.g.terminal_color_5 = colors.magenta.base
-- vim.g.terminal_color_6 = colors.cyan.base
-- vim.g.terminal_color_7 = colors.white.base
-- vim.g.terminal_color_8 = colors.black.base
-- vim.g.terminal_color_9 = colors.red.bright
-- vim.g.terminal_color_10 = colors.green.bright
-- vim.g.terminal_color_11 = colors.yellow.bright
-- vim.g.terminal_color_12 = colors.cyan.bright
-- vim.g.terminal_color_13 = colors.magenta.bright
-- vim.g.terminal_color_14 = colors.cyan.bright
-- vim.g.terminal_color_15 = colors.white.dim

local h = require("colors.highlight")

local test = {
    Normal = { fg = colors.bg, bg = colors.bg }
}

h.apply(test)
