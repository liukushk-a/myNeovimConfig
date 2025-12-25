-- set desired number of spaces for the tab
vim.cmd("set shiftwidth=4")
vim.cmd("set tabstop=4")

-- set the "universal clipboard"
vim.opt.clipboard = "unnamedplus"

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Enable line numbers
vim.cmd("set number")
