vim.g.is_wsl = vim.fn.has("wsl") == 1
vim.g.is_windows = vim.fn.has("win32") == 1
vim.g.is_termux = vim.fn.has("termux") == 1

-- add mason binaries to path
local sep = vim.g.is_windows and "\\" or "/"
local delim = vim.g.is_windows and ";" or ":"
local prefix = table.concat({ vim.fn.stdpath("data"), "mason", "bin" }, sep)
vim.env.PATH = prefix .. delim .. vim.env.PATH

-- set clipboard provider for wsl
if vim.g.is_wsl then
    vim.g.clipboard = {
        name = "WslClipboard",
        copy = {
            ["+"] = "clip.exe",
            ["*"] = "clip.exe",
        },
        paste = {
            ["+"] = 'powershell.exe -c \
                [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            ["*"] = 'powershell.exe -c \
                [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        },
        cache_enabled = false,
    }
end
