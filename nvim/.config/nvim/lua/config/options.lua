-- 
-- GENERAL OPTIONS
--

-- LEADER KEY CONFIG
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- vim.go.have_nerd_font = true

--  Line numbers, scrolling etc
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.mouse = "a"			-- enable mouse mode
vim.o.showmode = true			-- show mode
vim.o.wrap = false                      -- Don't wrap lines
vim.o.scrolloff = 8                     -- Keep lines above/below cursor 
vim.o.sidescrolloff = 8                 -- Keep columns left/right of cursor

-- Indentation
vim.opt.tabstop = 2                     -- Tab width
vim.opt.shiftwidth = 2                  -- Indent width
vim.opt.softtabstop = 2                 -- Soft tab stop
vim.opt.expandtab = true                -- Use spaces instead of tabs
vim.opt.smartindent = true              -- Smart auto-indenting
vim.opt.autoindent = true               -- Copy indent from current line

-- Search settings
vim.opt.ignorecase = true               -- Case insensitive search
vim.opt.smartcase = true                -- Case sensitive if uppercase in search
vim.opt.hlsearch = true                 -- Toggle highlight search results 
vim.opt.incsearch = true                -- Show matches as you type

-- Visual settings
vim.opt.termguicolors = true            -- Enable 24-bit colors
vim.opt.signcolumn = "yes"              -- Always show sign column
-- vim.opt.colorcolumn = "100"          -- Show column at 100 characters
vim.opt.showmatch = true                -- Highlight matching brackets
vim.opt.matchtime = 2                   -- How long to show matching bracket
vim.opt.cmdheight = 1                   -- Command line height
vim.opt.completeopt = "menuone,noinsert,noselect"  -- Completion options 
-- vim.opt.showmode = false             -- Don't show mode in command line 
vim.opt.pumheight = 10                  -- Popup menu height 
vim.opt.pumblend = 10                   -- Popup menu transparency 
vim.opt.winblend = 0                    -- Floating window transparency 
vim.opt.conceallevel = 0                -- Don't hide markup 
vim.opt.concealcursor = ""              -- Don't hide cursor line markup 
vim.opt.lazyredraw = true               -- Don't redraw during macros
vim.opt.synmaxcol = 300                 -- Syntax highlighting limit 

-- Behavior settings
vim.opt.hidden = true                   -- Allow hidden buffers
vim.opt.errorbells = false              -- No error bells
vim.opt.backspace = "indent,eol,start"  -- Better backspace behavior
vim.opt.autochdir = false               -- Don't auto change directory
vim.opt.iskeyword:append("-")           -- Treat dash as part of word
vim.opt.path:append("**")               -- include subdirectories in search
vim.opt.selection = "exclusive"         -- Selection behavior
vim.opt.modifiable = true               -- Allow buffer modifications
vim.opt.encoding = "UTF-8"              -- Set encoding

-- CLIPBOARD SETTINGS
vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)
--vim.o.clipboard = "unnamedplus"
