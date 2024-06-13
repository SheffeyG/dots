return {
    "brenton-leighton/multiple-cursors.nvim",
    version = "*", -- Use the latest tagged version
    opts = {}, -- This causes the plugin setup function to be called
    keys = {
        {
            "<C-M-j>",
            "<Cmd>MultipleCursorsAddDown<CR>",
            mode = { "n", "x" },
            desc = "Add a cursor then move down",
        },
        {
            "<C-M-Down>",
            "<Cmd>MultipleCursorsAddDown<CR>",
            mode = { "n", "i", "x" },
            desc = "Add a cursor then move down",
        },
        {
            "<C-M-k>",
            "<Cmd>MultipleCursorsAddUp<CR>",
            mode = { "n", "x" },
            desc = "Add a cursor then move up",
        },
        {
            "<C-M-Up>",
            "<Cmd>MultipleCursorsAddUp<CR>",
            mode = { "n", "i", "x" },
            desc = "Add a cursor then move up",
        },
        {
            "<C-M-LeftMouse>",
            "<Cmd>MultipleCursorsMouseAddDelete<CR>",
            mode = { "n", "i" },
            desc = "Add or remove a cursor",
        },
        {
            "<Leader>a",
            "<Cmd>MultipleCursorsAddMatches<CR>",
            mode = { "n", "x" },
            desc = "Add cursors to the word under the cursor",
        },
    },
}
