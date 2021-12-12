" This is just to test the linked .vimrc setup
" .. and another edit but of the file itself.
"
set nocompatible
set number
set t_Co=256 " vim airline colors

nmap <C-n> :NERDTreeToggle<CR>
"nmap <C-n> :Lexplore<CR>
nmap <C-j> <C-W><C-J>
nmap <C-k> <C-W><C-K>
nmap <C-l> <C-W><C-L>
nmap <C-h> <C-W><C-H>

"let g:netrw_banner = 0
"let g:netrw_browse_split = 3
"let g:netrw_winsize = 15
"let g:netrw_altv = 1
"augroup ProjectDrawer
""  autocmd!
""  autocmd VimEnter * :Vexplore
"augroup END

"augroup AutoDeleteNetrwHiddenBuffers
""  au!
""  au FileType netrw setlocal bufhidden=wipe
"augroup end

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'jalvesaq/Nvim-R'
"Plug 'ncm2/ncm2'
"Plug 'roxma/nvim-yarp'
"Plug 'gaalcaras/ncm-R'
Plug 'Raimondi/delimitMate'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

let g:airline_powerline_fonts = 1
let R_assign = 0
