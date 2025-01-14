-- settings for each lsp server
local server_settings = {
    --- C ---
    clangd = {},
    --- Rust ---
    rust_analyzer = {},
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
                globals = { "vim" },
            },
            workspace = {
                library = {
                    vim.fn.expand("$VIMRUNTIME/lua"),
                    vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
                    vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
                    vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
                    "${3rd}/luv/library",
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
        },
    },
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem = {
    documentationFormat = { "markdown", "plaintext" },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
        properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
        },
    },
}

local on_attach = function(_, bufnr)
    local map = vim.keymap.set
    local function opts(desc)
        return { buffer = bufnr, desc = "LSP " .. desc }
    end

    map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
    map("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
    map("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
    map("n", "gr", vim.lsp.buf.references, opts("Show references"))
    map("n", "<leader>sh", vim.lsp.buf.signature_help, opts("Show signature help"))
    map("n", "<leader>hw", vim.lsp.buf.document_highlight, opts("Add cursorword hl"))
    map("n", "<leader>hc", vim.lsp.buf.clear_references, opts("Remove cursorword hl"))
    -- map("n", "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
    map("n", "<leader>D", vim.lsp.buf.type_definition, opts("Go to type definition"))
    map("n", "<leader>rn", require("nvchad.lsp.renamer"), opts("Rename"))

    -- highlight cursor word
    -- if client.server_capabilities.documentHighlightProvider then
    --     vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
    --     vim.api.nvim_clear_autocmds({ buffer = bufnr, group = "lsp_document_highlight" })
    --     vim.api.nvim_create_autocmd("CursorHold", {
    --         callback = vim.lsp.buf.document_highlight,
    --         buffer = bufnr,
    --         group = "lsp_document_highlight",
    --         desc = "Document Highlight",
    --     })
    --     vim.api.nvim_create_autocmd("CursorMoved", {
    --         callback = vim.lsp.buf.clear_references,
    --         buffer = bufnr,
    --         group = "lsp_document_highlight",
    --         desc = "Clear All the References",
    --     })
    -- end
end

local on_init = function(client, _)
    -- disable semantic tokens
    if client.supports_method("textDocument/semanticTokens") then
        client.server_capabilities.semanticTokensProvider = nil
    end
end

---@type NvPluginSpec
return {
    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
        opts = function()
            dofile(vim.g.base46_cache .. "mason")
            return {
                PATH = "skip",
                ui = {
                    icons = {
                        package_pending = " ",
                        package_installed = " ",
                        package_uninstalled = " ",
                    },
                },
            }
        end,
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            dofile(vim.g.base46_cache .. "lsp")
            -- dofile(vim.g.base46_cache .. "semantic_tokens")
            for server, settings in pairs(server_settings) do
                require("lspconfig")[server].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                    on_init = on_init,
                    settings = settings,
                })
            end
        end,
    },
}
