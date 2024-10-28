local nvtree_opts = {
    renderer = {
        icons = {
            git_placement = "after",
            symlink_arrow = "->",
        },
    },
}

local devicons = require("nvchad.icons.devicons")

-- override some nvtree opts for termux
if vim.fn.has("termux") == 1 then
    nvtree_opts = {
        renderer = {
            icons = {
                git_placement = "after",
                padding = "",
                symlink_arrow = "->",
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
                        renamed = ">",
                        untracked = "+",
                        deleted = "-",
                        ignored = "◌",
                    },
                },
            },
        },
    }

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
        dofile(vim.g.base46_cache .. "nvimtree"),
        opts = nvtree_opts,
    },

    {
        "nvim-tree/nvim-web-devicons",
        dofile(vim.g.base46_cache .. "devicons"),
        opts = devicons,
    },
}
