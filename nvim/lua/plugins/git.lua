---@type NvPluginSpec
return {
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPost" },
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
        "sindrets/diffview.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = { "DiffviewOpen", "DiffviewClose" },
        keys = {
            { "<leader>dv", "<cmd>DiffviewOpen<CR>", desc = "Git open diffview panel" },
        },
        opts = function()
            dofile(vim.g.base46_cache .. "diffview")
            return {
                view = {
                    merge_tool = {
                        layout = "diff3_mixed",
                        disable_diagnostics = true,
                        diff_binaries = false,
                    },
                },
                key_bindings = {
                    view = { q = "<cmd>DiffviewClose<CR>" },
                    file_panel = { q = "<cmd>DiffviewClose<CR>" },
                    file_history_panel = { q = "<cmd>DiffviewClose<CR>" },
                },
                hooks = {
                    -- Change local options in diff buffers
                    diff_buf_read = function()
                        vim.opt_local.wrap = false
                        vim.opt_local.list = false
                        vim.opt_local.colorcolumn = { 80 }
                    end,
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
            { "<leader>gg", "<cmd>Neogit<CR>", desc = "Git neogit panel" },
        },
        opts = function()
            dofile(vim.g.base46_cache .. "neogit")
            return {
                kind = "tab", -- auto/tab/floating/split/vsplit
                commit_view = { kind = "vsplit" },
                log_view = { kind = "vsplit" },
                signs = {
                    hunk = { "", "" },
                    item = { " ", " " },
                    section = { " ", " " },
                },
                sections = {
                    untracked = { folded = true, hidden = false },
                    rebase = { folded = false },
                    recent = { folded = false, hidden = false },
                },
                commit_editor = {
                    kind = "floating",
                    show_staged_diff = false,
                },
                graph_style = "unicode",
                mappings = {
                    popup = {
                        ["l"] = false,
                        ["L"] = "LogPopup",
                    },
                },
            }
        end,
    },
}
