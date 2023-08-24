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

  ----- Interface -----
  "nvim-lualine/lualine.nvim",
  "lukas-reineke/indent-blankline.nvim",

  ----- Colorschemes -----
  {
    "mofiqul/adwaita.nvim",
    lazy = false,
    priority = 1000,
  },
})

