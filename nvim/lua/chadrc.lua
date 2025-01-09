---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "onedark",
    integrations = {
        "diffview",
        "markview",
        "neogit",
    },
    hl_override = {
        NvimTreeWinSeparator = { fg = "line", bg = "black" },
        DiffviewFilePanelFileName = { fg = "white" },
    },
}

M.term = {
    winopts = { winfixbuf = true },
    sizes = { vsp = 0.3 },
}

M.ui = {
    tabufline = {
        order = { "buffers", "tabs", "btns" },
    },
}

return M
