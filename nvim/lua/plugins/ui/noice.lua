--- @type LazyPluginSpec
return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = "MunifTanjim/nui.nvim",
    opts = {
        presets = {
            bottom_search = true,
            long_message_to_split = true,
        },
        commands = {
            history = {
                view = "popup",
            },
        },
        views = {
            cmdline_popup = {
                border = {
                    style = "none",
                    padding = { 2, 3 },
                },
                filter_options = {},
                win_options = {
                    winhighlight = { NormalFloat = "NormalDark" },
                },
            },
            popup = {
                border = { style = "single", padding = { 0, 1 } },
                win_options = {
                    winhighlight = {
                        NormalFloat = "Normal",
                        FloatBorder = "FloatBorder",
                    },
                },
                size = { width = 100 },
            },
            hover = {
                border = { style = "single", padding = { 0, 1 } },
                position = { row = 2, col = 0 },
            },
            mini = {
                timeout = 3000,
                size = { max_width = 50 },
            },
        },
        lsp = {
            override = {
                ["cmp.entry.get_documentation"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            },
        },
    },
    keys = {
        {
            "<leader>mh",
            function() require("noice").cmd("history") end,
            desc = "Message History",
        },
    },
}
