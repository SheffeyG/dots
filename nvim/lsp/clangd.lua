---@type vim.lsp.Config
return {
    cmd = {
        "clangd",
        "--clang-tidy",
        "--background-index",
    },
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
    init_options = {
        clangdFileStatus = true,
        completeUnimported = false,
        usePlaceholders = true,
        semanticHighlighting = true,
    },
    settings = {
        clangd = {
            semanticHighlighting = true,
            single_file_support = false,
        },
    },
    single_file_support = true,
}
