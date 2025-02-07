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

-- open nvimtree for some cases
autocmd("VimEnter", {
    callback = function(data)
        -- provide no name
        local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
        if no_name then
            require("nvim-tree.api").tree.open()
            return
        end

        -- open a directory
        local is_dir = vim.fn.isdirectory(data.file) == 1
        if is_dir then
            -- change to the directory
            vim.cmd.cd(data.file)
            require("nvim-tree.api").tree.open()
            return
        end

        -- wide window
        local win_width = vim.api.nvim_win_get_width(0)
        if win_width > 120 then
            require("nvim-tree.api").tree.toggle({ focus = false })
            return
        end
    end,
})

-- auto into insert mode for terminal buffers
autocmd({ "WinEnter", "BufWinEnter", "TermOpen" }, {
    callback = function(args)
        if vim.startswith(vim.api.nvim_buf_get_name(args.buf), "term://") then
            vim.cmd("startinsert")
        end
    end,
})
