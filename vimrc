" " khanny17's .vimrc
" "
" " Compiled from lots of other vimrc's and tutorials, especially:
" "     - https://github.com/jez/vim-as-an-ide
" "     - https://gist.github.com/pthrasher/3933522    

" " Setup Vundle:
" " For this to work, you must install the vundle plugin manually.
" " https://github.com/gmarik/vundle
" " To install vundle, copy all the files from the repo into your respective
" " folders within ~/.vim


set nocompatible " Fuck VI... That's for grandpas.
filetype off


" ---------- Vundle Packages ----------

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" " Let vundle manage itself:
Plugin 'VundleVim/Vundle.vim'

" " Just a shitload of color schemes.
" " https://github.com/flazz/vim-colorschemes#current-colorschemes
Plugin 'flazz/vim-colorschemes'

" " Fuzzy finder -- absolutely must have.
Plugin 'kien/ctrlp.vim'

" " Support for easily toggling comments.
Plugin 'tpope/vim-commentary'

" Awesome statusline
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'

" Auto insert matching delimiters
Plugin 'Raimondi/delimitMate'

" Better ctag support
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'

" Project Tree Plugin
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin' " Git support

" " In addtion to the above plugins, you'll likely need some for individual
" " non-standard syntaxes that aren't pre-bundled with vim. Here are some I
" use,
" " these are required for me, but depending on what code you write,
" obviously
" " this may differ for you.

" " " Proper JSON filetype detection, and support.
" Plugin 'leshill/vim-json'
"
" " " vim already has syntax support for javascript, but the indent support is
" " " horrid. This fixes that.
" Plugin 'pangloss/vim-javascript'
"
" " " vim indents HTML very poorly on it's own. This fixes a lot of that.
" Plugin 'indenthtml.vim'
"
" " " I write markdown a lot. This is a good syntax.
" Plugin 'tpope/vim-markdown'
"
" " " LessCSS -- I use this every day.
" Plugin 'groenewege/vim-less'
"

call vundle#end()


" ---------- End Vundle Packages ----------


" " We have to turn this stuff back on if we want all of our features.
filetype plugin indent on " Filetype auto-detection
syntax on " Syntax highlighting

set mouse=a " enable mouse

set tabstop=4 " Tabs are 4 spaces
set shiftwidth=4
set softtabstop=4
set expandtab " use spaces instead of tabs.
set smarttab " let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround " tab / shifting moves to closest tabstop.
set autoindent " Match indents on new lines.
set smartindent " Intellegently dedent / indent new lines based on rules.

" " We have VCS -- we don't need this stuff.
set nobackup " We have vcs, we don't need backups.
set nowritebackup " We have vcs, we don't need backups.
set noswapfile " They're just annoying. Who likes them?

" " don't nag me when hiding buffers
"set hidden " allow me to have buffers with unsaved changes.
set autoread " when a file has changed on disk, just load it. Don't ask.

" " Make search more sane
set ignorecase " case insensitive search
set smartcase " If there are uppercase letters, become case-sensitive.
set incsearch " live incremental searching
set showmatch " live match highlighting
set hlsearch " highlight matches
set gdefault " use the `g` flag by default.

set number " show line numbers
set cursorline " highlight current line
set noruler " remove ruler so we can use statusline
set laststatus=2 "enable statusline
set statusline=[%n]\ %<%.99f\%h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16( %l,%c-%v\ %)%P

" " allow the cursor to go anywhere in visual block mode.
set virtualedit+=block

" " leader is a key that allows you to have your own "namespace" of keybindings.
" " You'll see it a lot below as <leader>
let mapleader = ","


" " So we don't have to press shift when we want to get into command mode.
nnoremap ; :
vnoremap ; :

" " So we don't have to reach for escape to leave insert mode.
inoremap jf <esc>

" " " create new vsplit, and switch to it.
" noremap <leader>v <C-w>v

" " bindings for easy split nav
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" " Use sane regex's when searching
" nnoremap / /\v
" vnoremap / /\v

" " Clear match highlighting
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" " Quick buffer switching - like cmd-tab'ing
nnoremap <leader><leader> <c-^>

" Pick a buffer from the open ones
nnoremap gb :ls<CR>:b<Space>

" " Visual line nav, not real line nav
" " If you wrap lines, vim by default won't let you move down one line to
" the
" " wrapped portion. This fixes that.
" " noremap j gj
" " noremap k gk

" " Plugin settings:
" " Below are some 'sane' (IMHO) defaults for a couple of the above plugins
" I referenced.
" "
" " Map the key for toggling comments with vim-commentary
nnoremap <leader>c <Plug>CommentaryLine

" " Remap ctrlp to ctrl-t -- map it however you like, or stick with the
" " defaults. Additionally, in my OS, I remap caps lock to control. I never
" " use
" " caps lock. This is highly recommended.
" let g:ctrlp_map = '<c-t>'

" " Let ctrlp have up to 30 results.
let g:ctrlp_max_height = 30

" " " Settings for airline (statusline plugin)
" " Show paste when pasting
" " let g:airline_detect_paste=1
"
" " Show airline for tabs too
" " let g:airline#extensions#tabline#enabled = 1

" " -------- delimitMate Settings --------

let delimitMate_expand_cr = 1
augroup mydelimitMate
    au!
    au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
    au FileType tex let b:delimitMate_quotes = ""
    au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
    au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" ----- xolox/vim-easytags settings -----
"  "Where to look for tags files
set tags=./tags;,~/.vimtags

"  "Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

"  " ----- majutsushi/tagbar settings -----
"  " Open/close tagbar with ,b
nmap <silent> <leader>b :TagbarToggle<CR>
"  " Uncomment to open tagbar automatically whenever possible
"  "autocmd BufEnter * nested :call tagbar#autoopen(0))

"  " ----- jistr/vim-nerdtree-tabs -----
"  " Open/close NERDTree Tabs with ,t
nmap <silent> <leader>t :NERDTreeToggle<CR>
"  " To have NERDTree always open on startup, set this to 1
"  let g:nerdtree_tabs_open_on_console_startup = 1

" " Finally the color scheme. Choose whichever you want from the list in the
" " link above (back up where we included the bundle of a ton of themes.)
set t_Co=256
colorscheme molokai
