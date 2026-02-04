local signs = {
    add = { text = "│" },
    change = { text = "│" },
    changedelete = { text = "┼" },
}

---@type LazyPluginSpec[]
return {
    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPost",
        opts = {
            signs = signs,
            signs_staged = signs,
        },
        keys = {
            { "<leader>uH", "<CMD>Gitsigns preview_hunk_inline<CR>", desc = "Toggle hunk preview" },
            { "gh", "<CMD>Gitsigns stage_hunk<CR>", desc = "Git stage hunk" },
            { "gH", "<CMD>Gitsigns reset_hunk<CR>", desc = "Git reset hunk" },
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
            signs = {
                hunk = { "", "" },
                item = { "", "" },
                section = { " ", " " },
            },
            graph_style = "unicode",
            sections = {
                rebase = { folded = false },
                recent = { folded = false },
                unmerged_upstream = { hidden = true },
            },
            kind = "tab",
            commit_view = { kind = "auto" },
            log_view = { kind = "auto" },
            commit_editor = {
                kind = "auto",
                show_staged_diff = false,
            },
            mappings = {
                popup = {
                    ["l"] = false,
                    ["L"] = "LogPopup",
                },
                status = {
                    -- ["h"] = "Close",
                    ["l"] = "GoToFile",
                },
            },
        },
    },

    {
        "tpope/vim-fugitive",
        enabled = false,
        event = "CmdlineEnter",
        init = function() vim.cmd("cnoreabbrev git Git") end,
        keys = {
            { "<leader>G", "<CMD>Git<CR>", desc = "Git fugitive status panel" },
            { "gm", "<CMD>Git commit<CR>", desc = "Git commit" },
            { "gM", "<CMD>Git commit --amend --no-edit<CR>", desc = "Git amend" },
            { "ga", "<CMD>Git add %<CR>", desc = "Git stage current" },
            { "gA", "<CMD>Git add .<CR>", desc = "Git stage all files" },
            { "gX", "<CMD>Git restore %<CR>", desc = "Git restore current" },
        },
    },

    {
        "esmuellert/vscode-diff.nvim",
        enabled = false,
        dependencies = { "MunifTanjim/nui.nvim" },
        cmd = { "CodeDiff" },
    },

    {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen" },
        keys = {
            { "<leader>dv", "<CMD>DiffviewOpen<CR>", desc = "Diffview Open Panel" },
            { "<leader>dp", "<CMD>DiffviewOpen HEAD^..HEAD<CR>", desc = "Diffview Diff Previous" },
            { "<leader>df", "<CMD>DiffviewFileHistory %<CR>", desc = "Diffview File History" },
        },
        opts = {
            key_bindings = {
                view = { q = "<CMD>DiffviewClose<CR>" },
                file_panel = { q = "<CMD>DiffviewClose<CR>" },
                file_history_panel = { q = "<CMD>DiffviewClose<CR>" },
            },
        },
    },

    {
        "akinsho/git-conflict.nvim",
        enabled = false,
        event = "BufReadPost",
        opts = {
            disable_diagnostics = true,
            highlights = { current = "DiffOurs", incoming = "DiffTheirs" },
        },
    },
}
