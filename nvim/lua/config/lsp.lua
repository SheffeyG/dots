-- diagnostic
local icons = require("custom.icons").diag
local severity = vim.diagnostic.severity
local text = {
    [severity.ERROR] = icons.Error,
    [severity.WARN] = icons.Warn,
    [severity.HINT] = icons.Hint,
    [severity.INFO] = icons.Info,
}

vim.diagnostic.config({
    signs = { text = text },
    -- virtual_text = {
    --     current_line = true,
    --     severity = { max = severity.WARN },
    -- },
    -- virtual_lines = {
    --     current_line = true,
    --     severity = { min = severity.ERROR },
    -- },
})

if vim.fn.has("nvim-0.11") == 1 then
    -- lsp configure for all clients
    vim.lsp.config("*", { root_markers = { ".git" } })

    -- enable all lsp clients
    vim.iter(vim.api.nvim_get_runtime_file("lsp/*.lua", true))
        :map(function(config_path) -- match all lsp client name
            return vim.fs.basename(config_path):match("^(.*)%.lua$")
        end)
        :each(function(server_name) -- enable all matched lsp
            vim.lsp.enable(server_name, true)
        end)
end

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        -- set lsp as fold method if possiable
        if client and client:supports_method("textDocument/foldingRange") then
            local win = vim.api.nvim_get_current_win()
            vim.wo[win][0].foldmethod = "expr"
            vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
        end
    end,
})

vim.api.nvim_create_autocmd("LspDetach", { command = "setl foldexpr<" })
