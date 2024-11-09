---@type NvPluginSpec
return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        build = ":TSUpdate",

        opts = {
            ensure_installed = {
                "c",
                "cpp",
                "python",
                "lua",
                "luadoc",
                "vim",
                "vimdoc",
                "html",
                "css",
                "javascript",
                "json",
                "yaml",
                "toml",
                "printf",
                "markdown",
            },

            highlight = {
                enable = true,
                use_languagetree = true,
            },
            indent = { enable = true },
        },

        config = function(_, opts)
            pcall(function()
                dofile(vim.g.base46_cache .. "syntax")
                dofile(vim.g.base46_cache .. "treesitter")
                -- dofile(vim.g.base46_cache .. "semantic_tokens")
            end)

            require("nvim-treesitter.configs").setup(opts)
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = "nvim-treesitter/nvim-treesitter",
        event = { "CursorMoved" },
        opts = {
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                    },
                },
                swap = {
                    enable = true,
                    swap_next = {
                        ["<leader>wn"] = "@parameter.inner",
                    },
                    swap_previous = {
                        ["<leader>wp"] = "@parameter.inner",
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = {
                        ["<leader>nf"] = "@function.outer",
                        ["<leader>nc"] = "@class.outer",
                    },
                    goto_previous_start = {
                        ["<leader>pf"] = "@function.outer",
                        ["<leader>pc"] = "@class.outer",
                    },
                },
            },
        },

        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
}
