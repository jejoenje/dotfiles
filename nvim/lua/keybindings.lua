local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

-- L/R/U/D main key maps
keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-l>', '<c-w>l', opts)

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

