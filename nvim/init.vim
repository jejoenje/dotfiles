call plug#begin()
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'danilo-augusto/vim-afterglow'
Plug 'jalvesaq/Nvim-R'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter' 
Plug 'norcalli/nvim-colorizer.lua'
Plug 'sirver/ultisnips'
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

colorscheme afterglow

nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-[> :tabprevious<CR>
nnoremap <C-]> :tabnext<CR>
nnoremap <C-e> :tabnew 
nnoremap <C-x> :tabclose<CR>
nmap <C-j> <C-W><C-J>
nmap <C-k> <C-W><C-K>
nmap <C-l> <C-W><C-L>
nmap <C-h> <C-W><C-H>

"let g:airline_powerline_fonts = 2
let g:airline_theme='afterglow'
"let R_source = '~/.config/nvim/plugged/Nvim-R/R/tmux_split.vim'
