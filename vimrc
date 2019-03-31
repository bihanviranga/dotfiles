" colorscheme badwolf " cool color scheme
syntax enable " enable syntax processing
set tabstop=4 " number of VISUAL spaces per TAB
set number " enable line numbers
set cursorline " highlight current line
filetype indent on " load filetype-specific indent files
set wildmenu " visual autocomplete for command menu
set lazyredraw " redraw only when needed
set showmatch " highlight matching bracket
set hlsearch " highlight matches
nnoremap <leader><space> :nohlsearch<CR>
" with space, stop highlighting search results
set foldenable " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested fold max
nnoremap <space> za
" space open/closes folds
set foldmethod=indent " fold based on indent level
" let mapleader="," " leader is comma
inoremap jk <esc>
" jk is escape

" PLUG add-on manager
" call plug#begin('~/.vim/plugged')
" Plug 'leafgarland/typescript-vim'
" call plug#end()



