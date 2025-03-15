--- @type LazyPluginSpec
return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = "MunifTanjim/nui.nvim",
    opts = {
        presets = {
            bottom_search = true,
            long_message_to_split = true,
        },
        views = {
            cmdline_popup = {
                size = { width = 0.3 },
                border = { style = "none", padding = { 2, 3 } },
                win_options = { winhighlight = { Normal = "NormalDark" } },
            },
            cmdline_input = {
                win_options = { winhighlight = { Normal = "Normal" } },
            },
            hover = {
                scrollbar = false,
                size = { max_width = 50, max_height = 15 },
                border = { style = "single", padding = { 0, 1 } },
                position = { row = 2, col = 0 },
                win_options = { winhighlight = { FloatBorder = "NormalCyan" } },
            },
            mini = { timeout = 3000 },
        },
        lsp = {
            progress = { enabled = false },
            override = {
                ["cmp.entry.get_documentation"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            },
        },
    },
    keys = {
        { "<leader>mh", "<CMD>NoiceAll<CR>", desc = "Message History" },
    },
}
