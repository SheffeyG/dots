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
