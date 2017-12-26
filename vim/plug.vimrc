call plug#begin('~/.vim/plugged')

Plug 'flazz/vim-colorschemes' " Shitload of colorschemes

Plug 'kien/ctrlp.vim' " Fuzzy finding

Plug 'scrooloose/nerdtree' " File tree
Plug 'Xuyuanp/nerdtree-git-plugin' " git support for file tree

Plug 'tpope/vim-fugitive' " git support for vim

Plug 'tpope/vim-commentary' " Support for easily toggling comments.

Plug 'w0rp/ale' " Syntax checking

Plug 'maralla/completor.vim' " Autcompletion

Plug 'dylanaraps/wal.vim' " match colorscheme to wal setting

" --- Language Support ---
Plug 'rust-lang/rust.vim'
Plug 'mxw/vim-jsx'

call plug#end()
