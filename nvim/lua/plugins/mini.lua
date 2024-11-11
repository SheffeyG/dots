---@type NvPluginSpec
return {
    {
        "echasnovski/mini.nvim",
        event = "VeryLazy",
        config = function()
            require("mini.move").setup()
            require("mini.operators").setup()
            require("mini.surround").setup()
        end,
    },
}
