--- @type LazyPluginSpec[]
return {
    {
        "echasnovski/mini.diff",
        event = "BufReadPost",
        opts = {
            view = {
                style = "sign",
                signs = { add = "┃", change = "┃", delete = "▁" },
            },
        },
    },

    {
        "sindrets/diffview.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = { "DiffviewOpen", "DiffviewClose" },
        keys = {
            { "<leader>dv", "<CMD>DiffviewOpen<CR>", desc = "Diffview Panel" },
        },
        opts = {
            enhanced_diff_hl = true,
            view = {
                merge_tool = {
                    layout = "diff3_mixed",
                    disable_diagnostics = true,
                    diff_binaries = false,
                },
            },
            key_bindings = {
                view = { q = "<CMD>DiffviewClose<CR>" },
                file_panel = { q = "<CMD>DiffviewClose<CR>" },
                file_history_panel = { q = "<CMD>DiffviewClose<CR>" },
            },
            hooks = {
                -- Change local options in diff buffers
                diff_buf_read = function()
                    vim.opt_local.wrap = false
                    vim.opt_local.list = false
                    vim.opt_local.colorcolumn = ""
                end,
            },
        },
    },

    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
        },
        cmd = "Neogit",
        keys = {
            { "<leader>gg", "<CMD>Neogit<CR>", desc = "Neogit Panel" },
        },
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
}
