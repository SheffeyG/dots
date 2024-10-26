local lspconfig = require("lspconfig")
local default = require("nvchad.configs.lspconfig")

-- LSP servers
local servers = { "clangd", "lua_ls", "ruff" }

local function on_attach(client, bufnr)
    default.on_attach(client, bufnr)

    local function opts(desc)
        return { buffer = bufnr, desc = "LSP " .. desc }
    end

    -- remap some keybindings
    vim.keymap.set("n", "<leader>rn", require("nvchad.lsp.renamer"), opts("Rename"))
end

return {
    "neovim/nvim-lspconfig",
    config = function()
        for _, lsp in ipairs(servers) do
            lspconfig[lsp].setup({
                on_init = default.on_init,
                on_attach = on_attach,
                capabilities = default.capabilities,
            })
        end
    end,
}
