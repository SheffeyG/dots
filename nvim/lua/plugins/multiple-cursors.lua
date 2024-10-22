return {
    "brenton-leighton/multiple-cursors.nvim",
    version = "*", -- Use the latest tagged version
    opts = {
        custom_key_maps = {
            { "n", "<Leader>|", function() require("multiple-cursors").align() end },
        },
    },
    keys = {
        {
            "<C-M-j>",
            "<CMD>MultipleCursorsAddDown<CR>",
            mode = { "n", "x" },
            desc = "Add a cursor then move down",
        },
        {
            "<C-M-Down>",
            "<CMD>MultipleCursorsAddDown<CR>",
            mode = { "n", "i", "x" },
            desc = "Add a cursor then move down",
        },
        {
            "<C-M-k>",
            "<CMD>MultipleCursorsAddUp<CR>",
            mode = { "n", "x" },
            desc = "Add a cursor then move up",
        },
        {
            "<C-M-Up>",
            "<CMD>MultipleCursorsAddUp<CR>",
            mode = { "n", "i", "x" },
            desc = "Add a cursor then move up",
        },
        {
            "<C-M-LeftMouse>",
            "<CMD>MultipleCursorsMouseAddDelete<CR>",
            mode = { "n", "i" },
            desc = "Add or remove a cursor",
        },
        {
            "<leader>a",
            "<CMD>MultipleCursorsAddMatches<CR>",
            mode = { "n", "x" },
            desc = "Add cursors to the word under the cursor",
        },
    },
}
