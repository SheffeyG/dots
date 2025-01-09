---@type NvPluginSpec
return {
    -- formatter
    {
        "stevearc/conform.nvim",
        opts = {
            -- stylua: ignore
            formatters_by_ft = {
                css        = { "prettier" },
                javascript = { "prettier" },
                html       = { "prettier" },
                lua        = { "stylua" },
                markdown   = { "prettier" },
                python     = { "ruff_format", "ruff_organize_imports" },
                typescript = { "prettier" },
            },
        },
    },

    -- multiple cursors
    {
        "jake-stewart/multicursor.nvim",
        event = { "BufReadPost", "BufNewFile" },
        -- stylua: ignore
        config = function()
            local mc = require("multicursor-nvim")
            local map = vim.keymap.set
            mc.setup()

            map({ "n", "v" }, "<C-M-j>", function() mc.lineAddCursor(1) end)
            map({ "n", "v" }, "<C-M-k>", function() mc.lineAddCursor(-1) end)
            map({ "n", "v" }, "<C-M-n>", function() mc.matchAddCursor(1) end)
            map({ "n", "v" }, "<C-M-p>", function() mc.matchAddCursor(-1) end)
            map({ "n", "v" }, "<C-x>",   mc.deleteCursor)
            map("n", "<C-M-=>",          mc.alignCursors)
            map("n", "<C-M-leftmouse>",  mc.handleMouse)
            map("n", "<Esc>", function()
                if not mc.cursorsEnabled() then
                    mc.enableCursors()
                elseif mc.hasCursors() then
                    mc.clearCursors()
                else
                    vim.cmd("noh")
                end
            end)
        end,
    },

    -- write as su
    {
        "lambdalisue/vim-suda",
        cmd = "SudaWrite",
    },

    -- open in vscode
    {
        "declancm/vim2vscode",
        cmd = "Code",
    },

    -- mini plugins
    {
        "echasnovski/mini.move",
        event = { "BufReadPost", "BufNewFile" },
        config = true,
    },
    {
        "echasnovski/mini.ai",
        event = { "BufReadPost", "BufNewFile" },
        config = true,
    },
    {
        "echasnovski/mini.surround",
        event = { "BufReadPost", "BufNewFile" },
        config = true,
    },
}
