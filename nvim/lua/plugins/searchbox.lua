return {
    "VonHeikemen/searchbox.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    keys = {
        {
            "<leader>ss",
            "<cmd> SearchBoxMatchAll<CR>",
            mode = { "n" },
            desc = "Search",
        },
        {
            "<leader>sr",
            "<cmd> SearchBoxReplace<CR>",
            mode = { "n" },
            desc = "Search and Replace",
        },
        {
            "<leader>ss",
            "<cmd> SearchBoxMatchAll visual_mode=true<CR>",
            mode = { "v" },
            desc = "Search in selected text",
        },
        {
            "<leader>sr",
            "<cmd> SearchBoxReplace visual_mode=true<CR>",
            mode = { "v" },
            desc = "Search and Replace in selected text",
        },
    },
}
