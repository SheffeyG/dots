local icons = require("custom.icons").diag

--- Diagnostic -----------------------------------
vim.diagnostic.config({
    signs = { text = { icons.Error, icons.Warn, icons.Hint, icons.Info } },
    -- virtual_text = {
    --     current_line = true,
    --     severity = { max = severity.WARN },
    -- },
    -- virtual_lines = {
    --     current_line = true,
    --     severity = { min = severity.ERROR },
    -- },
})

--- LSP ------------------------------------------
vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
    once = true,
    callback = function()
        local server_configs = vim.iter(vim.api.nvim_get_runtime_file("lsp/*.lua", true))
            :map(function(file) return vim.fn.fnamemodify(file, ":t:r") end)
            :totable()
        vim.lsp.enable(server_configs)
    end,
})

--- Fold -----------------------------------------
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

--- NES ------------------------------------------
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local bufnr = args.buf
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

        if client:supports_method("textDocument/inlineCompletion", bufnr) then
            vim.lsp.inline_completion.enable(true, { bufnr = bufnr })

            vim.keymap.set(
                "i",
                "<C-y>",
                vim.lsp.inline_completion.get,
                { desc = "LSP: accept inline completion", buffer = bufnr }
            )
            vim.keymap.set(
                "i",
                "<C-n>",
                vim.lsp.inline_completion.select,
                { desc = "LSP: switch inline completion", buffer = bufnr }
            )
        end
    end,
})
