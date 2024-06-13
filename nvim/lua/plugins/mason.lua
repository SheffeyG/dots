return {
    "williamboman/mason.nvim",
    config = function()
        require("mason").setup({
            ensure_installed = {
                "python-lsp-server",
                "black",
                "isort",
                "prettier",
                "lua-language-server",
            }
        })
    end,
}
