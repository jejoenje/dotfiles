vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- vim.go.have_nerd_font = true

vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.mouse = "a"			-- enable mouse mode
vim.o.showmode = true			-- show mode
vim.o.wrap = false                      -- Don't wrap lines
vim.o.scrolloff = 8                     -- Keep lines above/below cursor 
vim.o.sidescrolloff = 8                 -- Keep columns left/right of cursor

-- CLIPBOARD ATTEMPT
-- 
vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)
--vim.o.clipboard = "unnamedplus"
