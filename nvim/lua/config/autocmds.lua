local autocmd = vim.api.nvim_create_autocmd

-- keep the last cursor line
autocmd("BufReadPost", {
    pattern = { "*" },
    callback = function()
        if -- when the buffer register works
            vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$")
        then
            vim.cmd("normal! g'\"", false)
        end
    end,
})

-- auto open explorer
autocmd("VimEnter", {
    callback = function(data)
        local wild_win = vim.api.nvim_win_get_width(0) > 120

        -- provide no name
        if data.file == "" and vim.bo[data.buf].buftype == "" then
            Snacks.explorer.open({ auto_close = not wild_win })
            return
        end

        -- target is a directory
        if vim.fn.isdirectory(data.file) == 1 then
            vim.cmd.cd(data.file)
            Snacks.explorer.open({ auto_close = not wild_win })
            return
        end

        -- file with wild_win
        if wild_win then Snacks.explorer.open({ enter = false }) end
    end,
})

-- auto close explorer
autocmd("QuitPre", {
    callback = function()
        local snacks_windows = {}
        local floating_windows = {}
        local windows = vim.api.nvim_list_wins()
        for _, w in ipairs(windows) do
            local filetype = vim.api.nvim_get_option_value("filetype", {
                buf = vim.api.nvim_win_get_buf(w),
            })
            if filetype:match("snacks_") ~= nil then
                table.insert(snacks_windows, w)
            elseif vim.api.nvim_win_get_config(w).relative ~= "" then
                table.insert(floating_windows, w)
            end
        end
        if -- when there's only one non-float windows
            1 == #windows - #floating_windows - #snacks_windows
            and vim.api.nvim_win_get_config(0).relative == ""
        then
            for _, w in ipairs(snacks_windows) do
                vim.api.nvim_win_close(w, true)
            end
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
