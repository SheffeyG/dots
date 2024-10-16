return {
    "VonHeikemen/searchbox.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    keys = {
        {
            "<leader>s",
            "<CMD> SearchBoxMatchAll clear_matches=true<CR>",
            mode = { "n" },
            desc = "Search",
        },
        {
            "<leader>r",
            "<CMD> SearchBoxReplace<CR>",
            mode = { "n" },
            desc = "Search and Replace",
        },
        {
            "<leader>s",
            "<CMD> SearchBoxMatchAll visual_mode=true clear_matches=true<CR>",
            mode = { "v" },
            desc = "Search in selected text",
        },
        {
            "<leader>r",
            "<CMD> SearchBoxReplace visual_mode=true<CR>",
            mode = { "v" },
            desc = "Search and Replace in selected text",
        },
    },
}
