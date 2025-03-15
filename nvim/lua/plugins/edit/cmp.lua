do return {} end

---@diagnostic disable: missing-fields
local setup_cmp = function()
    local cmp = require("cmp")

    local mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-x>"] = cmp.mapping.close(),

        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        }),

        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif require("luasnip").expand_or_jumpable() then
                require("luasnip").expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif require("luasnip").jumpable(-1) then
                require("luasnip").jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }

    cmp.setup.cmdline({ "/", "?" }, {
        formatting = { fields = { "abbr" } },
        mapping = cmp.mapping.preset.cmdline(),
        sources = { { name = "buffer" } },
    })

    cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        matching = { disallow_symbol_nonprefix_matching = false },
        completion = { keyword_length = 3 },
        sources = { { name = "cmdline" } },
    })

    cmp.setup({
        window = {
            completion = {
                side_padding = 1,
                border = "single",
                scrollbar = false,
                winhighlight = "FloatBorder:NormalGrey,CursorLine:PmenuSel,Search:None",
            },
            documentation = {
                border = "single",
                max_width = 50,
                max_height = 15,
                winhighlight = "FloatBorder:NormalCyan",
            },
        },
        formatting = { fields = { "abbr", "kind" } },
        performance = { max_view_entries = 20 },
        mapping = mapping,
        snippet = {
            expand = function(args) require("luasnip").lsp_expand(args.body) end,
        },
        sources = {
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "buffer" },
            { name = "nvim_lua" },
            { name = "path" },
            { name = "lazy_dev" },
        },
    })
end

--- @type LazyPluginSpec[]
local deps = {
    -- cmp sources plugins
    { "saadparwaiz1/cmp_luasnip" },

    { "hrsh7th/cmp-nvim-lua" },

    { "hrsh7th/cmp-nvim-lsp" },

    { "hrsh7th/cmp-buffer" },

    { "hrsh7th/cmp-path" },

    { "hrsh7th/cmp-cmdline" },

    {
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
            require("luasnip").config.set_config(opts)

            -- vscode format
            require("luasnip.loaders.from_vscode").lazy_load()

            vim.api.nvim_create_autocmd("InsertLeave", {
                callback = function()
                    if
                        require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
                        and not require("luasnip").session.jump_active
                    then
                        require("luasnip").unlink_current()
                    end
                end,
            })
        end,
    },

    {
        "windwp/nvim-autopairs",
        opts = {
            fast_wrap = {},
            disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
            require("nvim-autopairs").setup(opts)
            -- setup cmp for autopairs
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
    },
}

--- @type LazyPluginSpec
return {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = deps,
    -- keep all setup inside a function, so it could be lazy loaded.
    config = function() setup_cmp() end,
}
