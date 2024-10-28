return {
    "stevearc/conform.nvim",
    opt = {
        formatters_by_ft = {
            c = { "clang-format" },
            cpp = { "clang-format" },
            css = { "prettier" },
            javascript = { "prettier" },
            html = { "prettier" },
            lua = { "stylua" },
            markdown = { "prettier" },
            python = { "ruff" },
            typescript = { "prettier" },
        },
    },
}
