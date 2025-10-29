-- Bootstrap lazy.vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.api.nvim_echo({
        { "Cloning lazy.nvim...\n", "MoreMsg" },
    }, true, {})
    local out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to continue..." },
        }, true, {})
        vim.fn.getchar()
        return -1
    end
end

vim.opt.rtp:prepend(lazypath)

-- Setup lazy and other plugins
require("lazy").setup({
    defaults = { lazy = true },
    spec = {
        { import = "plugins.ui" },
        { import = "plugins.edit" },
    },
    checker = {
        enabled = true,
        notify = false,
    },
    ui = {
        icons = {
            ft = " ",
            loaded = " ",
            not_loaded = " ",
        },
    },
    -- Disable some rtp built-in plugins
    performance = {
        rtp = {
            disabled_plugins = {
                "2html_plugin",
                "tohtml",
                "getscript",
                "getscriptPlugin",
                "gzip",
                "logipat",
                "netrw",
                "netrwPlugin",
                "netrwSettings",
                "netrwFileHandlers",
                "matchit",
                "tar",
                "tarPlugin",
                "rrhelper",
                "spellfile_plugin",
                "vimball",
                "vimballPlugin",
                "zip",
                "zipPlugin",
                "tutor",
                "rplugin",
                "syntax",
                "synmenu",
                "optwin",
                "compiler",
                "bugreport",
                "ftplugin",
            },
        },
    },
})
