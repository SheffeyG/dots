require("nvchad.mappings")

local map = vim.keymap.set


-- Command
map("n", ";", ":")
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("i", "jk", "<ESC>")
map("n", "<ESC>", "<CMD>noh<CR>", { desc = "General Clear highlights" })


-- Move Lines
map("n", "<A-j>", ":m .+1<CR>==", { desc = "MoveLine Down", silent = true })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "MoveLine Up", silent = true })
map("i", "<A-j>", "<ESC>:m .+1<CR>==gi", { desc = "MoveLine Down", silent = true })
map("i", "<A-k>", "<ESC>:m .-2<CR>==gi", { desc = "MoveLine Up", silent = true })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "MoveLine Down", silent = true })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "MoveLine Up", silent = true })


-- Terminal Closer
local function close_terminal()
    local win = vim.api.nvim_get_current_win()
    vim.api.nvim_win_close(win, true)
end

map("t", "jk", close_terminal, { desc = "Terminal Close terminal" })


-- Code Runner
local function code_runner()
    vim.cmd("write");
    require("nvchad.term").runner({
        id = "runner",
        pos = "sp",

        cmd = function()
            local file = vim.fn.expand("%")

            local ft_cmds = {
                python = "python3 " .. file,
                cpp = "clear && g++ -o out " .. file .. " && ./out",
                c = "clear && gcc -o out " .. file .. " && ./out",
            }

            return ft_cmds[vim.bo.ft]
        end,
    })

    end

map({ "n" }, "<leader>cr", code_runner, { desc = "Terminal Save and Run (C/Cpp/Python)" })

