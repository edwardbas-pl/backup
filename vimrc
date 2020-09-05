set number
set encoding=utf-8
set mouse=a
syntax on
set nowrap
set smartindent

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


call plug#end()

let g:airline_theme='simple'

let mapleader = "\<Space>"

"Split resize section
nnoremap <leader>, :vertical resize -10 <CR>
nnoremap <leader>. :vertical resize +10 <CR>
nnoremap <leader>/ :resize -10 <CR>
nnoremap <leader>' :resize +10 <CR>

"SPlit navigation
nnoremap <leader>h :wincmd h <CR>
nnoremap <leader>l :wincmd l <CR>
nnoremap <leader>j :wincmd j <CR>
nnoremap <leader>k :wincmd k <CR>

"some bindings
nnoremap <leader>t :terminal <CR>
map <F2> :NERDTreeToggle<CR>
