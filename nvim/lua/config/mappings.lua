local keymap = vim.keymap.set

-- Disable some useless action
keymap("", "<C-a>", "<Nop>", { unique = true, desc = "which_key_ignore" })
keymap("", "<C-x>", "<Nop>", { unique = true, desc = "which_key_ignore" })

-- Shortcut aliases
keymap("i", "jk", "<Esc>", { desc = "Esc Alias" })
keymap("n", "U", "<C-r>", { desc = "Redo Alias" })
keymap("n", "<Esc>", "<CMD>noh<CR>", { desc = "Clear highlights" })
keymap("n", "<C-a>", "<CMD>keepjumps normal! ggVG<CR>", { desc = "Select All" })

-- Comment
keymap("n", "<leader>/", "gcc", { remap = true, desc = "Toggle comment" })
keymap("x", "<leader>/", "gc", { remap = true, desc = "Toggle comment" })

-- Move cursor
keymap("i", "<C-h>", "<Left>", { desc = "Cusor go Left" })
keymap("i", "<C-j>", "<Down>", { desc = "Cusor go Down" })
keymap("i", "<C-k>", "<Up>", { desc = "Cusor go Up" })
keymap("i", "<C-l>", "<Right>", { desc = "Cusor go Right" })

keymap({ "n", "x", "o" }, "H", "^", { desc = "Home" })
keymap({ "n", "x", "o" }, "L", "$", { desc = "End" })

-- Move lines
keymap("n", "<A-j>", "<CMD>m .+1<CR>==", { desc = "Line go Down" })
keymap("n", "<A-k>", "<CMD>m .-2<CR>==", { desc = "Line go Up" })

keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true, desc = "Line go Down" })
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true, desc = "Line go Up" })

keymap("n", "<A-h>", "v<", { desc = "Line go Left" })
keymap("n", "<A-l>", "v>", { desc = "Line go Right" })

keymap("x", "<A-h>", "<gv", { desc = "Line go Left" })
keymap("x", "<A-l>", ">gv", { desc = "Line go Right" })

-- Move buffers
keymap("n", "<C-h>", "<C-w>h", { desc = "Window go Left" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Window go Down" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Window go Up" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Window go Right" })

keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", { desc = "which_key_ignore" })
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", { desc = "which_key_ignore" })
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", { desc = "which_key_ignore" })
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", { desc = "which_key_ignore" })

keymap("t", "<C-x>", "<C-\\><C-N>", { desc = "Escape terminal mode" })

-- Marks
keymap("n", "dm", ":delmarks ", { desc = "Delete Marks" })
