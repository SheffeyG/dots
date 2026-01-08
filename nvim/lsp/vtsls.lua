---@brief
---
--- https://github.com/yioneko/vtsls
--- Install with `pnpm install -g @vtsls/language-server`

---@type vim.lsp.Config
return {
    cmd = { "vtsls", "--stdio" },
    init_options = { hostInfo = "neovim" },
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
    },
    root_dir = function(bufnr, on_dir)
        -- manager lock file
        local root_markers = {
            "package-lock.json",
            "yarn.lock",
            "pnpm-lock.yaml",
            "bun.lockb",
            "bun.lock",
            ".git",
        }

        -- exclude deno
        if vim.fs.root(bufnr, { "deno.json", "deno.lock" }) then return end

        -- fallback to the current working directory if no project root is found
        local project_root = vim.fs.root(bufnr, root_markers) or vim.fn.getcwd()

        on_dir(project_root)
    end,
}
