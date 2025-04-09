local map = vim.keymap.set

-- disable useless +/- num
map("n", "<C-a>", "<Nop>", { noremap = true, desc = "which_key_ignore" })
map("n", "<C-x>", "<Nop>", { noremap = true, desc = "which_key_ignore" })

-- shortcut alias
map("i", "jk", "<Esc>")
map("n", "U", "<C-r>")
map({ "n", "v" }, ";", ":")

map("n", "<Esc>", "<CMD>noh<CR>", { desc = "Clear highlights" })
map("n", "<C-a>", "ggVG", { desc = "Select All" })

-- comment
map("n", "<leader>/", "gcc", { remap = true, desc = "Toggle comment" })
map("v", "<leader>/", "gc", { remap = true, desc = "Toggle comment" })

-- edit
map("i", "<C-h>", "<Left>", { desc = "Cusor go Left" })
map("i", "<C-j>", "<Down>", { desc = "Cusor go Down" })
map("i", "<C-k>", "<Up>", { desc = "Cusor go Up" })
map("i", "<C-l>", "<Right>", { desc = "Cusor go Right" })

map({ "n", "v", "o" }, "H", "^", { noremap = true, desc = "Home" })
map({ "n", "v", "o" }, "L", "$", { noremap = true, desc = "End" })

-- buffer operation
map("n", "<C-h>", "<C-w>h", { desc = "Window go Left" })
map("n", "<C-j>", "<C-w>j", { desc = "Window go Down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window go Up" })
map("n", "<C-l>", "<C-w>l", { desc = "Window go Right" })

map("t", "<C-h>", "<C-\\><C-N><C-w>h", { desc = "which_key_ignore" })
map("t", "<C-j>", "<C-\\><C-N><C-w>j", { desc = "which_key_ignore" })
map("t", "<C-k>", "<C-\\><C-N><C-w>k", { desc = "which_key_ignore" })
map("t", "<C-l>", "<C-\\><C-N><C-w>l", { desc = "which_key_ignore" })

map("t", "<C-x>", "<C-\\><C-N>", { desc = "Escape terminal mode" })

-- lsp
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
