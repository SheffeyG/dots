local colors = require("colors.lualine")

-- conditions
local many_tabs = function() return #vim.api.nvim_list_tabpages() > 1 end
-- local not_empty = function() return vim.fn.empty(vim.fn.expand("%:t")) ~= 1 end
-- local wide_win = function() return vim.fn.winwidth(0) > 80 end
-- local has_lsp = function() return next(vim.lsp.get_clients()) ~= nil end

-- components
local filename = {
    "filetype",
    fmt = function() return vim.fn.expand("%:t") end,
    padding = { left = 1, right = 0 },
}

local diff = {
    "diff",
    symbols = { added = " ", modified = " ", removed = " " },
    diff_color = colors.diff,
    padding = { left = 1, right = 0 },
}

local diagnostics = {
    "diagnostics",
    symbols = { error = " ", warn = "󰗖 ", hint = " ", info = " " },
    sections = { "error", "warn", "info", "hint" },
    padding = { left = 0, right = 1 },
    diagnostics_color = colors.diagnostics,
}

local macro = {
    "macro",
    icon = "",
    fmt = function()
        local reg = vim.fn.reg_recording()
        if reg ~= "" then return reg end
        return nil
    end,
    color = colors.text_red,
    padding = { left = 0, right = 1 },
}

local select = {
    "selectioncount",
    icon = "󰒉",
    color = colors.text_purple,
    padding = { left = 0, right = 1 },
}

--- @type LazyPluginSpec
return {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        options = {
            theme = colors.theme,
            section_separators = "",
            component_separators = "",
            disabled_filetypes = { "Lazy", "Mason" },
            ignore_focus = { "Lazy", "Mason", "NeogitStatus" },
            globalstatus = true,
        },
        sections = {
            lualine_a = {
                { "mode", icon = "" },
            },
            lualine_b = {
                { "branch", icon = "" },
            },
            lualine_c = {
                filename,
                diff,
            },
            lualine_x = {
                select,
                macro,
                diagnostics,
            },
            lualine_y = {
                { "progress", color = colors.text_blue },
            },
            lualine_z = {
                { "tabs", show_modified_status = false, cond = many_tabs },
            },
        },
    },
}
