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
    },

    {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = { "markdown", "codecompanion" },
        ---@module "render-markdown"
        ---@type render.md.UserConfig
        opts = {
            anti_conceal = { enabled = false },
            completions = { blink = { enabled = true } },
            code = { border = "thin" },
        },
    },
}
