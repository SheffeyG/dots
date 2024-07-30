-- default LSP configures (lua stuff)
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")
local nvlsp = require("nvchad.configs.lspconfig")

-- LSP servers with default configures
local lsp_servers = { "clangd", "lua_ls", "ruff_lsp"}

return {
    "neovim/nvim-lspconfig",
    config = function()
        for _, lsp in ipairs(lsp_servers) do
            lspconfig[lsp].setup({
                on_init      = nvlsp.on_init,
                on_attach    = nvlsp.on_attach,
                capabilities = nvlsp.capabilities,
            })
        end
    end,
}
