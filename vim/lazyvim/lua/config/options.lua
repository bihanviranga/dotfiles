-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.autoformat = true
vim.opt.gdefault = true

vim.g.snacks_animate = false

-- If no prettier config file is found, the formatter will not be used.
-- Prettier automatically formatting when there's no config file is ASS.
-- It sometimes overwrites Eslint styles, in a project that DOES NOT USE PRETTIER. smh.
vim.g.lazyvim_prettier_needs_config = true
