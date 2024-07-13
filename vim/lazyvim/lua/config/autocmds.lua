-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.cmd([[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]])

local augroup = vim.api.nvim_create_augroup

local general augroup("General", { clear = true })

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd({ "FileType" }, {
  callback = function()
    vim.opt.formatoptions:remove { "c", "r", "o"}
  end,
  group = general,
  desc = "Disable comment on next line when pressing enter from a comment line",
})
