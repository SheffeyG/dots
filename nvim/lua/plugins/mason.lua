return {
  {
    "williamboman/mason.nvim",
    opt = {
      ensure_installed = {
        "black",
        "isort",
        "prettier",
        "shfmt",
      },
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    opt = {
      ensure_installed = {
        "pyright",
        "clangd",
      },
    },
  },
}
