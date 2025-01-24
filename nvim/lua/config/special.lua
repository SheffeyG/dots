local is_wsl = vim.fn.has("WSL") ~= 0
local is_windows = vim.fn.has("WIN32") ~= 0
local is_termux = vim.fn.has("TERMUX") ~= 0
local is_ssh = os.getenv("SSH_CONNECTION") ~= nil or os.getenv("SSH_CLIENT") ~= nil

-- add mason binaries to path
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
local prefix = table.concat({ vim.fn.stdpath("data"), "mason", "bin" }, sep)
vim.env.PATH = prefix .. delim .. vim.env.PATH

-- set clipboard provider
if is_wsl then
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
-- elseif is_ssh then
--     vim.g.clipboard = {
--         name = "OSC 52",
--         copy = {
--             ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
--             ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
--         },
--         paste = {
--             ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
--             ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
--         },
--     }
end
