--- @type LazyPluginSpec[]
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
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            local mc = require("multicursor-nvim")
            local map = vim.keymap.set
            mc.setup()

            map("n", "<C-M-j>", function() mc.lineAddCursor(1) end)
            map("n", "<C-M-k>", function() mc.lineAddCursor(-1) end)
            map("n", "<C-M-n>", function() mc.matchAddCursor(1) end)
            map("n", "<C-M-p>", function() mc.matchAddCursor(-1) end)
            map("n", "<C-x>", mc.deleteCursor)
            map("n", "<C-M-i>", mc.alignCursors)
            map("n", "<C-M-leftmouse>", mc.handleMouse)
            map("n", "<Esc>", function()
                if not mc.cursorsEnabled() then
                    mc.enableCursors()
                elseif mc.hasCursors() then
                    mc.clearCursors()
                else -- fallback to clear highlights
                    vim.cmd("noh")
                end
            end)
        end,
    },

    -- navigation in tmux
    {
        "alexghergh/nvim-tmux-navigation",
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
    -- {
    --     "christoomey/vim-tmux-navigator",
    --     keys = {
    --         { "<C-h>", "<Cmd><C-U>TmuxNavigateLeft<CR>" },
    --         { "<C-j>", "<Cmd><C-U>TmuxNavigateDown<CR>" },
    --         { "<C-k>", "<Cmd><C-U>TmuxNavigateUp<CR>" },
    --         { "<C-l>", "<Cmd><C-U>TmuxNavigateRight<CR>" },
    --     },
    -- },

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
        event = "CursorMoved",
        opts = {},
    },

    -- auto pairs
    {
        "echasnovski/mini.pairs",
        event = "InsertEnter",
        opts = {},
    }
}
