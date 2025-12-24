-- Open a new VSCode window and open all current tabs
local function code_current_buffer()
    -- Save all files first
    vim.cmd("silent wa")

    local cwd = vim.fn.getcwd()
    local file_name = vim.api.nvim_buf_get_name(0)
    local file_path = vim.fn.fnamemodify(file_name, ":p")

    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    local line = cursor_pos[1]
    local col = cursor_pos[2] + 1 -- vscode is 1-based

    -- Skip no name files
    if file_path == "" then
        vim.notify("No file name to open in VSCode", vim.log.levels.WARN)
        return
    end

    print("Opening '" .. file_name .. "' in vscode...")

    -- Open current path and buffer with position
    vim.cmd("silent !code -n " .. vim.fn.shellescape(cwd))
    vim.cmd("silent !code -g " .. vim.fn.shellescape(file_path) .. ":" .. line .. ":" .. col)
end

vim.api.nvim_create_user_command("Code", code_current_buffer, {
    desc = "Open current buffer in VSCode",
    nargs = 0,
})

-- Redraw screen when marks are changed via `m` commands
vim.on_key(function(_, typed)
    if typed:sub(1, 1) ~= "m" then return end

    local mark = typed:sub(2)
    vim.schedule(function()
        if mark:match("[A-Z]") then
            for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
                vim.api.nvim__redraw({ win = win, range = { 0, -1 } })
            end
        else
            vim.api.nvim__redraw({ range = { 0, -1 } })
        end
    end)
end)
