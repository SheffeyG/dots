---@type NvPluginSpec
return {
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
                                deleted = "󱂦",
                                ignored = " ",
                            },
                        },
                    },
                },
            }
        end,
    },

    {
        "nosduco/remote-sshfs.nvim",
        dependencies = "nvim-telescope/telescope.nvim",
        cmd = { "RemoteSSHFSConnect" },
        keys = {
            {
                "<leader>rc",
                "<cmd>RemoteSSHFSConnect<CR>",
                mode = { "n" },
                desc = "Remote connection",
            },
        },
        opts = {},
    },
}
