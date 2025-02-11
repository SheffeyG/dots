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
    -- Group.new("SnacksPickerInput", nil, c.black)
    Group.new("SnacksPickerInputTitle", c.black_light, c.red)
    -- Group.new("SnacksPickerInputBorder", g.FloatBorder, g.SnacksPickerInput)
    -- Group.new("SnacksPickerList", nil, c.black_light)
    Group.new("SnacksPickerListBorder", c.black)
    Group.new("SnacksPickerPreview", nil, c.black_dark)
    Group.new("SnacksPickerPreviewTitle", c.black_light, c.blue)
    Group.new("SnacksPickerPreviewBorder", g.FloatBorder, g.SnacksPickerPreview)
end
