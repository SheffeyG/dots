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
        kind = "auto", -- auto/tab/floating/split/vsplit
        log_view = { kind = "split" },
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
        commit_select_view = { kind = "auto" },
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
