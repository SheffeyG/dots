local autocmd = vim.api.nvim_create_autocmd

-- keep the last cursor line
autocmd("BufReadPost", {
    pattern = { "*" },
    callback = function()
        if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
            vim.cmd("normal! g'\"", false)
        end
    end,
})

-- auto open explorer
autocmd("VimEnter", {
    callback = function(data)
        -- target is a directory
        if vim.fn.isdirectory(data.file) == 1 then
            vim.cmd.cd(data.file)
            Snacks.explorer.open()
            return
        end

        -- provide no name
        if data.file == "" and vim.bo[data.buf].buftype == "" then
            Snacks.explorer.open()
            return
        end

        -- wide window
        if vim.api.nvim_win_get_width(0) > 120 then
            Snacks.explorer.open({ enter = false })
            return
        end
    end,
})

-- auto into insert mode for terminal buffers
-- autocmd({ "WinEnter", "BufWinEnter", "TermOpen" }, {
--     callback = function(args)
--         if vim.startswith(vim.api.nvim_buf_get_name(args.buf), "term://") then
--             vim.cmd("startinsert")
--         end
--     end,
-- })
