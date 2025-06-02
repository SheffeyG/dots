return {
    "olimorris/codecompanion.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<leader>ac", "<CMD>CodeCompanionChat<CR>", desc = "AI Chat" },
    },
    opts = {
        strategies = {
            chat = { adapter = "gemini" },
            inline = { adapter = "gemini" },
            agent = { adapter = "gemini" },
        },
        display = {
            chat = {
                window = {
                    height = 0.8,
                    width = 0.4,
                    opts = { number = false },
                },
            },
        },
    },
}
