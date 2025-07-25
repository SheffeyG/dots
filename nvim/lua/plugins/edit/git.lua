local signs = {
    add = { text = "│" },
    change = { text = "│" },
    changedelete = { text = "┼" },
}

---@type LazyPluginSpec[]
return {
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPost" },
        opts = {
            signs = signs,
            signs_staged = signs,
        },
    },

    {
        "NeogitOrg/neogit",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>gg", "<CMD>Neogit<CR>", desc = "Neogit Panel" },
        },
        ---@module "neogit"
        ---@type NeogitConfig
        opts = {
            kind = "tab", -- auto/tab/floating/split/vsplit
            commit_view = { kind = "auto" },
            log_view = { kind = "vsplit" },
            signs = {
                hunk = { "", "" },
                item = { " ", " " },
                section = { " ", " " },
            },
            sections = {
                rebase = { folded = false },
                recent = { folded = false, hidden = false },
            },
            commit_editor = {
                kind = "auto",
                show_staged_diff = false,
            },
            graph_style = "unicode",
            mappings = {
                popup = {
                    ["l"] = false,
                    ["L"] = "LogPopup",
                },
            },
        },
    },

    {
        "akinsho/git-conflict.nvim",
        event = "VeryLazy",
        opts = {
            disable_diagnostics = true,
            highlights = { current = "ConflictOurs", incoming = "ConflictTheirs" },
        },
    },

    {
        "sindrets/diffview.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            { "<leader>dv", "<CMD>DiffviewOpen<CR>", desc = "Diffview Open Panel" },
            { "<leader>dp", "<CMD>DiffviewOpen HEAD^..HEAD<CR>", desc = "Diffview Diff Previous" },
            { "<leader>df", "<CMD>DiffviewFileHistory %<CR>", desc = "Diffview File History" },
        },
        opts = {
            enhanced_diff_hl = true,
            view = {
                merge_tool = { layout = "diff3_mixed" },
            },
            key_bindings = {
                view = { q = "<CMD>DiffviewClose<CR>" },
                file_panel = { q = "<CMD>DiffviewClose<CR>" },
                file_history_panel = { q = "<CMD>DiffviewClose<CR>" },
            },
        },
    },
}
