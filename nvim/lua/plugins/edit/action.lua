---@type LazyPluginSpec[]
return {
    -- formatter
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "ruff_format", "ruff_organize_imports" },
                ["_"] = { "trim_whitespace", lsp_format = "last" },
            },
        },
        keys = {
            {
                "<leader>fm",
                function() require("conform").format({ lsp_fallback = true }) end,
                desc = "Format Buffer",
                mode = { "n", "v" },
            },
        },
    },

    -- multiple cursors
    {
        "jake-stewart/multicursor.nvim",
        keys = {
            { "<C-M-j>", function() require("multicursor-nvim").lineAddCursor(1) end },
            { "<C-M-k>", function() require("multicursor-nvim").lineAddCursor(-1) end },
            { "<C-M-n>", function() require("multicursor-nvim").matchAddCursor(1) end },
            { "<C-M-p>", function() require("multicursor-nvim").matchAddCursor(-1) end },
        },
        config = function()
            local mc = require("multicursor-nvim")
            mc.setup()
            mc.addKeymapLayer(function(layerSet)
                layerSet("n", "=", mc.alignCursors)
                layerSet("n", "<leftmouse>", mc.handleMouse)
                layerSet("n", "j", function() mc.lineSkipCursor(1) end)
                layerSet("n", "k", function() mc.lineSkipCursor(-1) end)
                layerSet("n", "<Esc>", function() mc.clearCursors() end)
            end)
        end,
    },

    -- navigation in tmux
    {
        "alexghergh/nvim-tmux-navigation",
        cond = vim.g.is_tmux,
        event = "VeryLazy",
        config = function()
            local nvim_tmux_nav = require("nvim-tmux-navigation")
            nvim_tmux_nav.setup({ disable_when_zoomed = true })
            local map = vim.keymap.set
            map("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
            map("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
            map("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
            map("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
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

    -- show keymaps
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = { delay = 500 },
    },

    -- move lines
    {
        "echasnovski/mini.move",
        keys = { "<M-h>", "<M-j>", "<M-k>", "<M-l>" },
        opts = {},
    },

    -- auto pairs
    {
        "echasnovski/mini.pairs",
        event = "InsertEnter",
        opts = {},
    },
}
