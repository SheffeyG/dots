---@type vim.lsp.Config
return {
    cmd = { "ty", "server" },
    filetypes = { "python" },
    root_markers = {
        ".venv",
        "venv",
        "pyproject.toml",
        "ty.toml",
    },
}
