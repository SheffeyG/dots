return {
    { "nvim-lua/plenary.nvim" },

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

    { "nvchad/volt" },

    { "nvchad/menu" },

    {
        "nvchad/minty",
        cmd = { "Huefy", "Shades" },
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
        "rcarriga/nvim-notify",
        lazy = false,
        opts = function()
            dofile(vim.g.base46_cache .. "notify")

            vim.notify = require("notify")

            return {
                stages = "static",
                timeout = 3000,
                top_down = false,
                max_height = function()
                    return math.floor(vim.o.lines * 0.5)
                end,
                max_width = function()
                    return math.floor(vim.o.columns * 0.5)
                end,
                on_open = function(win)
                    vim.api.nvim_win_set_config(win, { zindex = 100 })
                end,
            }
        end,
    },
}
