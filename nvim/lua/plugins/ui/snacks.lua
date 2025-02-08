--- @type LazyPluginSpec
return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = { enabled = true },
        quickfile = { enabled = true },
        indent = {
            enabled = true,
            indent = { hl = "IndentLine" },
            scope = { hl = "IndentLineCurrent" },
            animate = { duration = 10 },
        },
        input = { enabled = true },
        terminal = {
            enabled = true,
            win = { relative = "win" },
        },
        -- picker = { enabled = true },
        -- explorer = { enabled = true },
        -- statuscolumn = { enabled = true },
        rename = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = true },
        words = { enabled = true },
    },
}
