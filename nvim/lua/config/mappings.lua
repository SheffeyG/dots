local map = vim.keymap.set

-- General
map("n", ";", ":")
map("i", "jk", "<Esc>")

map("n", "<Esc>", "<CMD>noh<CR>", { desc = "Clear highlights" })
map("n", "<C-a>", "ggVG", { desc = "Select all" })

map("n", "<leader>/", "gcc", { remap = true, desc = "Toggle comment" })
map("v", "<leader>/", "gc", { remap = true, desc = "Toggle comment" })

-- Edit
map("i", "<C-h>", "<Left>", { desc = "Cusor go left" })
map("i", "<C-j>", "<Down>", { desc = "Cusor go down" })
map("i", "<C-k>", "<Up>", { desc = "Cusor go up" })
map("i", "<C-l>", "<Right>", { desc = "Cusor go right" })

map({ "n", "v", "o" }, "H", "^", { noremap = true, desc = "Line home" })
map({ "n", "v", "o" }, "L", "$", { noremap = true, desc = "Line end" })

-- Buffers
map("n", "<C-h>", "<C-w>h", { desc = "Window go left" })
map("n", "<C-j>", "<C-w>j", { desc = "Window go down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window go up" })
map("n", "<C-l>", "<C-w>l", { desc = "Window go right" })

map("t", "<C-h>", "<C-\\><C-N><C-w>h", { desc = "which_key_ignore" })
map("t", "<C-j>", "<C-\\><C-N><C-w>j", { desc = "which_key_ignore" })
map("t", "<C-k>", "<C-\\><C-N><C-w>k", { desc = "which_key_ignore" })
map("t", "<C-l>", "<C-\\><C-N><C-w>l", { desc = "which_key_ignore" })

map("t", "<C-x>", "<C-\\><C-N>", { desc = "Escape terminal mode" })
