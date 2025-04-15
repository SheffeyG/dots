local M = {}

M.theme = {
    normal = {
        a = { fg = colors.grey, bg = colors.blue, gui = "bold" },
        b = { fg = colors.white, bg = colors.grey_bar },
        c = { fg = colors.white, bg = colors.black_bar },
    },
    command = { a = { fg = colors.grey, bg = colors.yellow, gui = "bold" } },
    insert = { a = { fg = colors.grey, bg = colors.green, gui = "bold" } },
    visual = { a = { fg = colors.grey, bg = colors.purple, gui = "bold" } },
    terminal = { a = { fg = colors.grey, bg = colors.cyan, gui = "bold" } },
    replace = { a = { fg = colors.grey, bg = colors.red, gui = "bold" } },
    inactive = {
        a = { fg = colors.white_dark, bg = colors.grey },
        b = { fg = colors.white_dark, bg = colors.grey },
        c = { fg = colors.white_dark, bg = colors.gray },
    },
}

M.text_blue = { fg = colors.blue }
M.text_green = { fg = colors.green }
M.text_purple = { fg = colors.purple }
M.text_cyan = { fg = colors.cyan }
M.text_red = { fg = colors.red }
M.text_yellow = { fg = colors.yellow }

M.diff = {
    added = M.text_green,
    modified = M.text_yellow,
    removed = M.text_red,
}

M.diag = {
    error = M.text_red,
    warn = M.text_yellow,
    info = M.text_blue,
    hint = M.text_purple,
}

return M
