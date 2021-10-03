" number of VISUAL spaces per TAB
set tabstop=2
set shiftwidth=2
" Use spaces instead of tabs
set expandtab
" enable line numbers
set number
" Minimum width of line numbers column
set numberwidth=3
" highlight current line
"set cursorline
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
" required for setting modelines
set nocompatible
" Use system keyboard
set clipboard+=unnamedplus
" new splits get added to right or below
set splitbelow splitright
" Hide the status/mode because lightline already shows it
set noshowmode
" Enable 24-bit color
set termguicolors
" When scrolling up/down, keep a gap of 5 lines
set scrolloff=3
" Set the g flag to search and replace by default
set gdefault
" Ignore case of searches
set ignorecase
" Set modelines
set modeline

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

" Set filetype for extension
au BufRead,BufNewFile *.vtl set filetype=vtl
au BufRead,BufNewFile *.eslintrc set filetype=json

" set custom indentation per file type
"autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType cs setlocal shiftwidth=4 tabstop=4
autocmd FileType vtl setlocal shiftwidth=4 tabstop=4

" Disable automatic comment insertion
" Means that when you enter a comment and create a newline,
" the newline becomes a comment line too.
" This disables it for all filetypes
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" JSDoc shortcut
autocmd Filetype javascript,typescript,javascriptreact,typescriptreact inoremap <buffer> /** /**  */<esc>hhi

" Open vimrc file in a vertical split
nnoremap <silent> <leader>ev :vsplit $MYVIMRC<CR>
" Source vimrc file
nnoremap <leader>sv :source $MYVIMRC<CR>
" Swap line with the line below/above
nnoremap - ddp
nnoremap _ ddkP
" Stop hightlighting search results
nnoremap <silent> <leader><space> :nohlsearch<CR>
" Space open/closes folds
"nnoremap <space> za
" List buffers. Enter buffer number/name to switch
nnoremap <leader>p :Buffers<CR>
" Switch between buffers with alt+n alt+p
nnoremap <M-n> :bnext<CR>
nnoremap <M-p> :bprevious<CR>
" Close/delete buffer with alt+x
nnoremap <M-x> :bd<CR>
" Close/delete buffer without closing the window/split
" (using qpkorr/vim-bufkill)
nnoremap <M-z> :BD<CR>
" View unsaved changes in file
nnoremap <leader>vu :w !diff % -<CR>
" Mappings for window switching
" Now managed by vim-tmux-navigator
" See vim_tmux_navigator_config
"noremap <M-h> <C-w>h
"noremap <M-l> <C-w>l
"noremap <M-j> <C-w>j
"noremap <M-k> <C-w>k
" Close all windows except current
noremap <M-o> <C-w>o
" Create vertical split
nnoremap vv :vsplit<CR>
" Select all and copy
nnoremap <leader>sa :%y<CR>
" Select all without copy
nnoremap <leader>sA ggvG
" New tab
nnoremap <leader>tn :tabnew<CR>
" Close tab
nnoremap <leader>tc :tabclose<CR>
" Open todo file
nnoremap <leader>td :vsplit ~/todo<CR>
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
" Jump to next line without leaving insert mode
inoremap <C-o> <esc>o
" Jump two lines without leaving insert mode
inoremap <C-j> <esc>jo
" Jump to the end of the line without leaving insert mode
inoremap <C-l> <esc>A

" netrw settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_altv = 1

" Plug plugins
call plug#begin('~/.vim/plugged')
"-------------- Colorschemes --------------"
	Plug 'nanotech/jellybeans.vim'
	Plug 'roosta/srcery'
	Plug 'tomasr/molokai'
	Plug 'cocopon/iceberg.vim'
	Plug 'jaredgorski/spacecamp'
	Plug 'bluz71/vim-moonfly-colors'
	Plug 'djjcast/mirodark'
	Plug 'fenetikm/falcon'
	Plug 'kristijanhusak/vim-hybrid-material'
	Plug 'drewtempelmeyer/palenight.vim'
	Plug 'issadarkthing/vim-rex'
	Plug 'morhetz/gruvbox'
	Plug 'embark-theme/vim', { 'as': 'embark' }
	Plug 'sainnhe/gruvbox-material'
	Plug 'sainnhe/edge'
	Plug 'ayu-theme/ayu-vim'
	Plug 'sainnhe/sonokai'
	Plug 'ishan9299/modus-theme-vim'
	Plug 'Yagua/nebulous.nvim'
