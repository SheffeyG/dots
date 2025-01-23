---@type NvPluginSpec
return {
    "nvim-lua/plenary.nvim",

    "MunifTanjim/nui.nvim",

    {
        "nvchad/base46",
        build = function()
            require("base46").load_all_highlights()
        end,
    },

    {
        "SheffeyG/ui",
        lazy = false,
        config = function()
            require("nvchad")
        end,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            indent = { char = "│", highlight = "IblChar" },
            scope = { char = "│", highlight = "IblScopeChar" },
        },
        config = function(_, opts)
            dofile(vim.g.base46_cache .. "blankline")

            local hooks = require("ibl.hooks")
            hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
            require("ibl").setup(opts)

            dofile(vim.g.base46_cache .. "blankline")
        end,
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = function()
            dofile(vim.g.base46_cache .. "whichkey")
            return { delay = 500 }
        end,
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
