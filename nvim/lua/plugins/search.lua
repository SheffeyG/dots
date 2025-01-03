---@type NvPluginSpec
return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = "nvim-treesitter/nvim-treesitter",
        cmd = "Telescope",
        opts = function()
            dofile(vim.g.base46_cache .. "telescope")
            return {
                defaults = {
                    prompt_prefix = "   ",
                    selection_caret = " ",
                    entry_prefix = " ",
                    sorting_strategy = "ascending",
                    layout_config = {
                        horizontal = {
                            prompt_position = "top",
                            preview_width = 0.55,
                        },
                        width = 0.87,
                        height = 0.80,
                    },
                },

                extensions_list = { "themes", "terms" },
                extensions = {},
            }
        end,
    },

    {
        "VonHeikemen/searchbox.nvim",
        version = "*",
        dependencies = "MunifTanjim/nui.nvim",
        keys = {
            {
                "<leader>ss",
                "<cmd>SearchBoxMatchAll<CR>",
                mode = { "n" },
                desc = "SearchBox search",
            },
            {
                "<leader>sr",
                "<cmd>SearchBoxReplace<CR>",
                mode = { "n" },
                desc = "SearchBox search and replace",
            },
            {
                "<leader>ss",
                "<cmd>SearchBoxMatchAll visual_mode=true<CR>",
                mode = { "v" },
                desc = "SearchBox search in selected text",
            },
            {
                "<leader>sr",
                "<cmd>SearchBoxReplace visual_mode=true<CR>",
                mode = { "v" },
                desc = "SearchBox search and replace in selected text",
            },
        },
    },
}