"-------------- Language ------------------"
	Plug 'mattn/emmet-vim'
	Plug 'raimondi/delimitmate'
	Plug 'sheerun/vim-polyglot'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'leafoftree/vim-svelte-plugin'
	"Plug 'OmniSharp/omnisharp-vim'
"-------------- Interface -----------------"
	"Plug 'ryanoasis/vim-devicons'
	Plug 'Yggdroot/indentLine'
	Plug 'itchyny/lightline.vim'
"-------------- Commands ------------------"
	"Plug 'yuttie/comfortable-motion.vim'
	"Plug 'vimwiki/vimwiki'
	Plug 'chrisbra/NrrwRgn'
	Plug 'godlygeek/tabular'
	Plug 'tpope/vim-surround'
	Plug 'kana/vim-textobj-user'
	Plug 'kana/vim-textobj-line'
	Plug 'qpkorr/vim-bufkill'
"-------------- Integrations --------------"
	Plug 'tpope/vim-fugitive'
	Plug 'junegunn/fzf'
	Plug 'junegunn/fzf.vim'
	Plug 'scrooloose/nerdcommenter'
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'wakatime/vim-wakatime'
	Plug 'editorconfig/editorconfig-vim'
	"Plug 'tweekmonster/startuptime.vim'
call plug#end()


"""""""""""""""""""""""""""""""""""""""
" Colorscheme config
"""""""""""""""""""""""""""""""""""""""
" Gruvbox only enables italics for GUI Vim.
" Since my terminal supports italics, this line
" manually enables it
" let g:gruvbox_italic=1

" mode of the ayu colorscheme (light, mirage, dark)
"let ayucolor="mirage"

" Settings for sonokai colorscheme
"let g:sonokai_enable_itallic = 1
"let g:sonokai_style = 'maia'

" Settings for srcery theme
let g:srcery_italic=1

" Settings for nebulous
"lua << EOF
"require("nebulous").setup {
	"variant = "twilight",
	"disable = {
		"background = false,
		"endOfBuffer = false,
	"},
	"italic = {
		"comments = true,
		"keywords = false,
		"functions = false,
		"variables = false,
	"}
"}
"EOF

colorscheme srcery

"""""""""""""""""""""""""""""""""""""""
" FZF settings
"""""""""""""""""""""""""""""""""""""""
" <C-p> search among version-controlled files in the
" directory vim was launched from.
" Adding this option because I need it in monorepos
let dirname = getcwd()
nnoremap <silent> <C-p> :execute ":GFiles" . dirname<CR>
" Search among all version-controlled files in the repo
nnoremap <silent> <leader>gf :GFiles<CR>
" Search among all (incl. non vc) files in the
" directory vim was launched from
noremap <leader>f :FZF<CR>
" Open the selected file in a split/tab
let g:fzf_action = {'ctrl-t':'tab split', 'ctrl-s':'split', 'ctrl-v':'vsplit'}
"""""""""""""""""""""""""""""""""""""""

" emmet-vim plugin
let g:user_emmet_leader_key='<C-x>'

" VimWiki settings

"let g:vimwiki_list = [wiki_notes, wiki_self]
" Stop vimwiki from treating all markdown files as vimwiki entries
"let g:vimwiki_global_ext = 0

"""""""""""""""""""""""""""""""""""""""
" NrrwRgn settings
"""""""""""""""""""""""""""""""""""""""
" Open new buffer in a vertical split
let g:nrrw_rgn_vert = 1
" Set the size (absolute=rows or cols, relative=percentage)
let g:nrrw_rgn_resize_window = 'relative'
" Set the new buffer size
let g:nrrw_rgn_wdth = 20
let g:nrrw_rgn_rel_min = 50
let g:nrrw_rgn_rel_max = 50
" Increment narrowed window size
nmap <leader>ni <Plug>NrrwrgnWinIncr
"""""""""""""""""""""""""""""""""""""""

" airline settings
"let g:airline_theme='base16'
"if !exists('g:airline_symbols')
	"let g:airline_symbols = {}
"endif
"let g:airline_symbols.branch=''
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline#extensions#default#section_truncate_width = {
"\  'y': 101,
"\  'x': 81,
"\}
"" %t is tail of the current file path (see :help filename-modifiers)
"" %m is the modified flag
"" %r is the read only flag
"let g:airline_section_c = '%t%m%r'

