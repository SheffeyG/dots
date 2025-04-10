---@type vim.lsp.Config
return {
    cmd = {
        "clangd",
        "--clang-tidy",
        "--background-index",
        "--offset-encoding=utf-8",
    },
    filetypes = { "c", "cpp", "cuda" },
    init_options = {
        clangdFileStatus = true,
        completeUnimported = true,
        usePlaceholders = true,
        semanticHighlighting = true,
    },
    on_attach = function()
        require("clangd_extensions").setup()

        local inlay_hints = require("clangd_extensions.inlay_hints")

        inlay_hints.setup_autocmd()
        inlay_hints.set_inlay_hints()
        inlay_hints.toggle_inlay_hints()
    end,
    root_markers = {
        ".clangd",
        "Makefile",
        "build.ninja",
        "compile_commands.json",
        "configure.in",
        "meson.build",
    },
    settings = {
        clangd = {
            semanticHighlighting = true,
            single_file_support = false,
        },
    },
    single_file_support = true,
}
