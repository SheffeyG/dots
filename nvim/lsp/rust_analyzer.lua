---@brief
---
--- https://github.com/rust-lang/rust-analyzer
--- Install with `rustup component add rust-analyzer`

---@type vim.lsp.Config
return {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_markers = { "Cargo.toml", "rust-project.json" },
    settings = {
        ["rust-analyzer"] = {
            cachePriming = { enable = false },
            inlayHints = { enable = false },
            lens = { enable = false },
            lru = { capacity = 32 },
        },
    },
}
