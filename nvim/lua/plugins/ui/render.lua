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

        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },

    {
        "OXY2DEV/markview.nvim",
        ft = "markdown",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
    },
}
