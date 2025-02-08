return function(Group, c, g, s)
    -- indentline
    Group.new("IndentLine", c.grey)
    Group.new("IndentLineCurrent", c.grey_light)

    -- nvimtree
    Group.new("NvimTreeIndentMarker", c.grey)
    Group.new("NvimTreeFolderIcon", c.blue)
    Group.new("NvimTreeFolderName", c.blue, nil, s.bold)
    Group.new("NvimTreeEmptyFolderName", c.blue)
    Group.new("NvimTreeOpenedFolderName", c.blue, nil, s.bold)
    Group.new("NvimTreeFolderArrowOpen", c.grey_light)
    Group.new("NvimTreeFolderArrowClosed", c.grey_light)
    Group.new("NvimTreeGitDirtyIcon", c.yellow)
    Group.new("NvimTreeGitStagedIcon", c.green)
    Group.new("NvimTreeGitDeletedIcon", c.red)
    Group.new("NvimTreeGitNewIcon", c.orange)
    Group.new("NvimTreeGitRenameIcon", c.purple)

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

    -- telescope
    Group.new("TelescopePromptTitle", c.grey_dark, c.red)
    Group.new("TelescopePromptBorder", c.grey_dark, c.grey_dark)
    Group.new("TelescopePromptNormal", nil, c.grey_dark)
    Group.new("TelescopePromptPrefix", c.red, c.grey_dark)
    Group.new("TelescopeResultsTitle", c.grey, c.grey)
    Group.new("TelescopeResultsBorder", c.grey, c.grey)
    Group.new("TelescopeResultsNormal", nil, c.grey)
    Group.new("TelescopeSelection", c.red, c.grey_light)
    Group.new("TelescopeMatching", c.yellow, nil, s.bold)
    Group.new("TelescopeResultsDiffAdd", c.green)
    Group.new("TelescopeResultsDiffChange", c.yellow)
    Group.new("TelescopeResultsDiffDelete", c.red)
    Group.new("TelescopePreviewTitle", c.black_light, c.blue)
    Group.new("TelescopePreviewNormal", nil, c.black_light)
    Group.new("TelescopePreviewBorder", c.black_light, c.black_light)
end
