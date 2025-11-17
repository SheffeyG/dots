---@brief
--- https://github.com/luals/lua-language-server
--- Install with `pacman -S lua-language-server`

return {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = {
        ".emmyrc.json",
        ".luarc.json",
        ".luarc.jsonc",
        ".luacheckrc",
        ".stylua.toml",
        "stylua.toml",
        "selene.toml",
        "selene.yml",
        ".git",
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
