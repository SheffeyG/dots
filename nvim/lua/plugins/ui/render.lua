---@type LazyPluginSpec[]
return {
    {
        "NMAC427/guess-indent.nvim",
        event = "BufReadPost",
        opts = {},
    },

    {
        "nvim-treesitter/nvim-treesitter",
        version = "*",
        event = { "BufReadPost", "BufNewFile" },
        build = ":TSUpdate",
        opts = {
            -- built-in parser: C, Lua, Markdown, Vimscript, Vimdoc.
            ensure_installed = {
                "python",
                "html",
                "css",
                "javascript",
                "json",
                "yaml",
                "toml",
                "printf",
                "markdown_inline",
            },
            highlight = {
                enable = true,
                use_languagetree = true,
            },
            indent = { enable = true },
        },
        config = function(_, opts) -- needs call setup manually
            require("nvim-treesitter.configs").setup(opts)
        end,
    },

    {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = "markdown",
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {
            heading = {
                icons = { "󰇊 ", "󰇋 ", "󰇌 ", "󰇍 ", "󰇎 ", "󰇏 " },
                position = "inline",
                left_pad = 1,
            },
            code = {
                sign = false,
                left_pad = 1,
                language_pad = 1,
                border = "thin",
            },
        },
    },
}
