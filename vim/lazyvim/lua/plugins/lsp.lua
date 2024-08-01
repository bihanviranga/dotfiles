return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    keys = {
      { "S", mode = { "n", "x", "o" }, false },
    },
  },
}
