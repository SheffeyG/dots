return function(Group, c, g, s)
    -- indentblank
    Group.new("IndentLine", c.grey)
    Group.new("IndentLineCurrent", c.white_dark)

    -- nvimtree
    Group.new("NvimTreeIndentMarker", c.grey)
    Group.new("NvimTreeFolderIcon", c.blue)
    Group.new("NvimTreeFolderName", c.blue, nil, s.bold)
    Group.new("NvimTreeEmptyFolderName", c.blue)
    Group.new("NvimTreeOpenedFolderName", c.blue, nil, s.bold)
    Group.new("NvimTreeFolderArrowOpen", c.white_dark)
    Group.new("NvimTreeFolderArrowClosed", c.white_dark)

    -- diffview
    Group.new("DiffviewDiffAdd", nil, c.green_bg)
    Group.new("DiffviewDiffText", nil, c.green_bg:light())
    Group.new("DiffviewDiffChange", nil, c.green_bg)
    Group.new("DiffviewDiffAddAsDelete", nil, c.red_bg)
    Group.new("DiffviewDiffDeleteDim", nil, c.red_bg)
    Group.new("DiffviewDiffDelete", c.grey)

    -- gitsigns
    Group.new("GitSignsAdd", c.green)
    Group.new("GitSignsChange", c.yellow)
    Group.new("GitSignsDelete", c.red)
end
