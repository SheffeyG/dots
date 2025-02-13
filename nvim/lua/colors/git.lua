return function(Group, c, _, s)
    Group.new("diffOldFile", c.yellow)
    Group.new("diffNewFile", c.blue)

    Group.new("DiffAdd", nil, c.green_bg)
    Group.new("DiffDelete", nil, c.red_bg)
    Group.new("DiffChangeDelete", nil, c.red_bg)
    Group.new("DiffChange", nil, c.yellow_bg)
    Group.new("DiffText", nil, c.yellow_bg:light(), s.bold)
    Group.new("DiffAdded", c.green)
    Group.new("DiffRemoved", c.red)
    Group.new("DiffChanged", c.yellow)
    Group.new("DiffModified", c.yellow)

    Group.new("gitcommitOverflow", c.base08)
    Group.new("gitcommitSummary", c.base0B)
    Group.new("gitcommitComment", c.base03)
    Group.new("gitcommitUntracked", c.base03)
    Group.new("gitcommitDiscarded", c.base03)
    Group.new("gitcommitSelected", c.base03)
    Group.new("gitcommitHeader", c.base0E)
    Group.new("gitcommitSelectedType", c.base0D)
    Group.new("gitcommitUnmergedType", c.base0D)
    Group.new("gitcommitDiscardedType", c.base0D)
    Group.new("gitcommitBranch", c.base09, nil, s.bold)
    Group.new("gitcommitUntrackedFile", c.base0A)
    Group.new("gitcommitUnmergedFile", c.base08, nil, s.bold)
    Group.new("gitcommitDiscardedFile", c.base08, nil, s.bold)
    Group.new("gitcommitSelectedFile", c.base0B, nil, s.bold)
end
