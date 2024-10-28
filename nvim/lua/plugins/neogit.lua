return {
    "NeogitOrg/neogit",
    dependencies = {
        "sindrets/diffview.nvim",
        "nvim-telescope/telescope.nvim",
    },
    cmd = "Neogit",
    keys = {
        { "<leader>gg", "<CMD>Neogit<CR>", desc = "Neogit" },
        {
            "<leader>gf",
            function()
                require("neogit").action("log", "log_current", { "--", vim.fn.expand("%") })()
            end,
            desc = "Git log for file",
        },
        {
            "<leader>gf",
            function()
                local file = vim.fn.expand("%")
                vim.cmd([[execute "normal! \<ESC>"]])
                local line_start = vim.fn.getpos("'<")[2]
                local line_end = vim.fn.getpos("'>")[2]

                require("neogit").action("log", "log_current", { "-L" .. line_start .. "," .. line_end .. ":" .. file })()
            end,
            desc = "Git log for this range",
            mode = "v",
        },
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
