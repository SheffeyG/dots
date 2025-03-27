-- diagnostic
local icons = require("config.icons").diag
local diag = vim.diagnostic.severity
local text = {
    [diag.ERROR] = icons.Error,
    [diag.WARN] = icons.Warn,
    [diag.HINT] = icons.Hint,
    [diag.INFO] = icons.Info,
}
vim.diagnostic.config({ signs = { text = text } })

-- lsp
vim.lsp.config("*", { root_markers = { ".git" } })

vim.iter(vim.api.nvim_get_runtime_file("lsp/*.lua", true))
    :map(function(config_path) -- match all lsp config files
        return vim.fs.basename(config_path):match("^(.*)%.lua$")
    end)
    :each(function(server_name) -- enable all matched lsp
        vim.lsp.enable(server_name, true)
    end)
