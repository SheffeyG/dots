---@type LazyPluginSpec
return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = "MunifTanjim/nui.nvim",
    ---@type NoiceConfig
    opts = {
        presets = {
            bottom_search = true,
            long_message_to_split = true,
        },
        cmdline = {
            format = {
                replace = {
                    conceal = false,
                    pattern = "^:s/",
                    icon = " ",
                    lang = "regex",
                    view = "cmdline",
                },
                replace_all = {
                    conceal = false,
                    pattern = "^:%%s/",
                    icon = " 󰬳",
                    lang = "regex",
                    view = "cmdline",
                },
            },
        },
        ---@type NoiceConfigViews
        views = {
            cmdline_popup = {
                size = { width = 0.3 },
                border = { style = "none", padding = { 2, 3 } },
                win_options = { winhighlight = { Normal = "NormalDark" } },
            },
            cmdline_input = {
                win_options = { winhighlight = { Normal = "Normal" } },
            },
            hover = {
                scrollbar = false,
                size = { max_width = 50, max_height = 15 },
                border = { style = "single", padding = { 0, 1 } },
                position = { row = 2, col = 0 },
                win_options = { winhighlight = { FloatBorder = "NormalCyan" } },
            },
            mini = { timeout = 3000 },
        },
        lsp = {
            progress = { enabled = false },
            override = {
                ["vim.lsp.util.stylize_markdown"] = true,
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            },
        },
        routes = {
            {
                filter = {
                    event = "msg_show",
                    kind = "",
                    any = { -- skip some noise msg
                        { find = "^%d+ lines indented" },
                        { find = "^%d+ lines moved" },
                        { find = "^lazy.nvim # Config Change Detected. Reloading..." },
                    },
                },
                opts = { skip = true },
            },
        },
    },
    keys = {
        { "<leader>mh", "<CMD>NoiceAll<CR>", desc = "Message History" },
    },
}
