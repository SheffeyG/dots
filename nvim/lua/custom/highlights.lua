---@alias Highlights table<string, vim.api.keyset.highlight>

local M = {} ---@type table<string, Highlights>

-- stylua: ignore
M.core = {
    -- window
    Normal      = { fg = colors.white, bg = colors.black },
    NormalDark  = { fg = colors.white, bg = colors.black_dark },  -- custom
    NormalLight = { fg = colors.white, bg = colors.black_light }, -- custom
    NormalFloat = { link = "Normal" },
    FloatTitle  = { fg = colors.blue, bg = colors.grey_dark, bold = true },
    FloatBorder = { fg = colors.blue, bg = colors.bg },

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
    -- diffview workaround https://github.com/neovim/neovim/issues/9800
    CursorLine   = { bg = colors.black_light, ctermfg = "white" },
    CursorColumn = { bg = colors.grey },
    QuickFixLine = { bg = colors.grey },
    ColorColumn  = { bg = colors.black_dark }, -- "too long" sign column
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

    -- diag & lsp
    DiagnosticInfo   = { fg = colors.blue },
    DiagnosticWarn   = { fg = colors.yellow },
    DiagnosticOk     = { fg = colors.green },
    DiagnosticHint   = { fg = colors.purple },
    DiagnosticError  = { fg = colors.red },
    LspReferenceText = { bg = mix(colors.cyan, colors.black, 0.05) }, -- snacks.words

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

    -- git.diff
    DiffAdd          = { bg = mix(colors.green, colors.black, 0.2) },
    DiffDelete       = { bg = mix(colors.red, colors.black, 0.2) },
    DiffChange       = { bg = mix(colors.yellow, colors.black, 0.2) },
    DiffText         = { bg = mix(colors.orange, colors.black, 0.2), bold = true },
    DiffChangeDelete = { link = "DiffDelete" },
    DiffAdded        = { fg = colors.green },
    DiffRemoved      = { fg = colors.red },
    DiffChanged      = { fg = colors.yellow },
    DiffModified     = { fg = colors.yellow },
    DiffNewFile      = { fg = colors.blue },
    DiffOldFile      = { fg = colors.yellow },

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

M.syntax = {
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

M.plugins = {
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

    -- neogit
    -- NeogitDiffHeader = { fg = colors.black, bg = colors.grey_light, bold = true },
    NeogitDiffHeader = { link = "NeogitDiffHeaderCursor" }, -- TODO: waiting for upsteam solution
    NeogitDiffHeaderCursor = { fg = colors.black, bg = mix(colors.yellow, colors.black, 0.7), bold = true },
    NeogitDiffHeaderHighlight = { link = "NeogitDiffHeaderCursor" },
    NeogitHunkHeader = { fg = colors.black, bg = colors.grey, bold = true },
    NeogitHunkHeaderCursor = { fg = colors.black, bg = mix(colors.blue, colors.black, 0.4), bold = true },
    NeogitHunkHeaderHighlight = { link = "NeogitHunkHeaderCursor" },
    NeogitDiffAddCursor = { fg = colors.green, bg = mix(colors.green, colors.black, 0.3) },
    NeogitDiffDeleteCursor = { fg = colors.red, bg = mix(colors.red, colors.black, 0.3) },

    -- diffview
    DiffviewFilePanelFileName = { link = "Normal" },
    DiffviewDiffDeleteDim = { fg = colors.grey_dark }, -- fillchars.diff

    -- git-conflict
    ConflictOurs = { bg = mix(colors.blue, colors.black, 0.2) }, -- custom
    ConflictTheirs = { bg = mix(colors.cyan, colors.black, 0.2) }, -- custom

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
}

return M
