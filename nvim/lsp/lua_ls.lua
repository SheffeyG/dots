---@type vim.lsp.Config
return {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    ---@param client vim.lsp.Client
    on_init = function(client)
        -- use stylua via conform.nvim
        client.server_capabilities.documentFormattingProvider = nil
        client.server_capabilities.documentRangeFormattingProvider = nil
    end,
    settings = {
        Lua = {
            codeLens = { enable = true },
            doc = { privateName = { "^_" } },
            format = { enable = false },
            hover = { expandAlias = false },
            runtime = { version = "LuaJIT" },
            telemetry = { enable = false },
            completion = {
                autoRequire = false,
                callSnippet = "Replace",
                keywordSnippet = "Both",
                workspaceWord = true,
            },
            diagnostics = {
                disable = { "missing-fields" },
                globals = { "vim", "require", "pcall", "Snacks" },
                unusedLocalExclude = { "_*" },
            },
        },
    },
    root_markers = {
        ".luacheckrc",
        ".luarc.json",
        ".luarc.jsonc",
        ".stylua.toml",
        "lazy-lock.json",
        "selene.toml",
        "selene.yml",
        "stylua.toml",
        "lua/",
    },
    single_file_support = true,
}
