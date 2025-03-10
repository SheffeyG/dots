local opt = vim.opt
local o = vim.o
local g = vim.g

o.mouse = "a"
o.clipboard = "unnamedplus"

o.laststatus = 3
o.showtabline = 0
o.signcolumn = "yes"
o.colorcolumn = ""
o.cursorline = true

o.ignorecase = true
o.smartcase = true
o.splitbelow = true
o.splitright = true
o.undofile = true
o.wrap = false

-- indents
o.expandtab = true
o.shiftwidth = 4
o.smartindent = true
o.tabstop = 4
o.softtabstop = 4

-- numbers
o.number = true
o.numberwidth = 2
o.relativenumber = false

-- fold
o.foldmethod = "indent"
o.foldlevelstart = 99

-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 250
o.timeoutlen = 400

-- disable nvim intro
opt.shortmess:append("sI")

-- go to previous/next when reached the beginning/end of line
opt.whichwrap:append("<>[]hl")

opt.fillchars:append({ eob = " " })
opt.fillchars:append({ diff = "╱" })

-- set leaderkey before lazy setup
g.mapleader = " "

-- disable some providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
