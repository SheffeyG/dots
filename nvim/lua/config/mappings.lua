local map = vim.keymap.set

--------------------------
--- General
--------------------------

map("n", ";", ":")
map("i", "jk", "<ESC>")

map("n", "<ESC>", "<cmd>noh<CR>", { desc = "General clear highlights" })
map("n", "<C-a>", "ggVG", { desc = "General select whole file" })

map("n", "<leader>/", "gcc", { desc = "Toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "Toggle comment", remap = true })

--------------------------
--- Edit
--------------------------

map("i", "<C-h>", "<Left>", { desc = "Move cusor left" })
map("i", "<C-j>", "<Down>", { desc = "Move cusor down" })
map("i", "<C-k>", "<Up>", { desc = "Move cusor up" })
map("i", "<C-l>", "<Right>", { desc = "Move cusor right" })

map("n", "H", "^", { desc = "Move cusor beginning of line" })
map("n", "L", "$", { desc = "Move cusor end of line" })

--------------------------
--- Buffers
--------------------------

map("n", "<C-h>", "<C-w>h", { desc = "Switch window left" })
map("n", "<C-j>", "<C-w>j", { desc = "Switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Switch window up" })
map("n", "<C-l>", "<C-w>l", { desc = "Switch window right" })

map("t", "<C-h>", "<C-\\><C-N><C-w>h", { desc = "Switch window left" })
map("t", "<C-j>", "<C-\\><C-N><C-w>j", { desc = "Switch window down" })
map("t", "<C-k>", "<C-\\><C-N><C-w>k", { desc = "Switch window up" })
map("t", "<C-l>", "<C-\\><C-N><C-w>l", { desc = "Switch window right" })

map("t", "<C-x>", "<C-\\><C-N>", { desc = "Escape terminal mode" })

map({ "n", "t" }, "<leader><leader>", function()
    Snacks.terminal.toggle()
end, { desc = "Toogle bottom terminal" })

--------------------------
--- Plugins
--------------------------

-- conform
map("n", "<leader>fm", function()
    require("conform").format({ lsp_fallback = true })
end, { desc = "General format file" })

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "Nvimtree focus window" })

-- noice
map("n", "<leader>mh", function()
    require("noice").cmd("history")
end, { desc = "Noice show message history" })

-- telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Telescope find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Telescope help page" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Telescope find oldfiles" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "Telescope find marks" })
map("n", "<leader>gm", "<cmd>Telescope git_commits<CR>", { desc = "Telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "Telescope git status" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Telescope fuzzy find" })
