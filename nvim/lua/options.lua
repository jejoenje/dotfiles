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

vim.cmd "colorscheme afterglow"
