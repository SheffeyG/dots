local icons = require("config.icons").kind

--- @type LazyPluginSpec
return {
    ---@module "blink.cmp"
    "saghen/blink.cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    -- version = "*",
    build = "cargo build --release",
    ---@type blink.cmp.Config
    opts = {
        keymap = { preset = "enter" },
        appearance = {
            nerd_font_variant = "normal",
            kind_icons = icons,
        },
        sources = {
            default = {
                "lsp",
                "path",
                "snippets",
                "buffer",
                "lazydev",
            },
            providers = {
                lsp = {
                    name = "LSP",
                    fallbacks = { "lazydev" },
                },
                lazydev = {
                    name = "Development",
                    module = "lazydev.integrations.blink",
                },
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
                        { "label", "label_description", gap = 1 },
                        { "provider" },
                    },
                    components = {
                        provider = {
                            text = function(ctx)
                                return "[" .. ctx.item.source_name:sub(1, 3):upper() .. "]"
                            end,
                            highlight = "NormalGrey",
                        },
                    },
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
