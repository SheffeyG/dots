return {
    "nvim-lua/plenary.nvim",

    "MunifTanjim/nui.nvim",

    "nvim-tree/nvim-web-devicons",

    {
        "nvimdev/indentmini.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = { exclude = { "markdown" } },
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = { delay = 500 },
    },

    {
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
                        winhighlight = {
                            NormalFloat = "NormalFloat",
                            FloatBorder = "FloatBorder",
                        },
                    },
                },
                cmdline_input = {
                    border = { style = "single" },
                    win_options = {
                        winhighlight = {
                            NormalFloat = "Normal",
                            FloatBorder = "Normal",
                        },
                    },
                },
                popup = {
                    border = {
                        style = "single",
                        padding = { 0, 1 },
                    },
                    win_options = {
                        winhighlight = {
                            NormalFloat = "Normal",
                            FloatBorder = "FloatBorder",
                        },
                    },
                    size = { width = 100 },
                },
                mini = {
                    timeout = 3000,
                },
            },
            lsp = {
                progress = { enabled = false },
                hover = { enabled = false },
                signature = { enabled = false },
                override = {
                    ["cmp.entry.get_documentation"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                },
            },
        },
    },
}
