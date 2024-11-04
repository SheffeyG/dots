local map = vim.keymap.set

------------------------------------- General ----------------------------------------

map("n", ";", ":")
map("i", "jk", "<ESC>")
map("n", "<ESC>", "<CMD>noh<CR>", { desc = "general clear highlights" })
map("n", "<C-a>", "ggVG",         { desc = "general select whole file" })
map("n", "<C-s>", "<cmd>w<CR>",   { desc = "general save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

----------------------------------- Move Lines ---------------------------------------

map("n", "<A-k>", ":m .-2<CR>==",        { desc = "move line up" })
map("n", "<A-j>", ":m .+1<CR>==",        { desc = "move line down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv",    { desc = "move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv",    { desc = "move line down" })
map("i", "<A-k>", "<ESC>:m .-2<CR>==gi", { desc = "move line up" })
map("i", "<A-j>", "<ESC>:m .+1<CR>==gi", { desc = "move line down" })

map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>",   { desc = "move end of line" })
map("i", "<C-h>", "<Left>",  { desc = "move left" })
map("i", "<C-j>", "<Down>",  { desc = "move down" })
map("i", "<C-k>", "<Up>",    { desc = "move up" })
map("i", "<C-l>", "<Right>", { desc = "move right" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })

------------------------------------ Terminal ----------------------------------------

map("t", "jk", function()
    local win = vim.api.nvim_get_current_win()
    vim.api.nvim_win_close(win, true)
end, { desc = "Terminal Close terminal" })

map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- new terminals
map("n", "<leader>h", function()
    require("nvchad.term").new({ pos = "sp" })
end, { desc = "terminal new horizontal term" })

map("n", "<leader>v", function()
    require("nvchad.term").new({ pos = "vsp" })
end, { desc = "terminal new vertical term" })

-- toggleable
map({ "n", "t" }, "<A-v>", function()
    require("nvchad.term").toggle({ pos = "vsp", id = "vtoggleTerm" })
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<A-h>", function()
    require("nvchad.term").toggle({ pos = "sp", id = "htoggleTerm" })
end, { desc = "terminal toggleable horizontal term" })

map({ "n", "t" }, "<A-i>", function()
    require("nvchad.term").toggle({ pos = "float", id = "floatTerm" })
end, { desc = "terminal toggle floating term" })

-- code runner
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

map({ "n" }, "<leader>cr", code_runner, { desc = "terminal save and run (C/Cpp/Python)" })

------------------------------------- Plugins ----------------------------------------

-- cheatsheet
map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })

-- conform
map("n", "<leader>fm", function()
    require("conform").format({ lsp_fallback = true })
end, { desc = "general format file" })

-- lsp
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

-- tabufline
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "buffer new" })

map("n", "<tab>", function()
    require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<S-tab>", function()
    require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

map("n", "<leader>x", function()
    require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })

-- comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc",  { desc = "toggle comment", remap = true })

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>",    { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>",   { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>",     { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>",   { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>",       { desc = "telescope find marks" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>",  { desc = "telescope find files" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>",    { desc = "telescope find oldfiles" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>",  { desc = "telescope git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>",       { desc = "telescope pick hidden term" })

map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>",
    { desc = "telescope find in current buffer" })

map("n", "<leader>th", function() require("nvchad.themes").open() end,
    { desc = "telescope nvchad themes" })

map("n", "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
    { desc = "telescope find all files" })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey<CR>", { desc = "whichkey all keymaps" })

map("n", "<leader>wk", function()
    vim.cmd("WhichKey " .. vim.fn.input("WhichKey: "))
end, { desc = "whichkey query lookup" })
