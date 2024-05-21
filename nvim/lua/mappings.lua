require("nvchad.mappings")

local map = vim.keymap.set


-- Command
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "General Clear highlights" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- map("i", "jk", "<ESC>")


-- Move Line
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down", silent = true })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up", silent = true })
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down", silent = true })
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up", silent = true })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move line down", silent = true })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move line up", silent = true })


-- Terminal Close
local function close_terminal()
    local win = vim.api.nvim_get_current_win()
    vim.api.nvim_win_close(win, true)
end

map("t", "jk", close_terminal, { desc = "Terminal Close" })
map("t", "<ESC>", close_terminal, { desc = "Terminal Close" })


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

map({ "n" }, "<leader>cr", code_runner)

