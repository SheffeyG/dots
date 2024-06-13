local lspconfig = require("lspconfig")

local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local default_servers = { "clangd", "lua_ls"}

return {
    "neovim/nvim-lspconfig",
    config = function()
        -- default lsp servers 
        require("nvchad.configs.lspconfig").defaults()
        for _, lsp in ipairs(default_servers) do
            lspconfig[lsp].setup({
                on_attach = on_attach,
                on_init = on_init,
                capabilities = capabilities,
            })
        end

        -- python lsp servers config
        lspconfig.pylsp.setup{
          settings = {
            pylsp = {
              plugins = {
                pycodestyle = {
                  ignore = {'E401'},
                  maxLineLength = 150
                }
              }
            }
          }
        }
    end,
}
