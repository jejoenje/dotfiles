local o = vim.opt

o.expandtab = true 
o.shiftwidth = 2
o.softtabstop = 2

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

vim.cmd "colorscheme afterglow"
