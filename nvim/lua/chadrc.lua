---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "onedark",
    integrations = {
        "neogit",
        "notify",
        "semantic_tokens",
    },
}

M.term = {
    winopts = { winfixbuf = true },
}

return M
