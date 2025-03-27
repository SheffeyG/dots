local lsp = vim.lsp

lsp.config("*", { root_markers = { ".git" } })

---@type vim.lsp.Config
lsp.config.luals = {
    cmd = { "lua-language-server" },
    root_markers = { ".stylua.toml" },
    filetypes = { "lua" },
    settings = {
        Lua = {
            workspace = {
                library = {
                    "${3rd}/luv/library",
                    vim.fn.expand("$VIMRUNTIME/lua"),
                    vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
                },
            },
            diagnostics = { globals = { "vim", "Snacks" } },
        },
    },
}

---@type vim.lsp.Config
lsp.config.pyright = {
    cmd = { "basedpyright-langserver", "--stdio" },
    root_markers = { ".venv" },
    filetypes = { "python" },
    settings = {
        basedpyright = {
            analysis = {
                typeCheckingMode = "basic",
            },
        },
    },
}

---@type vim.lsp.Config
lsp.config.clangd = {
    cmd = { "clangd", "--background-index" },
    root_markers = { ".clangd", "compile_commands.json" },
    filetypes = { "c", "cpp" },
}

lsp.enable({ "luals", "pyright", "clangd" })
