local g = vim.g

g.is_wsl = vim.fn.has("WSL") ~= 0
g.is_win = vim.fn.has("WIN32") ~= 0
g.is_tmux = os.getenv("TMUX") ~= nil
g.is_ssh = os.getenv("SSH_CONNECTION") ~= nil or os.getenv("SSH_CLIENT") ~= nil

if not g.is_win then
    local arch = vim.fn.system("uname -m")
    g.is_arm = arch:match("arm") ~= nil or arch:match("aarch64") ~= nil
else
    g.is_arm = false
end

-- set clipboard provider
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
    -- https://www.sxrhhh.top/blog/2024/06/06/neovim-copy-anywhere/
    local do_nothing = function(_)
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
        paste = {
            -- ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
            -- ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
            ["+"] = do_nothing("+"), -- pasting disabled
            ["*"] = do_nothing("*"), -- pasting disabled
        },
    }
end
