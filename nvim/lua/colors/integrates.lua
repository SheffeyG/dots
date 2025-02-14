return function(Group, c, g, s)
    -- gitsigns
    Group.new("GitSignsAdd", c.green)
    Group.new("GitSignsChange", c.yellow)
    Group.new("GitSignsDelete", c.red)

    -- neogit
    Group.new("NeogitHunkHeaderHighlight", c.black, c.blue, s.bold)
    Group.link("NeogitHunkHeaderCursor", g.NeogitHunkHeaderHighlight)
    Group.new("NeogitDiffHeaderHighlight", c.red, c.grey_light, s.bold)
    Group.link("NeogitDiffHeaderCursor", g.NeogitDiffHeaderHighlight)
    Group.new("NeogitDiffAddCursor", c.green, c.green_bg:light(), s.bold)
    Group.new("NeogitDiffDeleteCursor", c.red, c.red_bg:light(), s.bold)

    -- snacks.indent
    Group.new("SnacksIndent", c.grey)
    Group.new("SnacksIndentScope", c.grey_light)

    -- snacks.picker
    Group.new("SnacksPickerInputTitle", c.black_light, c.red)
    Group.new("SnacksPickerPreviewTitle", c.black_light, c.blue)

end
