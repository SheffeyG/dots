local mason = require("plugins.mason")
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      lua_ls = {
        mason = false,
      },
    },
  },
}
