return {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
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

    -- format_on_save = {
    --   -- These options will be passed to conform.format()
    --   timeout_ms = 500,
    --   lsp_fallback = true,
    -- },
    },
}
