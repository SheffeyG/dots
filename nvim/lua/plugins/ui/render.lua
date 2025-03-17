--- @type LazyPluginSpec[]
return {
    { "tjdevries/colorbuddy.nvim" },

    {
        "nvim-treesitter/nvim-treesitter",
        version = "*",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
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
        config = function(_, opts) require("nvim-treesitter.configs").setup(opts) end,
    },

    {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = "markdown",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            heading = {
                icons = { "󰉫 ", "󰉬 ", "󰉭 ", "󰉮 ", "󰉯 ", "󰉰 " },
                position = "inline",
                width = "block",
                left_margin = 0.5,
                left_pad = 0.2,
                right_pad = 0.2,
            },
            sign = { enabled = false },
            code = { left_pad = 1, language_pad = 1 },
        },
    },
}
