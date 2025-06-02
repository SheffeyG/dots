---@type vim.lsp.Config
return {
    cmd = { "clangd", "--background-index" },
    filetypes = { "c", "cpp", "cuda" },
    root_markers = {
        ".clangd",
        ".clang-format",
        "Makefile",
        "CMakeLists.txt",
        "compile_commands.json",
        "configure.in",
        "build.ninja",
        "meson.build",
    },
    -- https://clangd.llvm.org/config
    init_options = {
        headerInsertion = "never",
        -- compilationDatabasePath = "./build/",
        -- compileCommandsDir = "./build/compile_commands.json"
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
