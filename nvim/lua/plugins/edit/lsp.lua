-- settings for each lsp server
local server_settings = {
    --- C ---
    clangd = {},
    --- Rust ---
    rust_analyzer = {},
    --- Bash ---
    bashls = {},
    --- Python ---
    basedpyright = {
        basedpyright = {
            analysis = {
                typeCheckingMode = "basic",
            },
        },
    },
    --- Lua ---
    lua_ls = {
        Lua = {
            diagnostics = {
                globals = { "vim", "Snacks", "require" },
            },
        },
    },
}

local icons = require("config.icons").diag

local capabilities = vim.lsp.protocol.make_client_capabilities()

local on_attach = function(_, bufnr)
    local map = vim.keymap.set
    local function opts(desc) return { buffer = bufnr, desc = desc } end

    map("n", "<leader>rn", vim.lsp.buf.rename, opts("Rename"))
    map("n", "<leader>ca", vim.lsp.buf.code_action, opts("Code Action"))
end

local on_init = function(client, _)
    vim.diagnostic.config({ virtual_text = false })
    -- disable semantic tokens
    if client.supports_method("textDocument/semanticTokens") then
        client.server_capabilities.semanticTokensProvider = nil
    end
end

--- @type LazyPluginSpec[]
local deps = {
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        opts = { preset = "powerline" },
    },
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "lazy.nvim", words = { "Lazy.*Spec" } },
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                { path = "snacks.nvim", words = { "Snacks" } },
            },
        },
    },
}

--- @type LazyPluginSpec[]
return {
    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
        opts = {
            PATH = "skip",
            ui = {
                backdrop = 60,
                width = 0.6,
                height = 0.8,
                icons = {
                    package_pending = " ",
                    package_installed = " ",
                    package_uninstalled = " ",
                },
            },
        },
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = deps,
        config = function()
            for server, settings in pairs(server_settings) do
                require("lspconfig")[server].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                    on_init = on_init,
                    settings = settings,
                })
            end
        end,
        init = function()
            vim.diagnostic.config({
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = icons.Error,
                        [vim.diagnostic.severity.WARN] = icons.Warn,
                        [vim.diagnostic.severity.HINT] = icons.Hint,
                        [vim.diagnostic.severity.INFO] = icons.Info,
                    },
                },
            })
        end,
    },
}
