local icons = ICON.diag

--- LSP ------------------------------------------
vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
    desc = "Enable all LSP servers",
    once = true,
    callback = function()
        local servers = {
            "basedpyright",
            "bashls",
            "clangd",
            "lua_ls",
            "rust_analyzer",
            "vtsls",
        }
        -- local servers = vim.iter(vim.api.nvim_get_runtime_file("lsp/*.lua", true))
        --     :map(function(file) return vim.fn.fnamemodify(file, ":t:r") end)
        --     :totable()
        vim.lsp.enable(servers)
    end,
})

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

--- Fold -----------------------------------------
vim.api.nvim_create_autocmd("LspAttach", {
    desc = "Use LSP as fold method",
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client:supports_method("textDocument/foldingRange") then
            local win = vim.api.nvim_get_current_win()
            vim.wo[win][0].foldmethod = "expr"
            vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
        end
    end,
})

vim.api.nvim_create_autocmd("LspDetach", { command = "setl foldexpr<" })

--- Keymaps --------------------------------------
---@param client vim.lsp.Client
---@param bufnr integer
local function on_attach(client, bufnr)
    ---@param lhs string
    ---@param rhs string|function
    ---@param desc? string
    ---@param mode? string|string[]
    local function keymap(lhs, rhs, desc, mode)
        mode = mode or "n"
        vim.keymap.set(mode, lhs, rhs, {
            desc = "LSP: " .. desc,
            buffer = bufnr,
        })
    end

    -- if client:supports_method("textDocument/onTypeFormatting", bufnr) then
    --     vim.lsp.on_type_formatting.enable(true, { bufnr = bufnr })
    -- end

    if client:supports_method("textDocument/inlineCompletion", bufnr) then
        vim.lsp.inline_completion.enable(true, { bufnr = bufnr })
        keymap("<C-y>", vim.lsp.inline_completion.get, "Accept NES", "i")
        keymap("<C-n>", vim.lsp.inline_completion.select, "Switch NES", "i")
    end

    if client:supports_method("textDocument/codeAction") then
        keymap("<leader>ca", vim.lsp.buf.code_action, "Code Action")
    end

    if client:supports_method("textDocument/rename") then --
        keymap("<leader>rn", vim.lsp.buf.rename, "Rename")
    end
end

vim.api.nvim_create_autocmd("LspAttach", {
    desc = "Configure LSP keymaps",
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client then on_attach(client, args.buf) end
    end,
})
