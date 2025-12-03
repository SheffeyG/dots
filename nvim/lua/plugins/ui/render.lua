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
        version = "*",
        event = { "BufReadPost", "BufNewFile" },
        build = ":TSUpdate",
        opts = {
            -- built-in parser: C, Lua, Markdown, Vimscript, Vimdoc.
            ensure_installed = {
                "python",
                "rust",
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
