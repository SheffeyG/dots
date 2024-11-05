return {
    "nvim-treesitter/nvim-treesitter",
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
        },
        sync_install = true,
        auto_install = false,
        highlight = {
            enable = true,
            use_languagetree = true,
        },
        indent = { enable = true },
    },

    config = function(_, opts)
        pcall(function()
            dofile(vim.g.base46_cache .. "syntax")
            dofile(vim.g.base46_cache .. "treesitter")
        end)

        require("nvim-treesitter.configs").setup(opts)
    end,
}
