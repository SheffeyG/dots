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
        kind = "floating", -- tab/floating/split/vsplit
        log_view = { kind = "vsplit" },
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
        commit_editor = { show_staged_diff = false },
        commit_select_view = { kind = "auto" },
        graph_style = "unicode",
    },
}
