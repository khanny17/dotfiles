" " Miscellaneous plugin settings

" --- vim-commentary ---
" Map the key for toggling comments
nnoremap <leader>c <Plug>CommentaryLine

" --- ctrlp ---
" Let ctrlp have up to 30 results.
let g:ctrlp_max_height = 30

" Exclude some commonly excluded directories and stuff
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" --- NERDTree ---
nmap <silent> <leader>t :NERDTreeToggle<CR>
