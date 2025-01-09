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

-- close nvimtree if the last buffer
autocmd("BufEnter", {
    group = vim.api.nvim_create_augroup("NvimTreeClose", { clear = true }),
    pattern = "NvimTree_*",
    callback = function()
        local layout = vim.api.nvim_call_function("winlayout", {})
        if layout[1] == "leaf" and vim.api.nvim_get_option_value("filetype", {}) == "NvimTree" and layout[3] == nil then
            vim.cmd("confirm quit")
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
