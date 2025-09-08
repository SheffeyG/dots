---@see snacks.util.blend
---@param fg string foreground color
---@param bg string background color
---@param alpha number number between 0 and 1. 0 results in bg, 1 results in fg
local mix = function(fg, bg, alpha)
    local fg_rgb = {
        tonumber(fg:sub(2, 3), 16),
        tonumber(fg:sub(4, 5), 16),
        tonumber(fg:sub(6, 7), 16),
    }
    local bg_rgb = {
        tonumber(bg:sub(2, 3), 16),
        tonumber(bg:sub(4, 5), 16),
        tonumber(bg:sub(6, 7), 16),
    }
    local blend = function(i)
        local ret = (alpha * fg_rgb[i] + ((1 - alpha) * bg_rgb[i]))
        return math.floor(math.min(math.max(0, ret), 255) + 0.5)
    end
    return string.format("#%02x%02x%02x", blend(1), blend(2), blend(3))
end

-- stylua: ignore
local colors = {
    -- onedark color scheme
    black_dark  = "#1b1f27",
    black       = "#1e222a",
    black_light = "#252931",
    black_bar   = "#2c323c",
    grey_dark   = "#31353d",
    grey        = "#353b45",
    grey_bar    = "#3E4452",
    grey_light  = "#565c64",
    white_dark  = "#979aa1",
    white       = "#abb2bf",
    white_light = "#c8ccd4",

    crimson     = "#d7424d",
    red         = "#e06c75",
    orange      = "#d19a66",
    yellow      = "#e7c787",
    green       = "#98c379",
    cyan        = "#56b6c2",
    blue        = "#61afef",
    purple      = "#c678dd",
    brown       = "#be5046",
}

local M = {}

---@alias Highlights table<string, vim.api.keyset.highlight>
---@type table<string, Highlights>
M.highlight = {}

