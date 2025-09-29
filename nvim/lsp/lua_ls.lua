---@type vim.lsp.Config
return {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
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
    settings = {
        Lua = {
            codeLens = { enable = true },
            doc = { privateName = { "^_" } },
            format = { enable = false },
            hover = { expandAlias = false },
            runtime = { version = "LuaJIT" },
            telemetry = { enable = false },
            -- semantic = { enable = false },
            completion = {
                autoRequire = false,
                callSnippet = "Replace",
                keywordSnippet = "Both",
                workspaceWord = true,
            },
            diagnostics = {
                disable = { "missing-fields" },
                globals = {
                    "vim",
                    "require",
                    "pcall",
                    "Snacks",
                },
                unusedLocalExclude = { "^_" },
            },
        },
    },
    single_file_support = true,
}
