local autocmd = vim.api.nvim_create_autocmd
local group = vim.api.nvim_create_augroup("sheffey-autocmds", { clear = true })

local function should_save_view(buf)
    return vim.bo[buf].buftype == "" and vim.api.nvim_buf_get_name(buf) ~= ""
end

autocmd("BufWinLeave", {
    group = group,
    desc = "Save cursor and fold view",
    callback = function(args)
        if should_save_view(args.buf) then
            vim.api.nvim_buf_call(args.buf, function() vim.cmd("silent! mkview") end)
        end
    end,
})

autocmd("BufWinEnter", {
    group = group,
    desc = "Restore cursor and fold view",
    callback = function(args)
        if should_save_view(args.buf) then
            vim.defer_fn(function()
                if vim.api.nvim_buf_is_valid(args.buf) then
                    vim.api.nvim_buf_call(args.buf, function() vim.cmd("silent! loadview") end)
                end
            end, 50)
        end
    end,
})

autocmd({ "BufLeave", "FocusLost" }, {
    group = group,
    desc = "Write buffers when leave it",
    callback = function(args)
        local buf = args.buf
        if -- check if the file should be saved
            vim.bo[buf].modified
            and not vim.bo[buf].readonly
            and vim.api.nvim_buf_get_name(buf) ~= ""
            and vim.bo[buf].buftype == ""
        then
            vim.api.nvim_buf_call(buf, function() vim.cmd("silent! update") end)
        end
    end,
})

autocmd("FocusGained", {
    group = group,
    desc = "Refresh buffers on focus",
    callback = function()
        vim.cmd("checktime")
        vim.cmd("redraw!")
    end,
})

autocmd("VimResized", {
    group = group,
    desc = "Resize splits after window resized",
    callback = function()
        vim.g.is_wide = vim.api.nvim_win_get_width(0) > 120
        vim.cmd("tabdo wincmd =")
        vim.cmd("tabnext " .. vim.fn.tabpagenr())
    end,
})

autocmd("VimEnter", {
    group = group,
    desc = "Open explorer for wide screen",
    callback = function(data)
        -- do nothing if there is lazy window
        for _, win in ipairs(vim.api.nvim_list_wins()) do
            local buf = vim.api.nvim_win_get_buf(win)
            if vim.bo[buf].filetype == "lazy" then return end
        end

        local ok, snacks = pcall(require, "snacks")
        if not ok then return end

        -- provide no name
        if data.file == "" and vim.bo[data.buf].buftype == "" then
            snacks.explorer.open({ auto_close = not vim.g.is_wide })
            return
        end
        -- target is a directory
        if vim.fn.isdirectory(data.file) == 1 then
            vim.cmd.cd(data.file)
            snacks.explorer.open({ auto_close = not vim.g.is_wide })
            return
        end
        -- file with wild_win
        if vim.g.is_wide then snacks.explorer.open({ enter = false }) end
    end,
})

autocmd("QuitPre", {
    group = group,
    desc = "Close explorer for the last buffer",
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
        if -- there is only one non-float window
            1 == #windows - #floating_windows - #snacks_windows
            and vim.api.nvim_win_get_config(0).relative == ""
        then
            for _, w in ipairs(snacks_windows) do
                vim.api.nvim_win_close(w, true)
            end
        end
    end,
})

autocmd("FileType", {
    group = group,
    desc = "Close window for some filetypes with <q>",
    pattern = {
        "checkhealth",
        "help",
        "lspinfo",
        "man",
        "qf",
        "git",
        "fugitive",
        "vim",
    },
    callback = function(e)
        vim.bo[e.buf].buflisted = false
        vim.keymap.set("n", "q", "<CMD>close<CR>", { buffer = e.buf })
    end,
})

-- yanky.nvim builtin
-- autocmd("TextYankPost", {
--     group = group,
--     desc = "Highlight on yank",
--     callback = function() vim.hl.on_yank({ higroup = "TextPurple" }) end,
-- })

-- snacks.nvim builtin
-- autocmd({ "WinEnter", "BufWinEnter", "TermOpen" }, {
--     group = group,
--     desc = "auto insert mode for terminal buffers",
--     callback = function(args)
--         if vim.startswith(vim.api.nvim_buf_get_name(args.buf), "term://") then
--             vim.cmd("startinsert")
--         end
--     end,
-- })
