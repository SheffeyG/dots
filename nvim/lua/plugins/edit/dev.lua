---@type LazyPluginSpec[]
return {
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy",
        opts = { preset = "powerline" },
        init = function() -- set diagnostic signcolumn icons
            local icons = require("config.icons").diag
            local diag = vim.diagnostic.severity
            vim.diagnostic.config({
                signs = {
                    text = {
                        [diag.ERROR] = icons.Error,
                        [diag.WARN] = icons.Warn,
                        [diag.HINT] = icons.Hint,
                        [diag.INFO] = icons.Info,
                    },
                },
            })
        end,
    },

    {
        "folke/lazydev.nvim",
        ft = "lua",
        ---@module "lazydev"
        ---@type lazydev.Config
        opts = {
            integrations = { cmp = false, coq = false, lspconfig = false },
            library = {
                { path = "lazy.nvim", words = { "Lazy.*Spec" } },
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                { path = "snacks.nvim", words = { "Snacks" } },
            },
        },
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "lua",
                callback = function()
                    local buf = vim.api.nvim_get_current_buf()
                    Snacks.debug.log(buf)
                    local ws = require("lazydev").find_workspace(buf)
                    Snacks.debug.log(ws)
                    if ws then vim.lsp.buf.add_workspace_folder(ws) end
                end,
            })
        end,
    },

    {
        "williamboman/mason.nvim",
        cmd = { "Mason" },
        opts = {
            PATH = "skip",
            ui = {
                backdrop = 60,
                width = 0.6,
                height = 0.8,
                icons = {
                    package_pending = " ",
                    package_installed = " ",
                    package_uninstalled = " ",
                },
            },
        },
        init = function() -- make sure manson/bin in the path even lazied
            local sep = vim.g.is_win and "\\" or "/"
            local delim = vim.g.is_win and ";" or ":"
            local prefix = table.concat({ vim.fn.stdpath("data"), "mason", "bin" }, sep)
            vim.env.PATH = prefix .. delim .. vim.env.PATH
        end,
    },
}
