local autocmd = vim.api.nvim_create_autocmd

-- Auto same line when opening
autocmd("BufReadPost", {
    pattern = { "*" },
    callback = function()
        if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
            vim.api.nvim_exec("normal! g'\"", false)
        end
    end,
})

-- Auto close nvimtree with the last buffer
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
            -- Should quit, so we close all invalid windows.
            for _, w in ipairs(tree_wins) do
                vim.api.nvim_win_close(w, true)
            end
        end
    end,
})

-- Auto open nvimtree for some cases
autocmd("VimEnter", {
    callback = function(data)
        -- buffer is a real file on the disk
        -- local real_file = vim.fn.filereadable(data.file) == 1
        -- if real_file then
        --     -- open the tree, find the file but don't focus it
        --     require("nvim-tree.api").tree.toggle({ focus = false, find_file = true })
        --     return
        -- end

        -- buffer with no name
        local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
        if no_name then
            -- open the tree
            require("nvim-tree.api").tree.open()
            return
        end

        -- buffer is a directory
        local directory = vim.fn.isdirectory(data.file) == 1
        if directory then
            -- change to the directory
            vim.cmd.cd(data.file)
            require("nvim-tree.api").tree.open()
            return
        end
    end,
})
