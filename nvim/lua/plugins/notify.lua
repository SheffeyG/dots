return {
    "rcarriga/nvim-notify",
    lazy = false,
    opts = function()
        dofile(vim.g.base46_cache .. "notify")

        vim.notify = require("notify")

        return {
            timeout = 100,
            topdown = false,
            max_height = function()
                return math.floor(vim.o.lines * 0.75)
            end,
            max_width = function()
                return math.floor(vim.o.columns * 0.75)
            end,
            on_open = function(win)
                vim.api.nvim_win_set_config(win, { zindex = 100 })
            end,
        }
    end,
}
