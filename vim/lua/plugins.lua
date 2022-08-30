return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  ----- Colorschemes -----
  use 'bluz71/vim-moonfly-colors'
  use 'ayu-theme/ayu-vim'
  use 'nikolvs/vim-sunbather'
  use 'luisiacc/gruvbox-baby'
  use 'windwp/wind-colors'
  use 'zekzekus/menguless'
  use 'shaeinst/roshnivim-cs'
  use 'FrenzyExists/aquarium-vim'
  use 'liuchengxu/space-vim-dark'
  use 'jaredgorski/fogbell.vim'
  use 'Mofiqul/adwaita.nvim'

  ----- Language -----
  use 'raimondi/delimitmate'
  use 'scrooloose/nerdcommenter'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin

  ----- Interface -----
  use 'nvim-lualine/lualine.nvim'
  use 'lukas-reineke/indent-blankline.nvim'

  ----- Commands -----
  use {'chrisbra/NrrwRgn', opt = true}
  use 'godlygeek/tabular'
  use 'tpope/vim-surround'
  use 'kana/vim-textobj-user'
  use 'kana/vim-textobj-line'
  use 'qpkorr/vim-bufkill'
  --use 'henriquehbr/nvim-startup.lua'

  ----- Integrations -----
  use 'christoomey/vim-tmux-navigator'
  use 'wakatime/vim-wakatime'
  use 'editorconfig/editorconfig-vim'
  use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/plenary.nvim'}}}
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
end)
