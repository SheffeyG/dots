return function(Group, c, g, s)
    -- window
    Group.new("Normal", c.white, c.black)
    Group.link("NormalFloat", g.Normal)
    Group.new("FloatTitle", c.white, c.grey)
    Group.new("FloatBorder", c.blue, g.Normal, s.bold)

    -- custom
    Group.new("NormalDark", c.white, c.black_dark)
    Group.new("NormalLight", c.white, c.black_light)

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
    Group.link("TooLong", g.Normal)
    Group.new("LineNr", c.grey_light)
    Group.new("CursorLineNr", c.white_dark)

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

    -- special
    Group.new("Directory", c.blue)
    Group.new("Folded", c.grey_light, c.black_light)
    Group.new("WinSeparator", c.grey)
    Group.new("Search", c.yellow, c.yellow_bg, s.bold)
    Group.link("IncSearch", g.Search)
    Group.new("Substitute", c.blue, c.black_bg, s.bold)
    Group.new("MatchWord", c.white, c.grey)
    Group.link("MatchParen", g.MatchWord)

    -- Group.new("SignColumn", c.red)
    -- Group.new("ColorColumn", nil, c.black_light)
    -- Group.new("Macro", c.red)
    -- Group.new("SpecialKey", c.grey_light)
end
