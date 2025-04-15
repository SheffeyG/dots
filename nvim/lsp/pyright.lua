---@type vim.lsp.Config
return {
    cmd = { "basedpyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_markers = {
        "Pipfile",
        "pyproject.toml",
        "pyrightconfig.json",
        "requirements.txt",
        "setup.cfg",
        "setup.py",
        "venv",
        ".venv",
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
                reportUndefinedVariable = "none", -- ruff
                reportUnusedImport = "none", -- ruff
            },
            disableOrganizeImports = true, -- ruff
        },
    },
    single_file_support = true,
}
