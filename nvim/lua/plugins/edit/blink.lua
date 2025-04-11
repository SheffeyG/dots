local icons = require("custom.icons").kind

---@type blink.cmp.DrawComponent
local provider = {
    text = function(ctx) -- text like "[LSP]"
        return "[" .. ctx.item.source_name:sub(1, 3):upper() .. "]"
    end,
    highlight = "NormalGrey",
}

---@type LazyPluginSpec
return {
    "saghen/blink.cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = "rafamadriz/friendly-snippets",
    version = "*",
    -- version = vim.g.is_arm and "*" or false,
    -- build = vim.g.is_arm and false or "cargo build --release",
    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            preset = "enter",
            ["<C-x>"] = { "cancel" },
        },
        appearance = {
            nerd_font_variant = "normal",
            kind_icons = icons,
        },
        sources = {
            default = {
                "lsp",
                "lazydev",
                "path",
                "snippets",
                "buffer",
            },
            providers = {
                lazydev = {
                    name = "dev",
                    module = "lazydev.integrations.blink",
                },
                cmdline = { min_keyword_length = 3 },
            },
        },
        completion = {
            menu = {
                border = "single",
                scrollbar = false,
                min_width = 1,
                draw = {
                    columns = {
                        { "kind_icon" },
                        { "label" },
                        { "provider" },
                    },
                    components = { provider = provider },
                },
            },
            documentation = {
                auto_show = true,
                window = { border = "single", scrollbar = false },
            },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
}
