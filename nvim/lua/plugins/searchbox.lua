return {
    "VonHeikemen/searchbox.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    cmd = {
        "SearchBoxMatchAll",
        "SearchBoxReplace",
        "SearchBoxIncSearch",
    },
    keys = {
        { "<C-f>", false },
        {
            "<C-f>",
            "<CMD> SearchBoxMatchAll clear_matches=true<CR>",
            mode = { "n" },
            desc = "Search",
        },
        {
            "<C-h>",
            "<CMD> SearchBoxReplace clear_matches=true<CR>",
            mode = { "n" },
            desc = "Search and Replace",
        },
        {
            "<C-f>",
            "<CMD> SearchBoxMatchAll visual_mode=true clear_matches=true<CR>",
            mode = { "v" },
            desc = "Search in selected text",
        },
        {
            "<C-h>",
            "<CMD> SearchBoxReplace visual_mode=true clear_matches=true<CR>",
            mode = { "v" },
            desc= "Search and Replace in selected text",
        },
    },
}
