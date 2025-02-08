--- @type LazyPluginSpec[]
return {
    -- libs
    { "nvim-lua/plenary.nvim" },

    { "MunifTanjim/nui.nvim" },

    { "nvim-tree/nvim-web-devicons" },

    { "tjdevries/colorbuddy.nvim" },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = { delay = 500 },
    },

    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                "lazy.nvim",
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                { path = "snacks.nvim", words = { "Snacks" } },
            },
        },
    },
}
