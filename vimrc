set number
set encoding=utf-8
syntax on
set nowrap
set smartindent
set noexpandtab

call plug#begin('~/.local/share/vim/plugged')

Plug 'vim-python/python-syntax'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'skammer/vim-css-color'
Plug 'mattn/emmet-vim'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'valloric/youcompleteme' , { 'do': './install.py' }
Plug 'dylanaraps/wal.vim'
Plug 'jceb/vim-orgmode'

call plug#end()

autocmd BufNewFile  *.cpp 0r ~/.templates/skeleton.cpp
autocmd BufNewFile  *.sh 0r ~/.templates/skeleton.sh
autocmd BufNewFile  *.yt 0r ~/.templates/skeleton.yt
autocmd BufNewFile  *-browser.py 0r ~/.templates/browser-skeleton.py

let g:airline_theme='simple'

let mapleader = "\<Space>"
"colorscheme wal
colorscheme torte

"Split resize section
nnoremap <leader>, :vertical resize -10 <CR>
nnoremap <leader>. :vertical resize +10 <CR>
nnoremap <leader>/ :resize -10 <CR>
nnoremap <leader>' :resize +10 <CR>

"Split navigation
nnoremap <leader>h :wincmd h <CR>
nnoremap <leader>l :wincmd l <CR>
nnoremap <leader>j :wincmd j <CR>
nnoremap <leader>k :wincmd k <CR>

"Tab binding
nnoremap <leader>t :tabnew <CR>
nnoremap <leader><PageUp> :tabn <CR>
nnoremap <leader><PageDown> :tabp <CR>

"some bindings
noremap <leader><Return> :terminal <CR>
map <F2> :NERDTreeToggle<CR>
nnoremap <leader>o :e 
nnoremap <leader>s :w <CR>
