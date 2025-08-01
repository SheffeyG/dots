---@type LazyPluginSpec[]
return {
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy",
        opts = { preset = "powerline" },
    },

    {
        "folke/lazydev.nvim",
        ft = "lua",
        ---@module "lazydev"
        ---@type lazydev.Config
        opts = {
            integrations = { cmp = false, lspconfig = false },
            library = {
                { path = "lazy.nvim", words = { "Lazy.*Spec" } },
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                { path = "snacks.nvim", words = { "Snacks" } },
                { path = "noice.nvim", words = { "NoiceConfig" } },
            },
        },
    },

    {
        "mason-org/mason.nvim",
        cmd = { "Mason", "MasonInstall" },
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