"""""""""""""""""""""""""""""""""""""""
" lightline config
"""""""""""""""""""""""""""""""""""""""
" The empty array ensures that 'filetype' and 'lineinfo' doesn't end up
" inside the same 'seperator'
" cocstatus related info was taken from :h coc-status
"
let g:lightline = {
  \ 'colorscheme': 'material',
	\ 'separator': { 'left': '', 'right': ''},
	\ 'subseparator': { 'left': '', 'right': ''},
	\ 'active': {
	\   'left': [
	\     ['mode', 'paste'],
	\     ['readonly', 'filename', 'modified']
	\   ],
	\ 	'right': [
	\     ['lineinfo'],
	\     [],
	\     ['gitbranch', 'filetype', 'fileformat'],
	\     ['coc_error', 'coc_warning', 'coc_info', 'coc_hint', 'coc_fix']
	\   ]
	\ },
	\ 'component_function': {
	\ 	'gitbranch': 'FugitiveHead',
	\ 	'fileformat': 'LightlineFileFormat',
	\ 	'filetype': 'LightlineFileType',
	\ },
	\ 'component_expand': {
	\   'coc_error': 'LightlineCocErrors',
	\   'coc_warning': 'LightlineCocWarnings',
	\   'coc_info': 'LightlineCocInfos',
	\   'coc_hint': 'LightlineCocHints',
	\   'coc_fix': 'LightlineCocFixes',
	\ },
	\ 'component_type': {
	\   'coc_error': 'error',
	\   'coc_warning': 'warning',
	\   'coc_info': 'warning',
	\   'coc_hint': 'middle',
	\   'coc_fix': 'middle'
	\ }
\ }
" Use autocmd to formce lightline update
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
" This function controls the visibility of the lightline's fileformat field
" It is only shown if window size is > 100
function! LightlineFileFormat()
	return winwidth(0) > 100 ? &fileformat : ''
endfunction
" This function controls the visibility of the lightline's filetype field
" It is only shown if window size is > 80
function! LightlineFileType()
	return winwidth(0) > 80 ? (&filetype !=# '' ? &filetype : 'No ft') : ''
endfunction
" Functions to get Coc diagnostics to use them in the lightline
function! LightlineCocErrors() abort
	return s:lightline_coc_diagnostic('error', '')
endfunction
function! LightlineCocWarnings() abort
	return s:lightline_coc_diagnostic('warning', '')
endfunction
function! LightlineCocInfos() abort
	return s:lightline_coc_diagnostic('information', '')
endfunction
function! LightlineCocHints() abort
	return s:lightline_coc_diagnostic('hints', '')
endfunction
function! LightlineCocFixes() abort
	return s:lightline_coc_diagnostic('fix', '')
endfunction
"""""""""""""""""""""""""""""""""""""""

" vim_tmux_navigator_config
" This allows using the same keys to switch tmux panes and vim windows
nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
"nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

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
set updatetime=1000

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
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Go to definition shorcuts.
" Opens the definition in the same window, vsplit, split, or new tab
nnoremap <silent> <leader>dd :call CocAction('jumpDefinition', 'edit')<CR>
nnoremap <silent> <leader>dv :call CocAction('jumpDefinition', 'vsplit')<CR>
nnoremap <silent> <leader>ds :call CocAction('jumpDefinition', 'split')<CR>
nnoremap <silent> <leader>dt :call CocAction('jumpDefinition', 'tabe')<CR>

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
"autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
"xnoremap <leader>f  <Plug>(coc-format-selected)
"nnoremap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
"xnoremap <leader>a  <Plug>(coc-codeaction-selected)
"nnoremap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
"nnoremap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
"nnoremap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
"xnoremap if <Plug>(coc-funcobj-i)
"onoremap if <Plug>(coc-funcobj-i)
"xnoremap af <Plug>(coc-funcobj-a)
"onoremap af <Plug>(coc-funcobj-a)
"xnoremap ic <Plug>(coc-classobj-i)
"onoremap ic <Plug>(coc-classobj-i)
"xnoremap ac <Plug>(coc-classobj-a)
"onoremap ac <Plug>(coc-classobj-a)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
"nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
"nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
"nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
"nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
"nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Show actions
nnoremap <silent><nowait> <leader>. :CocAction<CR>

" This function returns the requested diagnostic from coc_diagnostic_info
" Use like s:lightline_coc_diagnostic('error', 'error')
" Written for use in lightline
function! s:lightline_coc_diagnostic(kind, sign) abort
	let info = get(b:, 'coc_diagnostic_info', 0)
	if empty(info) || get(info, a:kind, 0) == 0
		return ''
	endif
	return printf('%s %d', a:sign, info[a:kind])
endfunction
