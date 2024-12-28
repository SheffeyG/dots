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
        keys = { "<leader>", "<c-w>", '"', "'", "`", "c", "v", "g" },
        cmd = "WhichKey",
        opts = function()
            dofile(vim.g.base46_cache .. "whichkey")
            return {}
        end,
    },

    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy", -- "VeryLazy" or `LspAttach`
        -- priority = 1000, -- needs to be loaded in first
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
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            presets = {
                bottom_search = true, -- use a classic bottom cmdline for search
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
            },
            routes = {
                -- hide written msg
                {
                    filter = {
                        event = "msg_show",
                        kind = "",
                        find = "written",
                    },
                    opts = { skip = true },
                },
            },
            lsp = { progress = { enabled = false }, },
        },
    },
}
