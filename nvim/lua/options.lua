require("nvchad.options")

-- local opt = vim.opt
local o = vim.o
local g = vim.g

o.cursorlineopt = "both"
-- o.relativenumber = true
o.swapfile = false

o.fileencodings = "utf-8,gb2312,gbk,cp936"
o.encoding = "utf-8"
-- o.termencoding = "utf-8"

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- indenting
o.expandtab = true
o.shiftwidth = 4
o.smartindent = true
o.tabstop = 4
o.softtabstop = 4

-- clipboard
if vim.fn.has("wsl") == 1 then
    o.clipboard = "unnamed,unnamedplus"
    g.clipboard = {
        name = "WslClipboard",
        copy = {
            ["+"] = "clip.exe",
            ["*"] = "clip.exe",
        },
        paste = {
            ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        },
        cache_enabled = false,
    }
end
