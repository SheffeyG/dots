local map = vim.keymap.set

------------------------------------- General ----------------------------------------

map("n", ";", ":")
map("i", "jk", "<ESC>")
map("n", "<ESC>", "<cmd>noh<CR>", { desc = "General clear highlights" })
map("n", "<C-a>", "ggVG",         { desc = "General select whole file" })
map("n", "<C-s>", "<cmd>w<CR>",   { desc = "General save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "General copy whole file" })

----------------------------------- Move Lines ---------------------------------------

map("n", "<A-k>", ":m .-2<CR>==",        { desc = "Move line up" })
map("n", "<A-j>", ":m .+1<CR>==",        { desc = "Move line down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv",    { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv",    { desc = "Move line down" })
map("i", "<A-k>", "<ESC>:m .-2<CR>==gi", { desc = "Move line up" })
map("i", "<A-j>", "<ESC>:m .+1<CR>==gi", { desc = "Move line down" })

map("i", "<C-b>", "<ESC>^i", { desc = "Move cusor beginning of line" })
map("i", "<C-e>", "<End>",   { desc = "Move cusor end of line" })
map("i", "<C-h>", "<Left>",  { desc = "Move cusor left" })
map("i", "<C-j>", "<Down>",  { desc = "Move cusor down" })
map("i", "<C-k>", "<Up>",    { desc = "Move cusor up" })
map("i", "<C-l>", "<Right>", { desc = "Move cusor right" })

map("n", "<C-h>", "<C-w>h", { desc = "Switch window left" })
map("n", "<C-j>", "<C-w>j", { desc = "Switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Switch window up" })
map("n", "<C-l>", "<C-w>l", { desc = "Switch window right" })

------------------------------------ Terminal ----------------------------------------

map("t", "jk", function()
    local win = vim.api.nvim_get_current_win()
    vim.api.nvim_win_close(win, true)
end, { desc = "Terminal Close terminal" })

map("t", "<C-x>", "<C-\\><C-N>", { desc = "Terminal escape terminal mode" })

-- new terminals
map("n", "<leader>h", function()
    require("nvchad.term").new({ pos = "sp" })
end, { desc = "Terminal new horizontal term" })

map("n", "<leader>v", function()
    require("nvchad.term").new({ pos = "vsp" })
end, { desc = "Terminal new vertical term" })

map({ "n", "t" }, "<A-v>", function()
    require("nvchad.term").toggle({ pos = "vsp", id = "vtoggleTerm" })
end, { desc = "Terminal toggle vertical term" })

map({ "n", "t" }, "<A-h>", function()
    require("nvchad.term").toggle({ pos = "sp", id = "htoggleTerm" })
end, { desc = "Terminal toggle horizontal term" })

map({ "n", "t" }, "<A-i>", function()
    require("nvchad.term").toggle({ pos = "float", id = "floatTerm" })
end, { desc = "Terminal toggle floating term" })

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

map({ "n" }, "<leader>cr", code_runner, { desc = "Terminal save and run (C/Cpp/Python)" })

------------------------------------- Plugins ----------------------------------------

-- cheatsheet
map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "Toggle nvcheatsheet" })

-- conform
map("n", "<leader>fm", function()
    require("conform").format({ lsp_fallback = true })
end, { desc = "General format file" })

-- lsp
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

-- tabufline
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "Buffer new" })

map("n", "<tab>", function()
    require("nvchad.tabufline").next()
end, { desc = "Switch buffer goto next" })

map("n", "<S-tab>", function()
    require("nvchad.tabufline").prev()
end, { desc = "Switch buffer goto prev" })

map("n", "<leader>x", function()
    require("nvchad.tabufline").close_buffer()
end, { desc = "Switch buffer close" })

-- comment
map("n", "<leader>/", "gcc", { desc = "Toggle comment", remap = true })
map("v", "<leader>/", "gc",  { desc = "Toggle comment", remap = true })

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>",    { desc = "Nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "Nvimtree focus window" })

-- telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>",   { desc = "Telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>",     { desc = "Telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>",   { desc = "Telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>",       { desc = "Telescope find marks" })
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>",  { desc = "Telescope find files" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>",    { desc = "Telescope find oldfiles" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "Telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>",  { desc = "Telescope git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>",       { desc = "Telescope pick hidden term" })

map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>",
    { desc = "Telescope find in current buffer" })

map("n", "<leader>th", function() require("nvchad.themes").open() end,
    { desc = "Telescope nvchad themes" })

map("n", "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
    { desc = "Telescope find all files" })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey<CR>", { desc = "Whichkey all keymaps" })

map("n", "<leader>wk", function()
    vim.cmd("WhichKey " .. vim.fn.input("WhichKey: "))
end, { desc = "Whichkey query lookup" })