-- stylua: ignore
M.highlight.core = {
    -- window
    Normal      = { fg = colors.white, bg = colors.black },
    NormalDark  = { fg = colors.white, bg = colors.black_dark },  -- custom
    NormalLight = { fg = colors.white, bg = colors.black_light }, -- custom
    NormalFloat = { link = "Normal" },
    FloatTitle  = { fg = colors.blue, bg = colors.grey_dark, bold = true },
    FloatBorder = { fg = colors.blue, bg = colors.bg },

    -- statusline
    ModeNormal   = { fg = colors.grey, bg = colors.blue, bold = true },
    ModeCommand  = { fg = colors.grey, bg = colors.yellow, bold = true },
    ModeInsert   = { fg = colors.grey, bg = colors.green, bold = true },
    ModeVisual   = { fg = colors.grey, bg = colors.purple, bold = true },
    ModeTerminal = { fg = colors.grey, bg = colors.cyan, bold = true },
    ModeReplace  = { fg = colors.grey, bg = colors.red, bold = true },

    BarGrey      = { bg = colors.grey_bar },
    BarBlack     = { bg = colors.black_bar },
    BarTab       = { fg = colors.grey, bg = colors.blue, bold = true },
    BarTabDim    = { fg = colors.white_dark, bg = colors.grey, bold = true },

    TextBlue   = { fg = colors.blue },
    TextGreen  = { fg = colors.green },
    TextPurple = { fg = colors.purple },
    TextCyan   = { fg = colors.cyan },
    TextRed    = { fg = colors.red },
    TextYellow = { fg = colors.yellow },

    -- menu
    Pmenu      = { bg = colors.grey_dark },
    PmenuSel   = { bg = mix(colors.blue, colors.black, 0.3) },
    WildMenu   = { link = "PmenuSel" },
    PmenuSbar  = { bg = colors.grey_light }, -- menu sidebar
    PmenuThumb = { bg = colors.grey_light }, -- menu sidebar

    -- lines
    Cursor       = { fg = colors.black, bg = colors.white },
    WinSeparator = { fg = colors.grey },
    Folded       = { fg = colors.grey_light, bg = colors.grey_dark },
    Visual       = { bg = colors.grey_dark },
    VisualNOS    = { fg = colors.red }, -- Non-Owning Selection
    -- A underline workaround https://github.com/neovim/neovim/issues/9800
    CursorLine   = { bg = colors.black_light, nocombine = true },
    CursorColumn = { bg = colors.grey, nocombine = true },
    QuickFixLine = { bg = colors.grey, nocombine = true },
    ColorColumn  = { bg = colors.black_dark, nocombine = true }, -- "too long" sign column
    LineNr       = { fg = colors.grey_light }, -- line number
    CursorLineNr = { fg = colors.white_dark }, -- current line number
    WinBar       = { fg = colors.blue, bg = colors.black_light, bold = true },
    WinBarNC     = { fg = colors.blue, bg = colors.black_light },
    StatusLine   = { fg = colors.white, bg = colors.black_bar },
    StatusLineNC = { fg = colors.white, bg = colors.black_dark },

    -- text
    Title      = { fg = colors.blue },
    Question   = { fg = colors.blue },
    NonText    = { fg = colors.grey_light },
    Error      = { fg = colors.red },
    ErrorMsg   = { link = "Error" },
    Exception  = { link = "Error" },
    WarningMsg = { fg = colors.yellow },
    ModeMsg    = { fg = colors.green },
    MoreMsg    = { fg = colors.green },
    Whitespace = { fg = colors.grey_dark }, -- listchars.tab

    -- diagnostic
    DiagnosticInfo   = { fg = colors.blue },
    DiagnosticWarn   = { fg = colors.yellow },
    DiagnosticOk     = { fg = colors.green },
    DiagnosticHint   = { fg = colors.purple },
    DiagnosticError  = { fg = colors.red },

    -- LSP
    LspReferenceText = { bg = mix(colors.cyan, colors.black, 0.05), nocombine = true }, -- snacks.words

    -- search & replace
    Search     = { fg = colors.yellow, bg = mix(colors.yellow, colors.black, 0.2) },
    CurSearch  = { fg = colors.yellow, bg = mix(colors.yellow, colors.black, 0.3), bold = true },
    IncSearch  = { link = "Search" }, -- instant search preview
    Substitute = { fg = colors.cyan, bg = mix(colors.cyan, colors.black, 0.2), bold = true },
    MatchWord  = { fg = colors.white, bg = colors.grey },
    MatchParen = { link = "MatchWord" },

    -- git
    Added   = { fg = colors.green },
    Removed = { fg = colors.red },
    Changed = { fg = colors.yellow },

    -- diff
    DiffDelete       = { bg = mix(colors.red, colors.black, 0.2) },
    DiffAdd          = { bg = mix(colors.green, colors.black, 0.2) },
    DiffChange       = { bg = mix(colors.yellow, colors.black, 0.2) },
    DiffText         = { bg = mix(colors.orange, colors.black, 0.2), bold = true },
    DiffChangeDelete = { link = "DiffDelete" },
    -- DiffDelete       = { fg = colors.grey_dark }, -- for diffchar '/'

    -- builtin syntax
    Comment      = { fg = colors.grey_light },
    Boolean      = { fg = colors.orange },
    Character    = { fg = colors.red },
    Conditional  = { fg = colors.purple },
    Constant     = { fg = colors.orange },
    Define       = { fg = colors.purple },
    Delimiter    = { fg = colors.brown },
    Directory    = { fg = colors.blue },
    Float        = { fg = colors.orange },
    Variable     = { fg = colors.white },
    Function     = { fg = colors.blue },
    Identifier   = { fg = colors.red },
    Include      = { fg = colors.blue },
    Keyword      = { fg = colors.purple },
    Label        = { fg = colors.yellow },
    Number       = { fg = colors.orange },
    Operator     = { fg = colors.white },
    PreProc      = { fg = colors.yellow },
    Repeat       = { fg = colors.yellow },
    Special      = { fg = colors.cyan },
    SpecialChar  = { fg = colors.brown },
    Statement    = { fg = colors.red },
    StorageClass = { fg = colors.yellow },
    String       = { fg = colors.green },
    Structure    = { fg = colors.purple },
    Tag          = { fg = colors.yellow },
    Type         = { fg = colors.yellow },
    Typedef      = { fg = colors.yellow },
    Todo         = { fg = colors.yellow, bg = colors.grey },
}

