return function(Group, c, g, s)
    -- window
    Group.new("Normal", c.white, c.black)
    Group.link("NormalFloat", g.Normal)
    Group.new("FloatTitle", c.blue, c.grey_dark)
    Group.new("FloatBorder", c.blue, g.Normal, s.bold)

    -- custom
    Group.new("NormalDark", c.white, c.black_dark)
    Group.new("NormalLight", c.white, c.black_light)
    Group.new("NormalGrey", c.grey_light, g.Normal)
    Group.new("NormalBlue", c.blue, g.Normal)
    Group.new("NormalCyan", c.cyan, g.Normal)

    -- menu
    Group.new("Pmenu", nil, c.grey_dark)
    Group.new("PmenuSbar", nil, c.grey_light)
    Group.new("PmenuSel", c.black, c.blue)
    Group.new("PmenuThumb", nil, c.grey_light)
    Group.link("WildMenu", g.PmenuSel)

    -- line
    Group.new("Cursor", c.black, c.white)
    Group.new("Visual", nil, c.grey_dark)
    Group.new("VisualNOS", c.red)
    Group.new("CursorLine", nil, c.black_light)
    Group.new("CursorColumn", nil, c.grey)
    Group.new("QuickFixLine", nil, c.grey)
    Group.new("ColorColumn", nil, c.black_dark)
    Group.new("LineNr", c.grey_light)
    Group.new("CursorLineNr", c.white_dark)
    Group.new("WinBar", c.blue, c.black_light, s.bold)
    Group.new("WinBarNC", c.blue, c.black_light)

    -- text
    Group.new("Title", c.blue)
    Group.new("Question", c.blue)
    Group.new("NonText", c.grey_light)
    Group.new("Error", c.red)
    Group.link("ErrorMsg", g.Error)
    Group.link("NvimInternalError", g.Error)
    Group.link("Exception", g.Error)
    Group.new("WarningMsg", c.yellow)
    Group.new("ModeMsg", c.green)
    Group.new("MoreMsg", c.green)
    Group.new("Conceal", nil, nil)

    -- diag
    Group.new("DiagnosticInfo", c.blue)
    Group.new("DiagnosticWarn", c.yellow)
    Group.new("DiagnosticOk", c.green)
    Group.new("DiagnosticHint", c.purple)
    Group.new("DiagnosticError", c.red)

    -- special
    Group.new("Directory", c.blue)
    Group.new("Folded", c.grey_light, c.black_light)
    Group.new("WinSeparator", c.grey)
    Group.new("Search", c.yellow, c.yellow_bg)
    Group.new("CurSearch", g.Search, g.Search, s.bold)
    Group.link("IncSearch", g.Search)
    Group.new("Substitute", c.blue, c.black_bg, s.bold)
    Group.new("MatchWord", c.white, c.grey)
    Group.link("MatchParen", g.MatchWord)

    -- git.diff
    Group.new("DiffAdd", nil, c.green_bg)
    Group.new("DiffDelete", nil, c.red_bg)
    Group.new("DiffChangeDelete", nil, c.red_bg)
    Group.new("DiffChange", nil, c.yellow_bg)
    Group.new("DiffText", nil, c.yellow_bg:light(), s.bold)
    Group.new("DiffAdded", c.green)
    Group.new("DiffRemoved", c.red)
    Group.new("DiffChanged", c.yellow)
    Group.new("DiffModified", c.yellow)
    Group.new("DiffNewFile", c.blue)
    Group.new("DiffOldFile", c.yellow)
end
