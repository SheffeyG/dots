local icons = ICON.kind

---@module "blink.cmp"

---@type LazyPluginSpec
return {
    "saghen/blink.cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = "rafamadriz/friendly-snippets",
    version = "*",
    -- version = vim.g.is_arm and "*" or false,
    -- build = vim.g.is_arm and false or "cargo build --release",
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            ["<CR>"] = { "accept", "fallback" },
            ["<C-x>"] = { "cancel", "fallback" },
            ["<C-s>"] = { "show_signature", "hide_signature", "fallback" },
            ["<C-k>"] = { "fallback" },
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
                path = {
                    opts = {
                        get_cwd = function(ctx)
                            if ctx.mode == "cmdline" then return vim.fn.getcwd() end
                            return vim.fn.expand(("#%d:p:h"):format(ctx.bufnr))
                        end,
                    },
                },
                cmdline = {
                    fallbacks = { "path" },
                    min_keyword_length = function(ctx)
                        if string.find(ctx.line, " ") == nil then return 3 end
                        return 0
                    end,
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
                        { "label" },
                        { "provider" },
                    },
                    components = {
                        provider = {
                            text = function(ctx) -- text like [LSP]
                                return "[" .. ctx.item.source_name:sub(1, 3):upper() .. "]"
                            end,
                            highlight = "BlinkCmpLabelDetail",
                        },
                    },
                },
            },
            documentation = {
                auto_show = true,
                window = { border = "single", scrollbar = false },
            },
        },
        signature = {
            enabled = true,
            window = { border = "single" },
        },
        cmdline = {
            keymap = {
                ["<Tab>"] = {
                    function(cmp) -- auto accept if only one item
                        if #cmp.get_items() == 1 then return cmp.accept() end
                    end,
                    "show",
                    "select_next",
                },
                ["<CR>"] = {
                    function(cmp) -- only accept with visible menu
                        if cmp.is_menu_visible() then return cmp.accept() end
                    end,
                    "fallback",
                },
                ["<C-x>"] = { "cancel" },
            },
            -- make sure auto_insert is false to prevent flicker when accept
            completion = { list = { selection = { auto_insert = false } } },
        },
        fuzzy = { implementation = "prefer_rust" },
    },
    opts_extend = { "sources.default" },
}
