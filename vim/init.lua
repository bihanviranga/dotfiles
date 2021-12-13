----------------------------------
-- Options
----------------------------------
-- indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
-- Use spaces instead of tabs
vim.opt.expandtab = true
-- enable line numbers
vim.opt.number = true
-- Minimum width of line numbers column
vim.opt.numberwidth = 3
-- highlight current line
--vim.opt.cursorline = true
-- visual autocomplete for command menu
vim.opt.wildmenu = true
-- redraw only when needed
vim.opt.lazyredraw = true
-- highlight matching bracket
vim.opt.showmatch = true
-- enable folding
vim.opt.foldenable = true
-- open most folds by default
vim.opt.foldlevelstart = 10
-- 10 nested fold max
vim.opt.foldnestmax = 10
-- fold based on indent level
vim.opt.foldmethod = 'indent'
-- required for setting modelines
vim.opt.compatible = false
-- Use system keyboard
vim.opt.clipboard = 'unnamedplus'
-- new splits get added to right or below
vim.opt.splitbelow = true
vim.opt.splitright = true
-- Hide the status/mode because lightline already shows it
vim.opt.showmode = false
-- Enable 24-bit color
vim.opt.termguicolors = true
-- When scrolling up/down, keep a gap of 5 lines
vim.opt.scrolloff = 3
-- vim.opt.the g flag to search and replace by default
vim.opt.gdefault = true
-- Ignore case of searches
vim.opt.ignorecase = true
-- vim.opt.modelines
vim.opt.modeline = true
-- vim.opt.color column
vim.opt.colorcolumn = '81'

-- TODO: convert to lua
--" enable syntax processing
vim.cmd("syntax enable")
--" load filetype-specific indent files
vim.cmd("filetype indent on")
--" required for nerdcommenter
vim.cmd("filetype plugin on")

-- leader is comma
vim.g.mapleader = ","

----------------------------------
-- Auto commands
----------------------------------
-- When entering insert mode, vertically center current line
--vim.cmd([[autocmd InsertEnter * norm zz]])

-- Strip trailing whitespace on save
vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]])

--" Set filetype for extension
vim.cmd([[au BufRead,BufNewFile *.eslintrc set filetype=json]])

-- set custom indentation per file type
--vim.cmd([[autocmd FileType cs setlocal shiftwidth=4 tabstop=4]])

-- Disable automatic comment insertion on next line
vim.cmd([[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]])

--" JSDoc shortcut
vim.cmd([[autocmd Filetype javascript,typescript,javascriptreact,typescriptreact inoremap <buffer> /** /**  */<esc>hhi]])

----------------------------------
-- Functions
----------------------------------
function map(mode, shortcut, command, silent)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = silent })
end

function nmap(shortcut, command, silent)
  silent = silent or false
  map('n', shortcut, command, silent)
end

function imap(shortcut, command, silent)
  silent = silent or false
  map('i', shortcut, command, silent)
end

-- Make j,k move using visible lines, not physical lines
function _G.enterParagraphMode()
  print("Paragraph mode on")
  nmap("k", "gk", true)
  nmap("j", "gj", true)
end

----------------------------------
-- Remaps
----------------------------------
-- TODO: set $MYVIMRC
-- Open vimrc file in a vertical split
nmap("<leader>ev", "<CMD>:vsplit $MYVIMRC<CR>", true)
-- Source vimrc file
nmap("<leader>sv", "<CMD>source $MYVIMRC<CR>")

-- Swap a line with the line below/above
nmap("-", "ddp")
nmap("_", "ddkP")

-- Stop highlighting search results
nmap("<leader><space>", "<CMD>nohlsearch<CR>", true)

-- List buffers. Enter buffer number/name to switch
nmap("<leader>p", "<CMD>:Buffers<CR>")
-- Switch between buffers with alt+n alt+p
nmap("<M-n>", "<CMD>:bnext<CR>")
nmap("<M-p>", "<CMD>:bprevious<CR>")
-- Close/delete buffer with alt+x
nmap("<M-x>", "<CMD>:bd<CR>")
-- TODO:
-- Close/delete buffer without closing the window/split
--" (using qpkorr/vim-bufkill)
-- nnoremap <M-z> :BD<CR>

-- View unsaved changes in file
nmap("<leader>vu", "<CMD>w !diff % -<CR>")

-- Close all windows except current
nmap("<M-o>", "<C-w>o")
-- Create vertical split
nmap("vv", "<CMD>vsplit<CR>")
-- Create horizontal split
nmap("ss", "<CMD>split<CR>")
-- Select all and copy
nmap("<leader>sa", "<CMD>%y<CR>")
-- Select all without copy
nmap("<leader>sA", "ggvG")
-- New tab
nmap("<leader>tn", "<CMD>tabnew<CR>")
-- Close tab
nmap("<leader>tc", "<CMD>tabclose<CR>")
-- Open todo file
nmap("<leader>td", "<CMD>vsplit ~/todo<CR>")

-- jk is escape
imap("jk", "<esc>")
-- For opening a new line between two curly braces when you press { and enter.
imap("{<CR>", "{<CR>}<ESC>O")
-- Same, but for square brackets
imap("[<CR>", "[<CR>]<ESC>O")
-- For opening a new line between two parentheses with a semicolon behind the
-- second parentheses.
imap("(;<CR>", "(<CR>);<ESC>O")
-- Append semicolon and enter new line
imap("<M-CR>", "<esc>A;<esc>o")
-- Jump to the end of the line without leaving insert mode
imap("<C-l>", "<esc>A")

-- Enable paragraph mode
nmap("<leader>ep", ":lua enterParagraphMode()<CR>")

----------------------------------
-- netrw settings
----------------------------------
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_altv = 1

----------------------------------
-- TODO: Plugins
----------------------------------
