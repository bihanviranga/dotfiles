-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local setKeymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Escape is jk
setKeymap("i", "jk", "<esc>")

-- vim-tmux-navigator config
setKeymap("n", "<M-h>", "<CMD>TmuxNavigateLeft<CR>", opts)
setKeymap("n", "<M-j>", "<CMD>TmuxNavigateDown<CR>", opts)
setKeymap("n", "<M-k>", "<CMD>TmuxNavigateUp<CR>", opts)
setKeymap("n", "<M-l>", "<CMD>TmuxNavigateRight<CR>", opts)
