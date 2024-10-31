return {
    "brenton-leighton/multiple-cursors.nvim",
    version = "*", -- Use the latest tagged version
    opts = {
        custom_key_maps = {
            { "n", "<Leader>|", function() require("multiple-cursors").align() end }, -- stylua: ignore
        },
    },
    keys = {
        {
            "<C-M-j>",
            "<CMD>MultipleCursorsAddDown<CR>",
            mode = { "n", "x" },
            desc = "MultipleCursors Add a cursor blow",
        },
        {
            "<C-M-k>",
            "<CMD>MultipleCursorsAddUp<CR>",
            mode = { "n", "x" },
            desc = "MultipleCursors Add a cursor above",
        },
        {
            "<C-M-LeftMouse>",
            "<CMD>MultipleCursorsMouseAddDelete<CR>",
            mode = { "n", "i" },
            desc = "MultipleCursors Add or remove a cursor with left click",
        },
        {
            "<leader>a",
            "<CMD>MultipleCursorsAddMatches<CR>",
            mode = { "n", "x" },
            desc = "MultipleCursors Add cursors to the word under the cursor",
        },
    },
}
