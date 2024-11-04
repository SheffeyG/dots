---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "onedark",
    theme_taggle = { "onedark", "catppuccin" },
}

M.mason = {
    pkgs = {
        "clangd",
        "lua-language-server",
        "pyright",
    },
}

M.cheatsheet = {
    theme = "simple",
}

return M
