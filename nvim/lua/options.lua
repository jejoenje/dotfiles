local o = vim.opt

o.backup = false
o.swapfile = false
o.clipboard = "unnamedplus"
o.conceallevel = 0
o.hlsearch = true
o.mouse = "a"
o.expandtab = true
o.smartindent = true
o.shiftwidth = 2
o.softtabstop = 2
o.number = true
o.numberwidth = 4
o.scrolloff = 8
o.cursorline = true

local configs = require'nvim-treesitter.configs'
configs.setup {
--  ensure_installed = "maintained", -- Only use parsers that are maintained
  highlight = { -- enable highlighting
    enable = true, 
  },
  indent = {
    enable = false, -- default is disabled anyways
  }
}

-- TreeSitter 'folding'
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"

-- LSP inline diagnostics toggle
local diagnostics_active = true
vim.keymap.set('n', '<leader>d', function()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    vim.diagnostic.show()
  else
    vim.diagnostic.hide()
  end
end)

vim.cmd "colorscheme afterglow"
