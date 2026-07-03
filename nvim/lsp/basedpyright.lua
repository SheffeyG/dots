---@brief
---
--- https://detachhead.github.io/basedpyright
--- Install with `uv tool install basedpyright`

---@type vim.lsp.Config
return {
    cmd = { "basedpyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_markers = {
        "pyproject.toml",
        ".venv",
        "venv",
        "setup.py",
        "setup.cfg",
        "requirements.txt",
        "Pipfile",
        "pyrightconfig.json",
        ".git",
    },
    settings = {
        basedpyright = {
            analysis = {
                typeCheckingMode = "off",
                autoImportCompletions = false,
                autoSearchPaths = true,
                autoFormatStrings = true,
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
