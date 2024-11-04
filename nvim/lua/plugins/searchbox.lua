return {
    "VonHeikemen/searchbox.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    keys = {
        {
            "<leader>ss",
            "<CMD> SearchBoxMatchAll<CR>",
            mode = { "n" },
            desc = "Search",
        },
        {
            "<leader>sr",
            "<CMD> SearchBoxReplace<CR>",
            mode = { "n" },
            desc = "Search and Replace",
        },
        {
            "<leader>ss",
            "<CMD> SearchBoxMatchAll visual_mode=true<CR>",
            mode = { "v" },
            desc = "Search in selected text",
        },
        {
            "<leader>sr",
            "<CMD> SearchBoxReplace visual_mode=true<CR>",
            mode = { "v" },
            desc = "Search and Replace in selected text",
        },
    },
}
