return {
    {
        "lewis6991/gitsigns.nvim",
        event = "User FilePost",
        opts = function()
            dofile(vim.g.base46_cache .. "git")
            return {
                signs = {
                    delete = { text = "󰍵" },
                    changedelete = { text = "󱕖" },
                },
            }
        end,
    },

    {
        "NeogitOrg/neogit",
        dependencies = {
            "sindrets/diffview.nvim",
            "nvim-telescope/telescope.nvim",
        },
        cmd = "Neogit",
        keys = {
            { "<leader>gg", "<cmd>Neogit<CR>", desc = "Git Neogit Panel" },
        },
        opts = {
            signs = {
                hunk = { "", "" },
                item = { " ", " " },
                section = { " ", " " },
            },
            sections = {
                untracked = { folded = true, hidden = false },
                rebase = { folded = false },
                recent = { folded = false },
            },
            commit_editor = {
                kind = "floating",
                show_staged_diff = false,
            },
            kind = "auto", -- auto/tab/floating/split/vsplit
            commit_view = { kind = "vsplit" },
            log_view = { kind = "split" },
            graph_style = "unicode",
            highlight = {
                -- stylua: ignore start
                red       = "#E06C75",
                orange    = "#ffcb6b",
                yellow    = "#FFE082",
                green     = "#C3E88D",
                cyan      = "#89ddff",
                blue      = "#82AAFF",
                purple    = "#C792EA",
                -- stylua: ignore end
            },
        },
    },
}
