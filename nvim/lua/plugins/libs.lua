--- @type LazyPluginSpec[]
return {
    { "nvim-lua/plenary.nvim" },

    { "MunifTanjim/nui.nvim" },

    { "nvim-tree/nvim-web-devicons" },

    { "tjdevries/colorbuddy.nvim" },

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
