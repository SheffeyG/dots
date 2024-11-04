return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
        dofile(vim.g.base46_cache .. "syntax")
        dofile(vim.g.base46_cache .. "treesitter")
        return {
            ensure_installed = {
                "json",
                "yaml",
                "toml",
                "c",
                "cpp",
                "python",
                "lua",
                "luadoc",
                "printf",
                "vim",
                "vimdoc",
            },
            auto_install = "false",
            highlight = {
                enable = true,
                use_languagetree = true,
            },
            indent = { enable = true },
        }
    end,
}
