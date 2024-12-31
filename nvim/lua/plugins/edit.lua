---@type NvPluginSpec
return {
    -- formatter
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

    -- multiple cursors
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
        pre_hook = function()
            require("nvim-autopairs").disable()
        end,
        post_hook = function()
            require("nvim-autopairs").enable()
        end,
    },

    -- write as su
    {
        "lambdalisue/vim-suda",
        cmd = "SudaWrite",
    },

    -- open in vscode
    {
        "declancm/vim2vscode",
        cmd = "Code",
    },

    -- mini plugins
    {
        "echasnovski/mini.move",
        event = "VeryLazy",
        opts = {},  -- keep this for setup
    },
    {
        "echasnovski/mini.ai",
        event = "VeryLazy",
        opts = {},
    },
    {
        "echasnovski/mini.surround",
        event = "VeryLazy",
        opts = {},
    },
}
