pcall(function()
    dofile(vim.g.base46_cache .. "syntax")
    dofile(vim.g.base46_cache .. "treesitter")
end)

return {
    "nvim-treesitter/nvim-treesitter",
    opts = {
        ensure_installed = {
            "bash",
            "c",
            "css",
            "cpp",
            "html",
            "json",
            "python",
            "toml",
            "yaml",
            "lua",
            "markdown",
        },
        auto_install = "false",
    },
}
