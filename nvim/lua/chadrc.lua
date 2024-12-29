---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "onedark",
    integrations = {
        "neogit",
    },
    hl_override = {
        -- remove nvimtree separator
        NvimTreeWinSeparator = { bg = "black", fg = "line" },
    },
}

M.term = {
    winopts = { winfixbuf = true },
}

M.ui = {
    tabufline = {
        order = { "buffers", "tabs", "btns" },
    },
}

return M
