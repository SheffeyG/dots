local M = {}

-- stylua: ignore
local colors = {
    blue   = "#61afef",
    green  = "#98c379",
    purple = "#c678dd",
    cyan   = "#56b6c2",
    red    = "#e06c75",
    yellow = "#e5c07b",
    brown  = "#be5046",
    white  = "#abb2bf",
    black  = "#353b45",
    gray1  = "#828997",
    gray2  = "#2c323c",
    gray3  = "#3e4452",
}

M.text_blue = { fg = colors.blue }
M.text_green = { fg = colors.green }
M.text_purple = { fg = colors.purple }
M.text_cyan = { fg = colors.cyan }
M.text_red = { fg = colors.red }
M.text_yellow = { fg = colors.yellow }

M.theme = {
    normal = {
        a = { fg = colors.black, bg = colors.blue, gui = "bold" },
        b = { fg = colors.white, bg = colors.gray3 },
        c = { fg = colors.white, bg = colors.gray2 },
    },
    command = { a = { fg = colors.black, bg = colors.yellow, gui = "bold" } },
    insert = { a = { fg = colors.black, bg = colors.green, gui = "bold" } },
    visual = { a = { fg = colors.black, bg = colors.purple, gui = "bold" } },
    terminal = { a = { fg = colors.black, bg = colors.cyan, gui = "bold" } },
    replace = { a = { fg = colors.black, bg = colors.red, gui = "bold" } },
    inactive = {
        a = { fg = colors.gray1, bg = colors.black, gui = "bold" },
        b = { fg = colors.gray1, bg = colors.black },
        c = { fg = colors.gray1, bg = colors.gray2 },
    },
}

M.diff = {
    added = M.text_green,
    modified = M.text_yellow,
    removed = M.text_red,
}

M.diagnostics = {
    error = M.text_red,
    warn = M.text_yellow,
    info = M.text_blue,
    hint = M.text_purple,
}

return M
