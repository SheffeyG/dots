---@alias Highlight table<string, vim.api.keyset.highlight>

-- stylua: ignore
-- _G.colors = {
--     ["black_dark"]  = "#1b1f27",
--     ["black"]       = "#1e222a",
--     ["black_light"] = "#252931",
--     ["grey_dark"]   = "#31353d",
--     ["grey"]        = "#353b45",
--     ["grey_light"]  = "#565c64",
--     ["white_dark"]  = "#979aa1",
--     ["white"]       = "#abb2bf",
--     ["white_light"] = "#c8ccd4",
--
--     ["crimson"]     = "#d7424d",
--     ["red"]         = "#e06c75",
--     ["orange"]      = "#d19a66",
--     ["yellow"]      = "#e7c787",
--     ["green"]       = "#98c379",
--     ["cyan"]        = "#56b6c2",
--     ["blue"]        = "#61afef",
--     ["purple"]      = "#c678dd",
--     ["brown"]       = "#be5046",
--
--     ["red_bg"]      = "#3f1e20",
--     ["yellow_bg"]   = "#4d422d",
--     ["green_bg"]    = "#202919",
--     ["blue_bg"]     = "#223e55",
--     ["cyan_bg"]     = "#16585f",
--     ["purple_bg"]   = "#3c2443",
-- }

local M = {}

-- function M.blend_bg(hex, amount) --
--     return require("snacks.util").blend(hex, colors.bg, amount)
-- end
--
-- function M.darken(hex, amount, bg) --
--     return require("snacks.util").blend(hex, bg or colors.bg, amount)
-- end
--
-- function M.lighten(hex, amount, fg) --
--     return require("snacks.util").blend(hex, fg or colors.fg, amount)
-- end

-- generate a highlight group
---@param hl vim.api.keyset.highlight
M.group = function(hl)
    local group = vim.inspect(hl):gsub("%W+", "_")

    if not M.groups[group] then
        hl = type(hl) == "string" and { link = hl } or hl
        hl = vim.deepcopy(hl, true)
        hl.fg = hl.fg or colors.gray.base
        if hl.fg == hl.bg then hl.fg = nil end
        vim.api.nvim_set_hl(0, group, hl)
        M.groups[group] = true
    end

    return group
end

-- apply a list of highlights
---@param highlights Highlight
M.apply = function(highlights)
    ---@param name string
    ---@param opts vim.api.keyset.highlight
    vim.iter(highlights):each(function(name, opts) --
        vim.api.nvim_set_hl(0, name, opts)
    end)
end

return M
