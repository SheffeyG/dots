---@type LazyPluginSpec[]
return {
    { "tjdevries/colorbuddy.nvim" },

    {
        "norcalli/nvim-colorizer.lua",
        conf = false,
        ft = { "css", "lua" },
        opts = { "css", "lua" },
    },

    {
        "nvim-treesitter/nvim-treesitter",
        version = "*",
        event = { "BufReadPost", "BufNewFile" },
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "c",
                "cpp",
                "python",
                "lua",
                "luadoc",
                "vim",
                "vimdoc",
                "html",
                "css",
                "javascript",
                "json",
                "yaml",
                "toml",
                "printf",
                "markdown",
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
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {
            heading = {
                icons = { "󰉫 ", "󰉬 ", "󰉭 ", "󰉮 ", "󰉯 ", "󰉰 " },
                position = "inline",
                width = "block",
                left_margin = 0.5,
                left_pad = 0.2,
                right_pad = 0.2,
            },
            code = {
                left_pad = 1,
                language_pad = 1,
                border = "thin",
            },
            sign = { enabled = false },
        },
    },
}
