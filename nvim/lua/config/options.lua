local opt = vim.opt
local o = vim.o
local g = vim.g

g.mapleader = " "

o.mouse = "a"
o.clipboard = "unnamedplus"
o.laststatus = 3
o.showtabline = 0
o.colorcolumn = ""
o.signcolumn = "yes"
o.scrolloff = 3
o.sidescrolloff = 3
o.statusline = " %t %m %r %h%w %= %l:%c %p%% "

o.wrap = false
o.undofile = true
o.ignorecase = true
o.smartcase = true
o.cursorline = true
o.splitbelow = true
o.splitright = true

o.updatetime = 300
o.timeoutlen = 500
o.ttimeoutlen = 10

o.expandtab = true
o.shiftwidth = 4
o.smartindent = true
o.tabstop = 4
o.softtabstop = 4

o.number = true
o.numberwidth = 2
o.relativenumber = false

o.foldenable = true
o.foldlevel = 99
o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldtext = ""
o.foldcolumn = "0"

o.list = true
o.ruler = false
o.showmode = false

opt.listchars:append({ tab = "░░" })
opt.fillchars:append({ eob = " ", fold = " ", diff = "╱" })
-- Disable some message
opt.shortmess:append({ W = true, I = true, c = true, C = true })
-- Allow cursor across line boundaries
opt.whichwrap:append("<>[]hl")
-- Set vertical diffview
opt.diffopt:append("vertical")

-- Disable other providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- Custom global flags
g.is_tmux = os.getenv("TMUX") ~= nil
g.is_wsl = os.getenv("WSL_DISTRO_NAME") ~= nil
g.is_ssh = os.getenv("SSH_CONNECTION") ~= nil or os.getenv("SSH_CLIENT") ~= nil
g.is_wide = vim.api.nvim_win_get_width(0) > 120

-- Clipboard provider
if g.is_wsl then
    local name = "PWSH"
    local copy = "clip.exe"
    local paste = 'powershell.exe -c \
        [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))'

    -- https://github.com/equalsraf/win32yank
    if vim.fn.executable("win32yank.exe") ~= 0 then
        name = "WIN32YANK"
        copy = "win32yank.exe -i --crlf"
        paste = "win32yank.exe -o --lf"
    end

    vim.g.clipboard = {
        name = name,
        copy = { ["+"] = copy, ["*"] = copy },
        paste = { ["+"] = paste, ["*"] = paste },
        cache_enabled = true,
    }
elseif g.is_ssh then
    -- https://github.com/neovim/neovim/issues/28611#issuecomment-2147744670
    local get_system_reg = function()
        return function(_)
            local content = vim.fn.getreg('"')
            return vim.split(content, "\n")
        end
    end

    vim.g.clipboard = {
        name = "OSC52",
        copy = {
            ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
            ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
        },
        -- skip OSC-52 paste to avoid blocking
        paste = {
            ["+"] = get_system_reg(),
            ["*"] = get_system_reg(),
        },
    }
end
