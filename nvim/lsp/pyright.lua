---@type vim.lsp.Config
return {
    cmd = { "basedpyright-langserver", "--stdio" },
    filetypes = { "python" },
    ---@param client vim.lsp.Client
    on_attach = function(client)
        if client.server_capabilities then -- disable semantic tokens
            client.server_capabilities.semanticTokensProvider = nil
        end
    end,
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
