---@type LazyPluginSpec[]
return {
    { "nvim-tree/nvim-web-devicons" },

    {
        "NMAC427/guess-indent.nvim",
        event = "BufReadPre",
        opts = {},
    },

    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
        },
    },

    {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = { "markdown" },
        init = function()
            vim.filetype.add({
                extension = { mdx = "markdown" },
            })
        end,
        ---@module "render-markdown"
        ---@type render.md.UserConfig
        opts = {
            anti_conceal = { enabled = false },
            completions = { blink = { enabled = true } },
            code = { border = "thin" },
        },
    },
}
