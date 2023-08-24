require("lazy").setup({
  ----- Integrations -----
  "christoomey/vim-tmux-navigator",

  ----- Editing -----
  "tpope/vim-surround",
  {
    "m4xshen/autoclose.nvim",
    opts = {},
  },
  {
    "numToStr/Comment.nvim",
    lazy = false,
  },
  {
    "godlygeek/tabular",
    lazy = true,
  },

  ----- Interface -----
  "nvim-lualine/lualine.nvim",
  "lukas-reineke/indent-blankline.nvim",

  ----- Behaviour -----
  "qpkorr/vim-bufkill",

  ----- Colorschemes -----
  {
    "mofiqul/adwaita.nvim",
    lazy = false,
    priority = 1000,
  },
})

