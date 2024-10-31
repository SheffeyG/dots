return {
    "NeogitOrg/neogit",
    dependencies = {
        "sindrets/diffview.nvim",
        "nvim-telescope/telescope.nvim",
    },
    cmd = "Neogit",
    keys = {
        { "<leader>gg", "<CMD>Neogit<CR>", desc = "Git Neogit Panel" },
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
        -- stylua: ignore start
        highlight = {
            red       = "#E06C75",
            orange    = "#ffcb6b",
            yellow    = "#FFE082",
            green     = "#C3E88D",
            cyan      = "#89ddff",
            blue      = "#82AAFF",
            purple    = "#C792EA",
        },
        -- stylua: ignore end
    },
}
