-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local setKeymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Escape is jk
setKeymap("i", "jk", "<esc>")

-- vim-tmux-navigator config
setKeymap("n", "<C-h>", "<CMD>TmuxNavigateLeft<CR>", opts)
setKeymap("n", "<C-j>", "<CMD>TmuxNavigateDown<CR>", opts)
setKeymap("n", "<C-k>", "<CMD>TmuxNavigateUp<CR>", opts)
setKeymap("n", "<C-l>", "<CMD>TmuxNavigateRight<CR>", opts)

-- Create vertical split
setKeymap("n", "vv", "<CMD>vsplit<CR>")
setKeymap("n", "vs", "<CMD>split<CR>")

-- Switching between buffers
-- vim.keymap.del("n", "<M-n>")
-- TODO these keys dont work?
setKeymap("n", "<M-n>", "<CMD>bnext<CR>")
setKeymap("n", "<M-p>", "<CMD>bprevious<CR>")
setKeymap("n", "<M-z>", "<CMD>bd<CR>")
