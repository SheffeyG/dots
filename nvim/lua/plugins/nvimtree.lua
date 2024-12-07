---@type NvPluginSpec
return {
    {
        "nvim-tree/nvim-web-devicons",
        opts = function()
            dofile(vim.g.base46_cache .. "devicons")
            return { override = require("nvchad.icons.devicons") }
        end,
    },

    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        opts = function()
            dofile(vim.g.base46_cache .. "nvimtree")
            return {
                git = { ignore = false },
                filters = {
                    dotfiles = false,
                    custom = { "^.git$" },
                },
                disable_netrw = true,
                hijack_cursor = true,
                sync_root_with_cwd = true,
                update_focused_file = { enable = true, update_root = false },
                view = { width = 30, preserve_window_proportions = true },
                renderer = {
                    root_folder_label = false,
                    highlight_git = true,
                    indent_markers = { enable = true },
                    icons = {
                        git_placement = "after",
                        symlink_arrow = "->",
                        glyphs = {
                            default = "󰈚",
                            folder = {
                                default = "",
                                open = "",
                                empty = "",
                                empty_open = "",
                                symlink = "",
                            },
                            git = {
                                unmerged = "",
                                renamed = "->",
                                untracked = "",
                                ignored = "",
                                deleted = "󱂦",
                            },
                        },
                    },
                },
            }
        end,
    },
}
