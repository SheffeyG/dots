---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "onedark",
    integrations = {
        "neogit",
    },
    hl_override = {
        -- remove nvimtree separator
        NvimTreeWinSeparator = { fg = "line", bg = "black" },
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
