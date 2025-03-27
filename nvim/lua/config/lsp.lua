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

vim.lsp.config("*", { root_markers = { ".git" } })

vim.iter(vim.api.nvim_get_runtime_file("lsp/*.lua", true))
    :map(function(config_path) -- for each lsp config
        return vim.fs.basename(config_path):match("^(.*)%.lua$")
    end)
    :each(function(server_name) -- enable them
        vim.lsp.enable(server_name, true)
    end)
