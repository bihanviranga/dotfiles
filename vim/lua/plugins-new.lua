require("lazy").setup({
  ----- Commands -----
  "tpope/vim-surround",

  ----- Integrations -----
  "christoomey/vim-tmux-navigator",

  ----- Editing -----
  {
    "m4xshen/autoclose.nvim",
    opts = {},
  },

  ----- Colorschemes -----
  {
    "mofiqul/adwaita.nvim",
    lazy = false,
    priority = 1000,
  },
})

