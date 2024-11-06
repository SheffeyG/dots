local M = {}

M.defaults = { lazy = true }

M.spec = {
    { import = "plugins" },
}

M.install = { colorscheme = { "nvchad" } }

-- automatically check for plugin updates
M.checker = {
    enabled = true,
    notify = false,
}

M.ui = {
    icons = {
        ft = " ",
        lazy = "󰂠 ",
        loaded = " ",
        not_loaded = " ",
    },
}

-- disable some rtp plugins
M.performance = {
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
}

return M
