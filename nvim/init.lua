vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"

require("configs/options")
require("configs/autocmds")
require("configs/mappings")
require("configs/special")

-- bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    local repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

-- load lazy and plugins
local lazy_config = require("lazyrc")
require("lazy").setup(lazy_config)

-- load cached theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")
