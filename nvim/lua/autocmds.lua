local autocmd = vim.api.nvim_create_autocmd

-- move to the same line when opening
autocmd("BufReadPost", {
    pattern = { "*" },
    callback = function()
        if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
            vim.cmd("normal! g'\"", false)
        end
    end,
})

-- close nvimtree if the last buffer
autocmd("QuitPre", {
    callback = function()
        local tree_wins = {}
        local floating_wins = {}
        local wins = vim.api.nvim_list_wins()
        for _, w in ipairs(wins) do
            local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
            if bufname:match("NvimTree_") ~= nil then
                table.insert(tree_wins, w)
            end
            if vim.api.nvim_win_get_config(w).relative ~= "" then
                table.insert(floating_wins, w)
            end
        end
        if 1 == #wins - #floating_wins - #tree_wins then
            -- should quit, so we close all invalid windows.
            for _, w in ipairs(tree_wins) do
                vim.api.nvim_win_close(w, true)
            end
        end
    end,
})

-- open nvimtree for some cases
autocmd("VimEnter", {
    callback = function(data)
        -- when buffer has no name
        local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
        if no_name then
            require("nvim-tree.api").tree.open()
            return
        end

        -- when buffer is a directory
        local is_dir = vim.fn.isdirectory(data.file) == 1
        if is_dir then
            -- change to the directory
            vim.cmd.cd(data.file)
            require("nvim-tree.api").tree.open()
            return
        end

        -- when the window width is large
        local win_width = vim.api.nvim_win_get_width(0)
        if win_width > 120 then
            require("nvim-tree.api").tree.toggle({ focus = false })
            return
        end
    end,
})
