return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  ----- Colorschemes -----
  use 'nanotech/jellybeans.vim'
  use 'roosta/srcery'
  use 'tomasr/molokai'
  use 'cocopon/iceberg.vim'
  use 'jaredgorski/spacecamp'
  use 'bluz71/vim-moonfly-colors'
  use 'djjcast/mirodark'
  use 'fenetikm/falcon'
  use 'kristijanhusak/vim-hybrid-material'
  use 'drewtempelmeyer/palenight.vim'
  use 'issadarkthing/vim-rex'
  use 'morhetz/gruvbox'
  use {'embark-theme/vim', as = 'embark'}
  use 'sainnhe/gruvbox-material'
  use 'sainnhe/edge'
  use 'ayu-theme/ayu-vim'
  use 'sainnhe/sonokai'
  use 'Yagua/nebulous.nvim'
  use 'nikolvs/vim-sunbather'
  use 'owickstrom/vim-colors-paramount'

  ----- Language -----
  use 'raimondi/delimitmate'
  use 'scrooloose/nerdcommenter'

  ----- Interface -----
  use 'Yggdroot/indentLine'

  ----- Commands -----
  use 'chrisbra/NrrwRgn' -- TODO: fix config
  use 'godlygeek/tabular'
  use 'tpope/vim-surround'
  use 'kana/vim-textobj-user'
  use 'kana/vim-textobj-line'
  use 'qpkorr/vim-bufkill'
  use 'henriquehbr/nvim-startup.lua'

  ----- Integrations -----
  use 'christoomey/vim-tmux-navigator' -- TODO: fix config
  use 'wakatime/vim-wakatime'
  use 'editorconfig/editorconfig-vim'
end)
