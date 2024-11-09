---@type NvPluginSpec
return {
    --- formatter ---
    {
        "stevearc/conform.nvim",
        opts = {
            -- stylua: ignore
            formatters_by_ft = {
                css        = { "prettier" },
                javascript = { "prettier" },
                html       = { "prettier" },
                lua        = { "stylua" },
                markdown   = { "prettier" },
                python     = { "ruff_format", "ruff_organize_imports" },
                typescript = { "prettier" },
            },
        },
    },
    --- multiple cursors ---
    {
        "brenton-leighton/multiple-cursors.nvim",
        version = "*",
        opts = {
            custom_key_maps = {
                -- stylua: ignore
                { "n", "<leader>=", function() require("multiple-cursors").align() end },
            },
        },
        keys = {
            {
                "<C-M-j>",
                "<cmd>MultipleCursorsAddDown<CR>",
                mode = { "n", "x" },
                desc = "MultipleCursors add a cursor blow",
            },
            {
                "<C-M-k>",
                "<cmd>MultipleCursorsAddUp<CR>",
                mode = { "n", "x" },
                desc = "MultipleCursors add a cursor above",
            },
            {
                "<C-M-LeftMouse>",
                "<cmd>MultipleCursorsMouseAddDelete<CR>",
                mode = { "n", "i" },
                desc = "MultipleCursors add or remove a cursor with left click",
            },
            {
                "<leader>a",
                "<cmd>MultipleCursorsAddMatches<CR>",
                mode = { "n", "x" },
                desc = "MultipleCursors add cursors to the word under the cursor",
            },
            {
                "<M-n>",
                "<cmd>MultipleCursorsAddJumpNextMatch<CR>",
                mode = { "n", "x" },
                desc = "MultipleCursors add cursor to next match",
            },
        },
    },
    --- write as su ---
    {
        "denialofsandwich/sudo.nvim",
        dependencies = "MunifTanjim/nui.nvim",
        config = true,
        cmd = { "SudoWrite" },
    },
    --- you need some VSC power ---
    {
        "declancm/vim2vscode",
        cmd = "Code",
    },
}
