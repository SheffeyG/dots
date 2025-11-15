---@brief
--- https://github.com/rust-lang/rust-analyzer
--- Install with `rustup component add rust-analyzer`

local function reload_workspace(bufnr)
    local clients = vim.lsp.get_clients({ bufnr = bufnr, name = "rust_analyzer" })
    for _, client in ipairs(clients) do
        vim.notify("Reloading Cargo Workspace")
        ---@diagnostic disable-next-line:param-type-mismatch
        client:request("rust-analyzer/reloadWorkspace", nil, function(err)
            if err then error(tostring(err)) end
            vim.notify("Cargo workspace reloaded")
        end, 0)
    end
end

---@type vim.lsp.Config
return {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_markers = { "Cargo.toml", "rust-project.json" },
    capabilities = {
        experimental = {
            serverStatusNotification = true,
        },
    },
    settings = {
        ["rust-analyzer"] = {
            cachePriming = { enable = false },
            inlayHints = { enable = false },
            procMacro = { enable = false },
            cargo = { loadOutDirsFromCheck = false },
        },
    },
    before_init = function(init_params, config)
        -- https://github.com/microsoft/language-server-protocol/issues/567
        if config.settings and config.settings["rust-analyzer"] then
            init_params.initializationOptions = config.settings["rust-analyzer"]
        end
    end,
    on_attach = function(_, bufnr)
        vim.api.nvim_buf_create_user_command(
            bufnr,
            "LspCargoReload",
            function() reload_workspace(bufnr) end,
            { desc = "Reload current cargo workspace" }
        )
    end,
}
