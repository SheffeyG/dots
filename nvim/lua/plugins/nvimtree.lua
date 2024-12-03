---@type NvPluginSpec
return {
    {
        "nvim-tree/nvim-web-devicons",
        opts = function()
            dofile(vim.g.base46_cache .. "devicons")
            return {
                override = {
                    default_icon = { icon = "󰈚", name = "Default" },
                    js = { icon = "󰌞", name = "js" },
                    ts = { icon = "󰛦", name = "ts" },
                    lock = { icon = "󰌾", name = "lock" },
                    [".gitignore"] = { icon = "󰊢", color = "#f54d27", cterm_color = "196", name = "GitIgnore" },
                    [".gitmodules"] = { icon = "󰊢", color = "#f54d27", cterm_color = "196", name = "GitModules" },
                    ["git"] = { icon = "󰊢", color = "#F14C28", cterm_color = "196", name = "GitLogo" },
                    ["robots.txt"] = { icon = "󰚩", name = "robots" },
                },
            }
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
                    custom = { "^.git$", "^__pycache__$" },
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
                                empty = "",
                                empty_open = "",
                                open = "",
                                symlink = "",
                            },
                            git = { unmerged = "" },
                        },
                    },
                },
            }
        end,
    },
}
