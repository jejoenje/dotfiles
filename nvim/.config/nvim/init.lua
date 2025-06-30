vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- vim.go.have_nerd_font = true

--
-- theme & transparency
-- 
vim.cmd.colorscheme("retrobox")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
-- vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

-- 
-- GENERAL OPTIONS
--
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


---
--- Keybinds
---
vim.keymap.set("n", "<leader>/", ":noh<CR>", { desc = "Clear search highlights" })

-- Center screen when jumping
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Quick file navigation
vim.keymap.set("n", "<leader>e", ":Explore<CR>", { desc = "Open file explorer" })
vim.keymap.set("n", "<leader>ff", ":find ", { desc = "Find file" })

-- CLIPBOARD ATTEMPT
-- 
vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)
--vim.o.clipboard = "unnamedplus"

--
-- USEFUL FUNCTIONS
--

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

--
-- Statusline
--

-- Git branch function
local function git_branch()
  local branch = vim.fn.system("git branch --show-current 2>/dev/null | tr -d '\n'")
  if branch ~= "" then
    return "  " .. branch .. " "
  end
  return ""
end

-- File type with icon
local function file_type()
  local ft = vim.bo.filetype
  local icons = {
    lua = "[LUA]",
    python = "[PY]",
    javascript = "[JS]",
    html = "[HTML]",
    css = "[CSS]",
    json = "[JSON]",
    markdown = "[MD]",
    vim = "[VIM]",
    sh = "[SH]",
  }

  if ft == "" then
    return "  "
  end

  return (icons[ft] or ft)
end

-- LSP status
local function lsp_status()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if #clients > 0 then
    return "  LSP "
  end
  return ""
end

-- Word count for text files
local function word_count()
  local ft = vim.bo.filetype
  if ft == "markdown" or ft == "text" or ft == "tex" then
    local words = vim.fn.wordcount().words
    return "  " .. words .. " words "
  end
  return ""
end

-- File size
local function file_size()
  local size = vim.fn.getfsize(vim.fn.expand('%'))
  if size < 0 then return "" end
  if size < 1024 then
    return size .. "B "
  elseif size < 1024 * 1024 then
    return string.format("%.1fK", size / 1024)
  else
    return string.format("%.1fM", size / 1024 / 1024)
  end
end

-- Mode indicators with icons
local function mode_icon()
  local mode = vim.fn.mode()
  local modes = {
    n = "NORMAL",
    i = "INSERT",
    v = "VISUAL",
    V = "V-LINE",
    ["\22"] = "V-BLOCK",  -- Ctrl-V
    c = "COMMAND",
    s = "SELECT",
    S = "S-LINE",
    ["\19"] = "S-BLOCK",  -- Ctrl-S
    R = "REPLACE",
    r = "REPLACE",
    ["!"] = "SHELL",
    t = "TERMINAL"
  }
  return modes[mode] or "  " .. mode:upper()
end

_G.mode_icon = mode_icon
_G.git_branch = git_branch
_G.file_type = file_type
_G.file_size = file_size
_G.lsp_status = lsp_status

vim.cmd([[
  highlight StatusLineBold gui=bold cterm=bold
]])

-- Function to change statusline based on window focus
local function setup_dynamic_statusline()
  vim.api.nvim_create_autocmd({"WinEnter", "BufEnter"}, {
    callback = function()
    vim.opt_local.statusline = table.concat {
      "  ",
      "%#StatusLineBold#",
      "%{v:lua.mode_icon()}",
      "%#StatusLine#",
      " │ %f %h%m%r",
      "%{v:lua.git_branch()}",
      " │ ",
      "%{v:lua.file_type()}",
      " | ",
      "%{v:lua.file_size()}",
      " | ",
      "%{v:lua.lsp_status()}",
      "%=",                     -- Right-align everything after this
      "%l:%c  %P ",             -- Line:Column and Percentage
    }
    end
  })
  vim.api.nvim_set_hl(0, "StatusLineBold", { bold = true })

  vim.api.nvim_create_autocmd({"WinLeave", "BufLeave"}, {
    callback = function()
      vim.opt_local.statusline = "  %f %h%m%r │ %{v:lua.file_type()} | %=  %l:%c   %P "
    end
  })
end

setup_dynamic_statusline()-- ============================================================================
-- STATUSLINE
-- ============================================================================

-- Git branch function
local function git_branch()
  local branch = vim.fn.system("git branch --show-current 2>/dev/null | tr -d '\n'")
  if branch ~= "" then
    return "  " .. branch .. " "
  end
  return ""
end

-- File type with icon
local function file_type()
  local ft = vim.bo.filetype
  local icons = {
    lua = "",
    python = "",
    javascript = "",
    html = "",
    css = "",
    json = "",
    markdown = "[MD]",
    vim = "[VIM]",
    sh = "󱆃",
  }

  if ft == "" then
    return "  "
  end

  return (icons[ft] or ft)
end

-- LSP status
local function lsp_status()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if #clients > 0 then
    return "  LSP "
  end
  return ""
end

-- Word count for text files
local function word_count()
  local ft = vim.bo.filetype
  if ft == "markdown" or ft == "text" or ft == "tex" then
    local words = vim.fn.wordcount().words
    return "  " .. words .. " words "
  end
  return ""
end

-- File size
local function file_size()
  local size = vim.fn.getfsize(vim.fn.expand('%'))
  if size < 0 then return "" end
  if size < 1024 then
    return size .. "B "
  elseif size < 1024 * 1024 then
    return string.format("%.1fK", size / 1024)
  else
    return string.format("%.1fM", size / 1024 / 1024)
  end
end

-- Mode indicators with icons
local function mode_icon()
  local mode = vim.fn.mode()
  local modes = {
    n = "",
    i = "",
    v = "",
    V = "󰉸",
    ["\22"] = "󰗈",  -- Ctrl-V
    c = "COMMAND",
    s = "SELECT",
    S = "S-LINE",
    ["\19"] = "S-BLOCK",  -- Ctrl-S
    R = "REPLACE",
    r = "REPLACE",
    ["!"] = "SHELL",
    t = "TERMINAL"
  }
  return modes[mode] or "  " .. mode:upper()
end

_G.mode_icon = mode_icon
_G.git_branch = git_branch
_G.file_type = file_type
_G.file_size = file_size
_G.lsp_status = lsp_status

vim.cmd([[
  highlight StatusLineBold gui=bold cterm=bold
]])

-- Function to change statusline based on window focus
local function setup_dynamic_statusline()
  vim.api.nvim_create_autocmd({"WinEnter", "BufEnter"}, {
    callback = function()
    vim.opt_local.statusline = table.concat {
      "  ",
      "%#StatusLineBold#",
      "%{v:lua.mode_icon()}",
      "%#StatusLine#",
      " │ %f %h%m%r",
      "%{v:lua.git_branch()}",
      " │ ",
      "%{v:lua.file_type()}",
      " | ",
      "%{v:lua.file_size()}",
      " | ",
      "%{v:lua.lsp_status()}",
      "%=",                     -- Right-align everything after this
      "%l:%c  %P ",             -- Line:Column and Percentage
    }
    end
  })
  vim.api.nvim_set_hl(0, "StatusLineBold", { bold = true })

  vim.api.nvim_create_autocmd({"WinLeave", "BufLeave"}, {
    callback = function()
      vim.opt_local.statusline = "  %f %h%m%r │ %{v:lua.file_type()} | %=  %l:%c   %P "
    end
  })
end

setup_dynamic_statusline()

--
-- PLUGINS ETC
--
vim.lsp.enable('pyright')


