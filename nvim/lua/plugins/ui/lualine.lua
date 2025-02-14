--- @type LazyPluginSpec
return {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "yavorski/lualine-macro-recording.nvim",
    },
    opts = {
        options = {
            theme = "onedark",
            section_separators = "",
            component_separators = "",
            ignore_focus = { "NeogitStatus" },
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
                { "filetype", icon_only = true, padding = { left = 1, right = 0 } },
                { "filename", padding = { left = 0, right = 1 } },
            },
            lualine_x = {
                { "macro_recording", "%S" },
                { "encoding" },
            },
            lualine_y = {
                "progress",
            },
            lualine_z = {
                { "tabs", cond = function() return #vim.api.nvim_list_tabpages() > 1 end },
            },
        },
    },
}
