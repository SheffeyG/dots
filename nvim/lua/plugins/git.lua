---@type NvPluginSpec
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
