"""""""""""""""""""""""""""""""""""""""
" Set commands
"""""""""""""""""""""""""""""""""""""""
" number of VISUAL spaces per TAB
" Use spaces instead of tabs
set tabstop=2
set shiftwidth=2
set expandtab
" enable line numbers
set number
" Use system keyboard
set clipboard+=unnamedplus
" Ignore case of searches
set ignorecase

" jk is escape
inoremap jk <esc>

" set-colorscheme
colorscheme paramount

" leader is comma
let mapleader=","

" Stop hightlighting search results
nnoremap <silent> <leader><space> :nohlsearch<CR>
