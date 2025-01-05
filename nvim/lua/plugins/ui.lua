---@type NvPluginSpec
return {
    { "nvim-lua/plenary.nvim", lazy = true },

    { "MunifTanjim/nui.nvim", lazy = true },

    {
        "nvchad/base46",
        build = function()
            require("base46").load_all_highlights()
        end,
    },

    {
        "nvchad/ui",
        lazy = false,
        config = function()
            require("nvchad")
        end,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        event = "User FilePost",
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
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy", -- "VeryLazy" or `LspAttach`
        -- priority = 10, -- needs to be loaded in first
        config = function()
            vim.diagnostic.config({ virtual_text = false })
            require("tiny-inline-diagnostic").setup({
                -- preset = "powerline",
                signs = {
                    left = "",
                    right = "",
                    diag = "●",
                    arrow = "",
                    up_arrow = "  ",
                    vertical = "  ",
                    vertical_end = "  ",
                },
            })
        end,
    },

    {
        "rachartier/tiny-code-action.nvim",
        keys = {
            {
                "<leader>ca",
                function()
                    require("tiny-code-action").code_action()
                end,
            },
        },
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope.nvim" },
        },
        config = true,
    },

    {
        "folke/noice.nvim",
        event = "VeryLazy",
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
                signature = { enabled = false },
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
        },
    },
}