M.highlight.syntax = {
    -- treesitter
    ["@module"] = { fg = colors.red },
    ["@module.builtin"] = { fg = colors.red },

    ["@constant"] = { fg = colors.orange },
    ["@constant.builtin"] = { fg = colors.orange },
    ["@constant.macro"] = { fg = colors.red },

    ["@string"] = { fg = colors.green },
    ["@string.regex"] = { fg = colors.cyan },
    ["@string.regexp"] = { fg = colors.cyan },
    ["@string.escape"] = { fg = colors.cyan },

    ["@character"] = { fg = colors.red },
    ["@character.special"] = { fg = colors.cyan },

    ["@number"] = { fg = colors.orange },
    ["@number.float"] = { fg = colors.orange },

    ["@variable"] = { fg = colors.white }, -- common variable

    ["@keyword"] = { fg = colors.purple },
    ["@keyword.exception"] = { fg = colors.red },
    ["@keyword.function"] = { fg = colors.purple },
    ["@keyword.return"] = { fg = colors.purple },
    ["@keyword.operator"] = { fg = colors.purple },
    ["@keyword.conditional"] = { fg = colors.purple },
    ["@keyword.conditional.ternary"] = { fg = colors.purple },
    ["@keyword.repeat"] = { fg = colors.yellow },
    ["@keyword.storage"] = { fg = colors.yellow },
    ["@keyword.directive.define"] = { fg = colors.purple },
    ["@keyword.directive"] = { fg = colors.yellow },

    ["@function"] = { fg = colors.blue },
    ["@function.builtin"] = { fg = colors.blue },
    ["@function.macro"] = { fg = colors.red },
    ["@function.call"] = { fg = colors.blue },
    ["@function.method"] = { fg = colors.blue },
    ["@function.method.call"] = { fg = colors.blue },
    ["@constructor"] = { fg = colors.cyan },

    ["@punctuation.bracket"] = { fg = colors.brown },
    ["@punctuation.delimiter"] = { fg = colors.brown },

    ["@tag"] = { fg = colors.yellow },
    ["@tag.attribute"] = { fg = colors.red },
    ["@tag.delimiter"] = { fg = colors.brown },

    ["@text"] = { fg = colors.white },
    ["@text.emphasis"] = { fg = colors.orange },
    ["@text.strike"] = { fg = colors.brown, strikethrough = true },

    ["@type"] = { fg = colors.yellow },
    ["@type.builtin"] = { fg = colors.yellow },

    ["@markup.heading"] = { fg = colors.blue },
    ["@markup.raw"] = { fg = colors.orange },
    ["@markup.link"] = { fg = colors.red },
    ["@markup.link.url"] = { fg = colors.orange, underline = true },
    ["@markup.link.label"] = { fg = colors.cyan },
    ["@markup.list"] = { fg = colors.red },
    ["@markup.quote"] = { fg = colors.grey_light },
    ["@markup.strong"] = { bold = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.italic"] = { italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },

    ["@comment"] = { fg = colors.grey_light },
    ["@comment.todo"] = { fg = colors.grey, bg = colors.white },
    ["@comment.warning"] = { fg = colors.black_light, bg = colors.orange },
    ["@comment.note"] = { fg = colors.black, bg = colors.blue },
    ["@comment.danger"] = { fg = colors.black_light, bg = colors.red },

    ["@diff.plus"] = { fg = colors.green },
    ["@diff.minus"] = { fg = colors.red },
    ["@diff.delta"] = { fg = colors.grey },

    ["@annotation"] = { fg = colors.brown },
    ["@attribute"] = { fg = colors.yellow },
    ["@boolean"] = { fg = colors.orange },
    ["@definition"] = { fg = colors.grey_light, underline = true },
    ["@error"] = { fg = colors.red },
    ["@reference"] = { fg = colors.white },
    ["@symbol"] = { fg = colors.green },
    ["@scope"] = { bold = true },
    ["@operator"] = { fg = colors.white },
    ["@property"] = { fg = colors.red },

    -- semantic token
    ["@lsp.type.variable"] = {}, -- disable to use TS
    ["@lsp.type.type"] = { link = "@type" },
}

M.highlight.plugins = {
    -- blink
    BlinkCmpMenu = { link = "NormalFloat" },
    BlinkCmpMenuBorder = { fg = mix(colors.blue, colors.black, 0.5) },
    BlinkCmpDocBorder = { fg = mix(colors.cyan, colors.black, 0.5) },
    BlinkCmpDocSeparator = { link = "BlinkCmpDocBorder" },
    BlinkCmpSignatureHelpBorder = { link = "BlinkCmpDocBorder" },
    BlinkCmpGhostText = { fg = colors.grey_dark, bg = colors.black_dark },

    -- blink.kind
    BlinkCmpKind = { link = "Special" }, -- default
    BlinkCmpKindClass = { link = "@type" },
    BlinkCmpKindConstant = { link = "@constant" },
    BlinkCmpKindConstructor = { link = "@type" },
    BlinkCmpKindEnum = { link = "@variable.member" },
    BlinkCmpKindEnumMember = { link = "@variable.member" },
    BlinkCmpKindEvent = { link = "@constant" },
    BlinkCmpKindField = { link = "@variable.member" },
    BlinkCmpKindFile = { link = "Directory" },
    BlinkCmpKindFolder = { link = "Directory" },
    BlinkCmpKindFunction = { link = "@function" },
    BlinkCmpKindInterface = { link = "@type" },
    BlinkCmpKindKeyword = { link = "@keyword" },
    BlinkCmpKindMethod = { link = "@function.method" },
    BlinkCmpKindModule = { link = "@module" },
    BlinkCmpKindOperator = { link = "@operator" },
    BlinkCmpKindProperty = { link = "@property" },
    BlinkCmpKindReference = { link = "@parameter.reference" },
    BlinkCmpKindSnippet = { link = "@markup" },
    BlinkCmpKindStruct = { link = "@structure" },
    BlinkCmpKindText = { link = "@markup" },
    BlinkCmpKindTypeParameter = { link = "@variable.parameter" },
    BlinkCmpKindUnit = { link = "@variable.member" },
    BlinkCmpKindValue = { link = "@variable.member" },
    BlinkCmpKindVariable = { link = "@variable" },
    BlinkCmpLabelDeprecated = { link = "DiagnosticDeprecated" },
    BlinkCmpLabelDescription = { fg = colors.grey, italic = true },
    BlinkCmpLabelDetail = { fg = colors.grey },

    -- noice
    NoiceVirtualText = { fg = colors.cyan, bg = mix(colors.cyan, colors.black, 0.2) }, -- search label

    -- snacks.win
    SnacksWinBar = { link = "WinBar" },
    SnacksWinBarNC = { link = "WinBarNC" },

    -- snacks.indent
    SnacksIndent = { fg = colors.grey },
    SnacksIndentScope = { fg = colors.grey_light },

    -- snacks.input
    SnacksInputTitle = { link = "FloatTitle" },
    SnacksInputBorder = { link = "FloatBorder" },

    -- snacks.picker
    SnacksPickerInputTitle = { fg = colors.black_light, bg = colors.red },
    SnacksPickerPreviewTitle = { fg = colors.black_light, bg = colors.blue },

    -- snacks.picker.explorer
    SnacksPickerGitStatusStaged = { fg = colors.green },
    SnacksPickerGitStatusAdded = { fg = colors.cyan },
    SnacksPickerGitStatusModified = { fg = colors.yellow },
    SnacksPickerGitStatusUnmerged = { fg = colors.crimson },
    SnacksPickerGitStatusDeleted = { fg = colors.red },
    SnacksPickerGitStatusUntracked = { fg = colors.orange },
    SnacksPickerGitStatusRenamed = { fg = colors.blue },
    SnacksPickerPathHidden = { fg = colors.white_dark },

    -- which-key
    WhichkeyNormal = { link = "NormalDark" },

    -- -- neogit
    -- -- NeogitDiffHeader = { fg = colors.black, bg = colors.grey_light, bold = true },
    -- NeogitDiffHeader = { link = "NeogitDiffHeaderCursor" }, -- TODO: waiting for upsteam solution
    -- NeogitDiffHeaderCursor = { fg = colors.black, bg = mix(colors.yellow, colors.black, 0.7), bold = true },
    -- NeogitDiffHeaderHighlight = { link = "NeogitDiffHeaderCursor" },
    -- NeogitHunkHeader = { fg = colors.black, bg = colors.grey, bold = true },
    -- NeogitHunkHeaderCursor = { fg = colors.black, bg = mix(colors.blue, colors.black, 0.4), bold = true },
    -- NeogitHunkHeaderHighlight = { link = "NeogitHunkHeaderCursor" },
    -- NeogitDiffAddCursor = { fg = colors.green, bg = mix(colors.green, colors.black, 0.3) },
    -- NeogitDiffDeleteCursor = { fg = colors.red, bg = mix(colors.red, colors.black, 0.3) },
    --
    -- -- diffview
    -- DiffviewFilePanelFileName = { link = "Normal" },
    -- DiffviewDiffDeleteDim = { fg = colors.grey_dark }, -- fillchars.diff

    -- git-conflict
    -- ConflictOurs = { bg = mix(colors.blue, colors.black, 0.2) }, -- custom
    -- ConflictTheirs = { bg = mix(colors.cyan, colors.black, 0.2) }, -- custom
}

M.setup = function()
    -- reset highlights
    vim.cmd.highlight("clear")
    if vim.fn.exists("syntax_on") then vim.cmd.syntax("reset") end

    -- enable 256 true colors
    vim.o.termguicolors = true
    vim.g.colors_name = "onedark"

    ---@param highlights Highlights highlight groups
    local function apply(highlights)
        for group, opts in pairs(highlights) do
            vim.api.nvim_set_hl(0, group, opts)
        end
    end

    apply(M.highlight.core)
    apply(M.highlight.syntax)
    apply(M.highlight.plugins)
end

return M
