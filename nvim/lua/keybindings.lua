local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- L/R/U/D main key maps
keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-l>', '<c-w>l', opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Alpha toggle
keymap('n','<leader>n', ":Alpha<cr>", {noremap = true})

-- NERDTree toggle
keymap("n", "<leader>e", ":NERDTreeToggle<CR>", opts)

-- TreeSitter toggle
-- keymap('n','<leader>F', 'zR', opts)
-- keymap('n','<leader>C', 'zM', opts)
-- keymap('n','<leader>ff', 'zO', opts)
-- keymap('n','<leader>cc', 'zC', opts)
-- keymap('n','<leader>f', 'zo', opts)
-- keymap('n','<leader>c', 'zc', opts)

-- LSP key maps
keymap('n','gd', ':lua vim.lsp.buf.definition()<cr>',opts)
keymap('n','gD', ':lua vim.lsp.buf.declaration()<cr>',opts)
keymap('n','gi', ':lua vim.lsp.buf.implementation()<cr>',opts)
keymap('n','gw', ':lua vim.lsp.buf.document_symbol()<cr>',opts)
keymap('n','gw', ':lua vim.lsp.buf.workspace_symbol()<cr>',opts)
keymap('n','gr', ':lua vim.lsp.buf.references()<cr>',opts)
keymap('n','gt', ':lua vim.lsp.buf.type_definition()<cr>',opts)
keymap('n','K', ':lua vim.lsp.buf.hover()<cr>',opts)
keymap('n','<c-k>', ':lua vim.lsp.buf.signature_help()<cr>',opts)
keymap('n','<leader>af', ':lua vim.lsp.buf.code_action()<cr>',opts)
keymap('n','<leader>rn', ':lua vim.lsp.buf.rename()<cr>',opts)

-- Telescope
keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
-- keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>t", "<cmd>Telescope live_grep<cr>", opts)

-- NERDcommenter
-- keymap("n", '<leader>_', "<cmd>NERDCommenterToggle", opts)
-- keymap("v", '<leader>_', "<cmd>NERDCommenterToggle<cr>gv", opts)

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
