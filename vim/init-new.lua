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
-- sign column
vim.opt.signcolumn = 'yes:1'

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
-- Strip trailing whitespace on save
vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]])

-- Set filetype for extension
vim.cmd([[au BufRead,BufNewFile *.eslintrc set filetype=json]])

-- Disable automatic comment insertion on next line
vim.cmd([[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]])

-- set custom indentation per file type
--vim.cmd([[autocmd FileType cs setlocal shiftwidth=4 tabstop=4]])

-- When entering insert mode, vertically bring to top current line
--vim.cmd([[autocmd InsertEnter * norm zt]])

--" JSDoc shortcut
--vim.cmd([[autocmd Filetype javascript,typescript,javascriptreact,typescriptreact inoremap <buffer> /** /**  */<esc>hhi]])

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

-- Toggle background color between black and colorscheme's default color
local initial_guibg = nil
function _G.toggleBlackBg()
  -- Extract the current background color
  local highlights = vim.api.nvim_exec("hi Normal", true)
  local extracted = nil
  for tok in string.gmatch(highlights, "guibg.+") do
    extracted = tok
  end
  local current_guibg = string.sub(extracted, 7)
  -- Set the new background colour
  if (current_guibg == "black") then
    vim.cmd("hi Normal guibg=" .. initial_guibg)
  else
    initial_guibg = current_guibg
    vim.cmd("hi Normal guibg=black")
  end
end

----------------------------------
-- Plugins
----------------------------------
-- bootstrap lazy.nvim package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("plugins")

----------------------------------
-- Remaps
----------------------------------

----------------------------------
-- vim-tmux-navigator config
----------------------------------
-- This allows using the same keys to switch tmux panes and vim windows
nmap('<M-h>', '<CMD>TmuxNavigateLeft<CR>', true)
nmap('<M-j>', '<CMD>TmuxNavigateDown<CR>', true)
nmap('<M-k>', '<CMD>TmuxNavigateUp<CR>', true)
nmap('<M-l>', '<CMD>TmuxNavigateRight<CR>', true)

-- TEMP:
-- jk is escape
imap("jk", "<esc>")
vim.cmd([[colorscheme habamax]])
