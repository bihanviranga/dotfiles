" number of VISUAL spaces per TAB
set tabstop=2
" uh
set shiftwidth=2
" enable line numbers
set number
" Minimum width of line numbers column
set numberwidth=2
" highlight current line
set cursorline
" visual autocomplete for command menu
set wildmenu
" redraw only when needed
set lazyredraw
" highlight matching bracket
set showmatch
" enable folding
set foldenable
" open most folds by default
set foldlevelstart=10
" 10 nested fold max
set foldnestmax=10
" fold based on indent level
set foldmethod=indent
" required for vimwiki
set nocompatible
" Use system keyboard
set clipboard+=unnamedplus
" new splits get added to right or below
set splitbelow splitright
" Hide the status/mode because lightline already shows it
set noshowmode

" enable syntax processing
syntax enable

" load filetype-specific indent files
filetype indent on
" required for nerdcommenter
filetype plugin on

" leader is comma
let mapleader=","

" When entering insert mode, vertically center current line
"autocmd InsertEnter * norm zz
" Strip trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e
" set custom indentation per file type
"autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" Swap line with the line below/above
nnoremap - ddp
nnoremap _ ddkP
" Jump to next line without leaving insert mode
inoremap <C-o> <esc>o
" Jump two lines without leaving insert mode
inoremap <C-O> <esc>jo
" Mappings for window switching
noremap <M-h> <C-w>h
noremap <M-l> <C-w>l
noremap <M-j> <C-w>j
noremap <M-k> <C-w>k
" Close all windows except current
noremap <M-o> <C-w>o
" Stop hightlighting search results
nnoremap <leader><space> :nohlsearch<CR>
" Space open/closes folds
nnoremap <space> za
" List buffers. Enter buffer number/name to switch
nnoremap <leader>b :buffers<CR>:buffer<Space>
" Switch between buffers with alt+n alt+p
nnoremap <M-n> :bnext<CR>
nnoremap <M-p> :bprevious<CR>
" Close/delete buffer with alt+x
nnoremap <M-x> :bd<CR>
" jk is escape
inoremap jk <esc>
" For opening a new line between two curly braces when you press { and enter.
inoremap {<CR> {<CR>}<ESC>O
" Same, but for square brackets
inoremap [<CR> [<CR>]<ESC>O
" For opening a new line between two parentheses with a semicolon behind the
" second parentheses.
inoremap (;<CR> (<CR>);<ESC>O
" Append semicolon and enter new line
inoremap <M-CR> <esc>A;<esc>o

" netrw settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_altv = 1

" Plug plugins
call plug#begin('~/.vim/plugged')
"-------------- Colorschemes --------------"
	Plug 'lifepillar/vim-gruvbox8'
	Plug 'nanotech/jellybeans.vim'
	Plug 'roosta/srcery'
	Plug 'tomasr/molokai'
	Plug 'cocopon/iceberg.vim'
	Plug 'jaredgorski/spacecamp'
	Plug 'bluz71/vim-moonfly-colors'
	Plug 'kaicataldo/material.vim', {'branch': 'main'}
	Plug 'djjcast/mirodark'
	Plug 'fenetikm/falcon'
	Plug 'nlknguyen/papercolor-theme'
"-------------- Language ------------------"
	Plug 'mattn/emmet-vim'
	Plug 'raimondi/delimitmate'
	Plug 'sheerun/vim-polyglot'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'leafoftree/vim-svelte-plugin'
"-------------- Interface -----------------"
	Plug 'ryanoasis/vim-devicons'
	Plug 'itchyny/lightline.vim'
"-------------- Commands ------------------"
	Plug 'yuttie/comfortable-motion.vim'
	Plug 'vimwiki/vimwiki'
"-------------- Integrations --------------"
	Plug 'tpope/vim-fugitive'
	Plug 'junegunn/fzf'
	Plug 'scrooloose/nerdcommenter'
	Plug 'wakatime/vim-wakatime'
	"Plug 'tweekmonster/startuptime.vim'
call plug#end()
" NOTE: always load devicons as the last one

colorscheme molokai

" FZF settings
noremap <C-p> :FZF<CR>
let g:fzf_action = {'ctrl-t':'tab split', 'ctrl-s':'split', 'ctrl-v':'vsplit'}

" emmet-vim plugin
let g:user_emmet_leader_key='<C-x>'

" VimWiki settings
let wiki_notes = {}
let wiki_notes.path = '/mnt/a/University/y3s1/notes'
let wiki_notes.syntax = 'markdown'
let wiki_notes.ext = '.md'

let wiki_self = {}
let wiki_self.path = '~/Documents/wiki'
let wiki_self.syntax = 'markdown'
let wiki_self.ext = '.md'

let g:vimwiki_list = [wiki_notes, wiki_self]

" lightline settings
let g:lightline = {
	\ 'colorscheme': 'seoul256',
	\ 'active': {
	\ 	'left': [ [ 'mode', 'paste' ],
	\ 					  [ 'gitbranch', 'readonly', 'filename', 'modified', 'cocstatus' ] ]
	\ },
	\ 'component_function': {
	\ 	'gitbranch': 'FugitiveHead',
	\ 	'cocstatus': 'coc#status'
	\ },
	\ }

""""""""""""""""""""""""""""
" COC config
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nnoremap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xnoremap <leader>f  <Plug>(coc-format-selected)
nnoremap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xnoremap <leader>a  <Plug>(coc-codeaction-selected)
nnoremap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nnoremap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nnoremap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xnoremap if <Plug>(coc-funcobj-i)
onoremap if <Plug>(coc-funcobj-i)
xnoremap af <Plug>(coc-funcobj-a)
onoremap af <Plug>(coc-funcobj-a)
xnoremap ic <Plug>(coc-classobj-i)
onoremap ic <Plug>(coc-classobj-i)
xnoremap ac <Plug>(coc-classobj-a)
onoremap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nnoremap <silent> <C-s> <Plug>(coc-range-select)
xnoremap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

