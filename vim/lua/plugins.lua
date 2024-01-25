require("lazy").setup({
  ----- Integrations -----
  "christoomey/vim-tmux-navigator",
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = 'make'
  },

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

  ----- Language -----
  "neovim/nvim-lspconfig",

  ----- Colorschemes -----
  {
    "mofiqul/adwaita.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "ntk148v/komau.vim",
    lazy = false,
    priority = 1000,
  },
  {
    "jaredgorski/Mies.vim",
    lazy = false,
    priority = 1000,
  }
})

