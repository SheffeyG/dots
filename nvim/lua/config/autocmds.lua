local autocmd = vim.api.nvim_create_autocmd

autocmd("BufReadPost", {
    desc = "keep the cursor position",
    pattern = { "*" },
    callback = function()
        if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
            vim.cmd("normal! g'\"", false) -- resume cursor position
        end
    end,
})

autocmd("VimEnter", {
    desc = "auto open explorer",
    callback = function(data)
        local ok, snacks = pcall(require, "snacks")
        if not ok then return end

        local wild_win = vim.api.nvim_win_get_width(0) > 120
        -- provide no name
        if data.file == "" and vim.bo[data.buf].buftype == "" then
            snacks.explorer.open({ auto_close = not wild_win })
            return
        end
        -- target is a directory
        if vim.fn.isdirectory(data.file) == 1 then
            vim.cmd.cd(data.file)
            snacks.explorer.open({ auto_close = not wild_win })
            return
        end
        -- file with wild_win
        if wild_win then snacks.explorer.open({ enter = false }) end
    end,
})

autocmd("QuitPre", {
    desc = "auto close explorer",
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

-- autocmd({ "WinEnter", "BufWinEnter", "TermOpen" }, {
--     desc = "auto insert mode for terminal buffers",
--     callback = function(args)
--         if vim.startswith(vim.api.nvim_buf_get_name(args.buf), "term://") then
--             vim.cmd("startinsert")
--         end
--     end,
-- })
