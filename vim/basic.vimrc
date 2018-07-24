" " Basic Configurations

set t_Co=256
colorscheme wal
syntax on
set background=dark
highlight Normal ctermbg=black ctermfg=white

set mouse=a " enable mouse
set tabstop=4 " tabs are 4 spaces
set shiftwidth=4 " tabs are 4 spaces
set softtabstop=4 " tabs are... you guessed it... 4 spaces
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
" set hidden " allow me to have buffers with unsaved changes.
set autoread " when a file has changed on disk, just load it. Don't ask.

" " Make search more sane
set ignorecase " case insensitive search
set smartcase " If there are uppercase letters, become case-sensitive.
set incsearch " live incremental searching
set showmatch " live match highlighting
set hlsearch " highlight matches
set gdefault " use the `g` flag by default.

set scrolloff=2 " show 2 lines above/below cursor

" Make splits default to appear to the right and below
set splitbelow
set splitright

set number " show line numbers
set relativenumber " make line numbers relative
set cursorline " highlight current line
hi clear CursorLine
hi CursorLine gui=underline cterm=underline
hi CursorLineNr term=bold ctermfg=11
set noruler " remove ruler so we can use statusline
set noshowmode " remove -- MODE -- indicator (since we color statusline)

" Highlight lines over 80 and trailing whitespace
highlight EWOL ctermbg=darkgreen guibg=darkgreen
match EWOL '\s\+$\|\%>80v.\+'

" --- Persistent Undo ---
set undofile
set undodir=~/.vim/undodir
set undolevels=1000
set undoreload=10000

" allow the cursor to go anywhere in visual block mode.
set virtualedit+=block

" Better command-line completion
set wildmenu

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" leader is a key that allows you to have your own "namespace" of
" keybindings.
" You'll see it a lot below as <leader>
let mapleader = ","

" So we don't have to press shift when we want to get into command mode.
nnoremap ; :
vnoremap ; :

" So we dont need to reach for esc to leave insert mode
inoremap jf <esc>

" Create new vsplit, and switch to it.
noremap <leader>v <C-w>v

" Toggle line numbers
noremap <leader>n :set invnumber<CR>

" " bindings for easy split nav
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l

" Reindent and remove trailing whitespace
map <F7> mzgg=G`z:%s/\s\+$//e<cr>

" Clear match highlighting
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" Quick buffer switching - like cmd-tab'ing
nnoremap <leader><leader> <c-^>

" Shows open buffers, then pick one by number and press enter to open it
nnoremap gb :ls<CR>:b<Space>

" Language specific shit
autocmd FileType javascript.jsx setlocal shiftwidth=2 tabstop=2

" 'W' to write with sudo when you forget
command W w !sudo tee % > /dev/null

set listchars=tab:>-,trail:.,extends:>,precedes:<,space:.
nnoremap <leader>i :set list!<CR>
