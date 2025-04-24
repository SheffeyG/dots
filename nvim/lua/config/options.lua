local opt = vim.opt
local o = vim.o
local g = vim.g

o.mouse = "a"
o.clipboard = "unnamedplus"
o.laststatus = 3
o.showtabline = 0
o.colorcolumn = ""
o.signcolumn = "yes"
o.scrolloff = 3
o.statusline = " %t %m %r %h%w %= %l:%c %p%% "

o.wrap = false
o.undofile = true
o.ignorecase = true
o.smartcase = true
o.cursorline = true
o.splitbelow = true
o.splitright = true

-- time and timeout
o.updatetime = 300
o.timeoutlen = 500
o.ttimeoutlen = 10

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

opt.fillchars:append({ eob = " ", fold = " ", diff = "⋰" })

-- disable nvim intro
opt.shortmess:append("sI")

-- allow cursor across line boundaries
opt.whichwrap:append("<>[]hl")

-- set leaderkey before lazy setup
g.mapleader = " "

-- disable some providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
