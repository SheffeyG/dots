local options = {
    formatters_by_ft = {
        c = { "clang-format" },
        cpp = { "clang-format" },
        css = { "prettier" },
        javascript = { "prettier" },
        html = { "prettier" },
        lua = { "stylua" },
        markdown = { "prettier" },
        python = { "isort", "black" },
        typescript = { "prettier" },
    },

    -- format_on_save = {
    --   -- These options will be passed to conform.format()
    --   timeout_ms = 500,
    --   lsp_fallback = true,
    -- },
}

return {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
        require("conform").setup(options)
    end,
}
