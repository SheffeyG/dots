return {
    "VonHeikemen/searchbox.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    keys = {
        {
            "<leader>ss",
            "<cmd> SearchBoxMatchAll<CR>",
            mode = { "n" },
            desc = "SearchBox search",
        },
        {
            "<leader>sr",
            "<cmd> SearchBoxReplace<CR>",
            mode = { "n" },
            desc = "SearchBox search and replace",
        },
        {
            "<leader>ss",
            "<cmd> SearchBoxMatchAll visual_mode=true<CR>",
            mode = { "v" },
            desc = "SearchBox search in selected text",
        },
        {
            "<leader>sr",
            "<cmd> SearchBoxReplace visual_mode=true<CR>",
            mode = { "v" },
            desc = "SearchBox search and replace in selected text",
        },
    },
}
