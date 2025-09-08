local signs = {
    add = { text = "│" },
    change = { text = "│" },
    changedelete = { text = "┼" },
}

---@type LazyPluginSpec[]
return {
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        opts = {
            signs = signs,
            signs_staged = signs,
        },
        keys = {
            { "<leader>gv", "<CMD>Gitsigns preview_hunk_inline<CR>", desc = "Git preview hunk" },
            { "<leader>gx", "<CMD>Gitsigns reset_hunk<CR>", desc = "Git restore hunk" },
        },
    },

    {
        "tpope/vim-fugitive",
        event = "VeryLazy",
        init = function() vim.cmd("cnoreabbrev git Git") end,
        keys = {
            { "<leader>G", "<CMD>Git<CR>", desc = "Git fugitive status panel" },
            { "<leader>gm", "<CMD>Git commit<CR>", desc = "Git commit" },
            { "<leader>gM", "<CMD>Git commit --amend --no-edit<CR>", desc = "Git amend" },
            { "<leader>ga", "<CMD>Git add %<CR>", desc = "Git stage current" },
            { "<leader>gA", "<CMD>Git add .<CR>", desc = "Git stage all files" },
            { "<leader>gX", "<CMD>Git restore %<CR>", desc = "Git restore current" },
        }
    },

    -- {
    --     "akinsho/git-conflict.nvim",
    --     event = "BufReadPost",
    --     opts = {
    --         disable_diagnostics = true,
    --         highlights = { current = "ConflictOurs", incoming = "ConflictTheirs" },
    --     },
    -- },
    --
    -- {
    --     "NeogitOrg/neogit",
    --     enabled = false,
    --     dependencies = { "nvim-lua/plenary.nvim" },
    --     keys = {
    --         { "<leader>gg", "<CMD>Neogit<CR>", desc = "Neogit Panel" },
    --     },
    --     ---@module "neogit"
    --     ---@type NeogitConfig
    --     opts = {
    --         kind = "tab", -- auto/tab/floating/split/vsplit
    --         commit_view = { kind = "auto" },
    --         log_view = { kind = "vsplit" },
    --         signs = {
    --             hunk = { "", "" },
    --             item = { " ", " " },
    --             section = { " ", " " },
    --         },
    --         sections = {
    --             rebase = { folded = false },
    --             recent = { folded = false, hidden = false },
    --         },
    --         commit_editor = {
    --             kind = "auto",
    --             show_staged_diff = false,
    --         },
    --         graph_style = "unicode",
    --         mappings = {
    --             popup = {
    --                 ["l"] = false,
    --                 ["L"] = "LogPopup",
    --             },
    --         },
    --     },
    -- },
    --
    -- {
    --     "sindrets/diffview.nvim",
    --     enabled = false,
    --     keys = {
    --         { "<leader>dv", "<CMD>DiffviewOpen<CR>", desc = "Diffview Open Panel" },
    --         { "<leader>dp", "<CMD>DiffviewOpen HEAD^..HEAD<CR>", desc = "Diffview Diff Previous" },
    --         { "<leader>df", "<CMD>DiffviewFileHistory %<CR>", desc = "Diffview File History" },
    --     },
    --     opts = {
    --         enhanced_diff_hl = true,
    --         view = {
    --             merge_tool = { layout = "diff3_mixed" },
    --         },
    --         key_bindings = {
    --             view = { q = "<CMD>DiffviewClose<CR>" },
    --             file_panel = { q = "<CMD>DiffviewClose<CR>" },
    --             file_history_panel = { q = "<CMD>DiffviewClose<CR>" },
    --         },
    --     },
    -- },
}
