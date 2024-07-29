return {
    "williamboman/mason.nvim",
    config = function()
        require("mason").setup({
            ensure_installed = {
                "ruff",
                "ruff-lsp",
                "prettier",
                "lua-language-server",
            }
        })
    end,
}
