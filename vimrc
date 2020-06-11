set number

call plug#begin('~/.local/share/vim/plugged')


Plug 'vim-python/python-syntax'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'skammer/vim-css-color'
Plug 'mattn/emmet-vim'
Plug 'preservim/nerdtree'

call plug#end()

let g:airline_theme='simple'

map <F2> :NERDTreeToggle<CR>
