return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            c = { "clang-format", lsp_format = "fallback" },
            cpp = { "clang-format", lsp_format = "fallback" },
            css = { "prettier" },
            javascript = { "prettier" },
            html = { "prettier" },
            lua = { "stylua" },
            markdown = { "prettier" },
            python = { "ruff_format", "ruff_organize_imports" },
            typescript = { "prettier" },
        },
    },
}
