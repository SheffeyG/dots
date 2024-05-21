local nvtree_opts = {
    renderer = {
        icons = {
            git_placement = "after",
            symlink_arrow = "➜",
        },
    },
}
local devicons = require("nvchad.icons.devicons")

if vim.fn.has("termux") == 1 then
    -- override some nvtree opts for termux
    nvtree_opts = {
        renderer = {
            icons = {
                git_placement = "after",
                padding = "",
                symlink_arrow = "➜",
                glyphs = {
                    default = "󰈚 ",
                    symlink = " ",
                    folder = {
                        default = " ",
                        empty = " ",
                        empty_open = " ",
                        open = " ",
                        symlink = " ",
                        symlink_open = " ",
                        arrow_open = "",
                        arrow_closed = "",
                    },
                    git = {
                        unstaged = "✗",
                        staged = "✓",
                        unmerged = "",
                        renamed = "➜",
                        untracked = "+",
                        deleted = "-",
                        ignored = "◌",
                    },
                },
            },
        },
    }

    -- override all devicons for termux
    local nvtree_devicons = require("nvim-web-devicons").get_icons()
    local nvchad_devicons = require("nvchad.icons.devicons")

    for name, data in pairs(nvtree_devicons) do
        local icon = data.icon
        local pad = vim.api.nvim_strwidth(icon) == 1 and " " or ""
        devicons[name] = vim.tbl_extend("force", data, { icon = icon .. pad })
    end

    for name, data in pairs(nvchad_devicons) do
        local icon = data.icon
        local pad = vim.api.nvim_strwidth(icon) == 1 and " " or ""
        devicons[name] = vim.tbl_extend("force", data, { icon = icon .. pad })
    end
end

return {
    {
        "nvim-tree/nvim-tree.lua",
        opts = nvtree_opts,
        config = function(_, opts)
            dofile(vim.g.base46_cache .. "nvimtree")
            require("nvim-tree").setup(opts)
        end,
    },

    {
        "nvim-tree/nvim-web-devicons",
        opts = devicons,
        config = function(_, opts)
            dofile(vim.g.base46_cache .. "devicons")
            require("nvim-web-devicons").setup(opts)
        end,
    },
}
