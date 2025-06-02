---@type vim.lsp.Config
return {
    cmd = { "basedpyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_markers = {
        ".venv",
        "venv",
        "pyproject.toml",
        "pyrightconfig.json",
        "requirements.txt",
    },
    settings = {
        basedpyright = {
            analysis = {
                typeCheckingMode = "basic", -- standard
                autoImportCompletions = false,
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                reportMissingTypeStubs = false,
                reportUnreachable = "none",
                useLibraryCodeForTypes = true,
                reportUndefinedVariable = "none",
                reportUnusedImport = "none",
            },
            disableOrganizeImports = true, -- ruff
        },
    },
    single_file_support = true,
}
