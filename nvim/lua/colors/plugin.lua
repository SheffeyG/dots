return function(Group, c, g, s)
    -- neogit
    Group.new("NeogitDiffHeader", c.yellow, c.yellow_bg, s.bold)
    Group.link("NeogitDiffHeaderCursor", g.NeogitDiffHeader)
    Group.new("NeogitDiffAddCursor", c.green, c.green_bg:light())
    Group.new("NeogitDiffDeleteCursor", c.red, c.red_bg:light())

    -- diffview
    Group.link("DiffviewDiffDelete", g.Comment)

    -- snacks
    Group.link("SnacksInputTitle", g.FloatTitle)
    Group.link("SnacksWinBar", g.WinBar)
    Group.link("SnacksWinBarNC", g.WinBarNC)

    -- snacks.indent
    Group.new("SnacksIndent", c.grey)
    Group.new("SnacksIndentScope", c.grey_light)

    -- snacks.picker
    Group.new("SnacksPickerInputTitle", c.black_light, c.red)
    Group.new("SnacksPickerPreviewTitle", c.black_light, c.blue)

    -- snacks.picker.explorer
    Group.new("SnacksPickerGitStatusStaged", c.green)
    Group.new("SnacksPickerGitStatusAdded", c.cyan)
    Group.new("SnacksPickerGitStatusModified", c.yellow)
    Group.new("SnacksPickerGitStatusUnmerged", c.red)
    Group.new("SnacksPickerGitStatusDeleted", c.crimson)
    Group.new("SnacksPickerGitStatusUntracked", c.orange)
    Group.new("SnacksPickerGitStatusRenamed", c.blue)

    -- which-key
    Group.link("WhichkeyNormal", g.NormalDark)
end
