---@type vim.lsp.Config
return {
    cmd = { "clangd", "--background-index" },
    filetypes = { "c", "cpp", "cuda" },
    root_markers = {
        ".clangd",
        ".clang-format",
        "build",
        "Makefile",
        "configure",
        "CMakeLists.txt",
        "compile_commands.json",
    },
    -- https://clangd.llvm.org/config
    settings = {
        clangd = {
            -- fallbackFlags = { "-std=c++17" },
            headerInsertion = "never", -- "always", "iwyu", "never"
            compilationDatabasePath = "build",
        },
    },
    capabilities = {
        textDocument = {
            completion = { editsNearCursor = true },
        },
        offsetEncoding = { "utf-8", "utf-16" },
    },
    ---@diagnostic disable: undefined-field
    on_init = function(client, config)
        if config.offsetEncoding then -- offset extenstion
            client.offset_encoding = config.offsetEncoding
        end
    end,
}
