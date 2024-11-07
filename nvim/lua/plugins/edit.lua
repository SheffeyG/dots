return {
    {
        "brenton-leighton/multiple-cursors.nvim",
        version = "*", -- Use the latest tagged version
        opts = {
            custom_key_maps = {
            -- stylua: ignore
            { "n", "<leader>|", function() require("multiple-cursors").align() end },
            },
        },
        keys = {
            {
                "<C-M-j>",
                "<cmd>MultipleCursorsAddDown<CR>",
                mode = { "n", "x" },
                desc = "MultipleCursors Add a cursor blow",
            },
            {
                "<C-M-k>",
                "<cmd>MultipleCursorsAddUp<CR>",
                mode = { "n", "x" },
                desc = "MultipleCursors Add a cursor above",
            },
            {
                "<C-M-LeftMouse>",
                "<cmd>MultipleCursorsMouseAddDelete<CR>",
                mode = { "n", "i" },
                desc = "MultipleCursors Add or remove a cursor with left click",
            },
            {
                "<leader>a",
                "<cmd>MultipleCursorsAddMatches<CR>",
                mode = { "n", "x" },
                desc = "MultipleCursors Add cursors to the word under the cursor",
            },
        },
    },

    {
        "denialofsandwich/sudo.nvim",
        dependencies = "MunifTanjim/nui.nvim",
        config = true,
        cmd = { "SudoWrite" },
    },

    {
        "declancm/vim2vscode",
        cmd = "Code",
    },
}
