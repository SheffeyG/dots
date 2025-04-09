local map = vim.keymap.set

-- disable useless +/- num
map("n", "<C-a>", "<nop>", { noremap = true, desc = "which_key_ignore" })
map("n", "<C-x>", "<nop>", { noremap = true, desc = "which_key_ignore" })

-- shortcut alias
map("i", "jk", "<Esc>")
map("n", "U", "<C-r>")
map({ "n", "x" }, ";", ":")

map("n", "<Esc>", "<CMD>noh<CR>", { desc = "Clear highlights" })
map("n", "<C-a>", "ggVG", { desc = "Select All" })

-- comment
map("n", "<leader>/", "gcc", { remap = true, desc = "Toggle comment" })
map("x", "<leader>/", "gc", { remap = true, desc = "Toggle comment" })

-- cursor
map("i", "<C-h>", "<Left>", { desc = "Cusor go Left" })
map("i", "<C-j>", "<Down>", { desc = "Cusor go Down" })
map("i", "<C-k>", "<Up>", { desc = "Cusor go Up" })
map("i", "<C-l>", "<Right>", { desc = "Cusor go Right" })

map({ "n", "x", "o" }, "H", "^", { noremap = true, desc = "Home" })
map({ "n", "x", "o" }, "L", "$", { noremap = true, desc = "End" })

-- line
map("n", "<A-j>", "<CMD>m .+1<CR>==", { silent = true, desc = "Line go Down" })
map("n", "<A-k>", "<CMD>m .-2<CR>==", { silent = true, desc = "Line go Up" })

map("x", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true, desc = "Line go Down" })
map("x", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true, desc = "Line go Up" })

map("n", "<A-h>", "v<", { silent = true, desc = "Line go Left" })
map("n", "<A-l>", "v>", { silent = true, desc = "Line go Right" })

map("x", "<A-h>", "<gv", { silent = true, desc = "Line go Left" })
map("x", "<A-l>", ">gv", { silent = true, desc = "Line go Right" })

-- buffer
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
