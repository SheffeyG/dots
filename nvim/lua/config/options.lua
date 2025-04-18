local opt = vim.opt
local o = vim.o
local g = vim.g

o.mouse = "a"
o.wrap = false
o.undofile = true
o.cursorline = true
o.splitbelow = true
o.splitright = true

-- sync with system clipboard
o.clipboard = "unnamedplus"

-- enable 256 true colors
o.termguicolors = true

-- global statusline
o.laststatus = 3

-- hide tabline
o.showtabline = 0

-- disable too-long column
o.colorcolumn = ""

-- enable signcolumn
o.signcolumn = "yes"

-- keep lines when scroll
o.scrolloff = 3

-- search and replace
o.ignorecase = true
o.smartcase = true

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
o.foldenable = true
o.foldlevel = 99
o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldtext = ""
o.foldcolumn = "0"

opt.fillchars:append({ fold = " " }) -- "-"
opt.fillchars:append({ eob = " " }) -- "~"
opt.fillchars:append({ diff = "⋰" }) -- "-"

-- disable nvim intro
opt.shortmess:append("sI")

-- allow move across line boundaries
opt.whichwrap:append("<>[]hl")

-- set leaderkey before lazy setup
g.mapleader = " "

-- disable some providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
