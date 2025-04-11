-- stylua: ignore
local colors = {
    _black   = { base = "#3b4252", light = "#434c5e", dark = "#2e3440" },
    _grey    = { base = "#4c566a", light = "#667084", dark = "#2b303b" },
    _white   = { base = "#e5e9f0", light = "#eceff4", dark = "#d8dee9" },
    _red     = { base = "#bf616a", light = "#d06f79", dark = "#a54e56" },
    _orange  = { base = "#d08770", light = "#d89079", dark = "#b46950" },
    _yellow  = { base = "#ebcb8b", light = "#f0d399", dark = "#d9b263" },
    _green   = { base = "#a3be8c", light = "#b1d196", dark = "#8aa872" },
    _cyan    = { base = "#8fbcbb", light = "#88c0d0", dark = "#69a7ba" },
    _blue    = { base = "#81a1c1", light = "#5e81ac", dark = "#668aab" },
    _magenta = { base = "#b48ead", light = "#c895bf", dark = "#9d7495" },
}

-- Aliases
colors.fg = colors._white.base
colors.bg = colors._black.base
colors.black = colors._black.base
colors.grey = colors._grey.base
colors.white = colors._white.base
colors.red = colors._red.base
colors.orange = colors._orange.base
colors.yellow = colors._yellow.base
colors.green = colors._green.base
colors.cyan = colors._cyan.base
colors.blue = colors._blue.base
colors.purple = colors._magenta.base

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

local M = {}

M.core = {
    -- window
    Normal = { fg = colors.fg, bg = colors.bg },
    NormalFloat = { link = "Normal" },
    FloatTitle = { fg = colors.blue, bg = colors.grey_dark, bold = true },
    FloatBorder = { fg = colors.blue, bg = colors.bg },

    -- custom
    NormalDark = { fg = colors.white, bg = colors.black_dark },
    NormalLight = { fg = colors.white, bg = colors.black_light },
    NormalGrey = { fg = colors.grey_light, bg = colors.Normal },
    NormalBlue = { fg = colors.blue, bg = colors.Normal },
    NormalCyan = { fg = colors.cyan, bg = colors.Normal },

    -- menu
    -- Pmenu = {nil, c.grey_dark)
    -- PmenuSbar = {nil, c.grey_light)
    -- PmenuSel = {c.black, c.blue)
    -- PmenuThumb = {nil, c.grey_light)
    -- WildMenu = {g.PmenuSel)

    -- lines
    Cursor = { fg = colors.black, bg = colors.white },
    Visual = { nil, colors.grey_dark },
    VisualNOS = { colors.red },
    CursorLine = { nil, colors.black_light },
    CursorColumn = { nil, colors.grey },
    QuickFixLine = { nil, colors.grey },
    ColorColumn = { nil, colors.black_dark },
    LineNr = { colors.grey_light },
    CursorLineNr = { colors.white_dark },
    WinBar = { colors.blue, colors.black_light, s.bold },
    WinBarNC = { colors.blue, colors.black_light },
}

require("colors.highlight").apply(M.core)
