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

    -- nvimtree
    -- Group.new("NvimTreeIndentMarker", c.grey)
    -- Group.new("NvimTreeFolderIcon", c.blue)
    -- Group.new("NvimTreeFolderName", c.blue, nil, s.bold)
    -- Group.new("NvimTreeEmptyFolderName", c.blue)
    -- Group.new("NvimTreeOpenedFolderName", c.blue, nil, s.bold)
    -- Group.new("NvimTreeFolderArrowOpen", c.grey_light)
    -- Group.new("NvimTreeFolderArrowClosed", c.grey_light)
    -- Group.new("NvimTreeGitDirtyIcon", c.yellow)
    -- Group.new("NvimTreeGitStagedIcon", c.green)
    -- Group.new("NvimTreeGitDeletedIcon", c.red)
    -- Group.new("NvimTreeGitNewIcon", c.orange)
    -- Group.new("NvimTreeGitRenameIcon", c.purple)
end
