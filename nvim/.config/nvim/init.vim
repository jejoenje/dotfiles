call plug#begin()
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'danilo-augusto/vim-afterglow'
Plug 'jalvesaq/Nvim-R'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter' 
Plug 'norcalli/nvim-colorizer.lua'
Plug 'iamcco/markdown-preview.nvim', { 'do': ':call mkdp#util#install()', 'for': 'markdown' }
call plug#end()

set encoding=utf-8
set nocompatible
set number
set title
set noswapfile
set scrolloff=7
set clipboard+=unnamedplus
"Replaced some of this with more python-specific settings as suggested
"https://www.youtube.com/watch?v=wzrZPcwh-b
set tabstop=4 softtabstop=4 expandtab shiftwidth=4 smarttab autoindent fileformat=unix
set nowrap
" set background=dark
set t_Co=256 " vim airline colors
set cursorline
" Set cursor line color on visual mode
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40

" Themeing
colorscheme afterglow
let g:airline_theme='afterglow'
"let g:airline_powerline_fonts = 2

" Airline tabs (show buffers):
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemode=':t'

" NERDTree setup
let NERDTreeShowHidden=1 " Show hidden files in NerdTree buffer.

" Keybindings
let mapleader = ' '
" Buffers
nmap <leader>1 :bp<CR>
nmap <leader>2 :bn<CR>
nmap <leader>0 :bd<CR>
" NERDTREE
nnoremap <C-n> :NERDTreeToggle<CR>
" Tabbing
nnoremap <C-[> :tabprevious<CR>
nnoremap <C-]> :tabnext<CR>
nnoremap <C-e> :tabnew<CR> 
nnoremap <C-x> :tabclose<CR>
" Panel switching
nmap <C-j> <C-W><C-J>
nmap <C-k> <C-W><C-K>
nmap <C-l> <C-W><C-L>
nmap <C-h> <C-W><C-H>
" NERDcommenter
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

" Some R-specific setup
"let R_source = '~/.config/nvim/plugged/Nvim-R/R/tmux_split.vim'
