call plug#begin()
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'danilo-augusto/vim-afterglow'
call plug#end()

set nocompatible
set number
set title
set clipboard+=unnamedplus
"For indents that consist of 4 space characters but are entered with the tab key:
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
set nowrap
set scrolloff=6
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
