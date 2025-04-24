---@diagnostic disable: lowercase-global

-- stylua: ignore
colors = {
    -- onedark color scheme
    black_dark  = "#1b1f27",
    black       = "#1e222a",
    black_light = "#252931",
    black_bar   = "#2c323c",
    grey_dark   = "#31353d",
    grey        = "#353b45",
    grey_bar    = "#3E4452",
    grey_light  = "#565c64",
    white_dark  = "#979aa1",
    white       = "#abb2bf",
    white_light = "#c8ccd4",

    crimson     = "#d7424d",
    red         = "#e06c75",
    orange      = "#d19a66",
    yellow      = "#e7c787",
    green       = "#98c379",
    cyan        = "#56b6c2",
    blue        = "#61afef",
    purple      = "#c678dd",
    brown       = "#be5046",
}

---@see snacks.util.blend
---@param fg string foreground color
---@param bg string background color
---@param alpha number number between 0 and 1. 0 results in bg, 1 results in fg
function mix(fg, bg, alpha)
    local fg_rgb = {
        tonumber(fg:sub(2, 3), 16),
        tonumber(fg:sub(4, 5), 16),
        tonumber(fg:sub(6, 7), 16),
    }
    local bg_rgb = {
        tonumber(bg:sub(2, 3), 16),
        tonumber(bg:sub(4, 5), 16),
        tonumber(bg:sub(6, 7), 16),
    }
    local blend = function(i)
        local ret = (alpha * fg_rgb[i] + ((1 - alpha) * bg_rgb[i]))
        return math.floor(math.min(math.max(0, ret), 255) + 0.5)
    end
    return string.format("#%02x%02x%02x", blend(1), blend(2), blend(3))
end

-- reset highlights
vim.cmd.highlight("clear")
if vim.fn.exists("syntax_on") then vim.cmd.syntax("reset") end

-- enable 256 true colors
vim.o.termguicolors = true
vim.g.colors_name = "onedark"

-- setup all highlight groups
local hls = require("custom.highlights")

---@param highlights Highlights highlight groups
local function apply_colors(highlights)
    for group, opts in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, opts)
    end
end

apply_colors(hls.core)
apply_colors(hls.syntax)
apply_colors(hls.plugins)
